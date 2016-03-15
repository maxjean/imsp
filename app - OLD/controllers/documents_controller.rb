class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    puts "IN PARAMS NEW:#{params}"
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
    puts "IN PARAMS EDIT:#{params}"
  end

  # POST /documents
  # POST /documents.json
  def create
    puts "IN PARAMS CREATE:#{params}"
    @my_bin = Bin.find(params[:document][:bin_id])
    @my_bin.documents.new(document_params)

    respond_to do |format|
      if @my_bin.save
        format.html { redirect_to modify_bin_path(:my_bin => @my_bin.id, :my_event => @my_bin.event_id), notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @my_bin }
      else
        format.html { render :new }
        format.json { render json: @my_bin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    @my_bin = Bin.find(params[:document][:bin_id])
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to modify_bin_path(:my_bin => params[:document][:bin_id], :my_event => @my_bin.event_id), notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to modify_bin_path(:my_bin => params[:my_bin], :my_event => params[:my_event]), notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit!
    end
end
