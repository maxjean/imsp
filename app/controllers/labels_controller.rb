class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]

  # GET /labels
  # GET /labels.json
  def index
    @labels = Label.all
  end

  # GET /labels/1
  # GET /labels/1.json
  def show
  end

  # GET /labels/new
  def new
    @label = Label.new
  end

  # GET /labels/1/edit
  def edit
    puts "IN PARAMS EDIT:#{params}"
  end

  # POST /labels
  # POST /labels.json
  def create
    @my_bin = Bin.find(params[:label][:bin_id])
    @my_bin.labels.new(label_params)

    respond_to do |format|
      if @my_bin.save
        format.html { redirect_to modify_bin_path(:my_bin => @my_bin.id, :my_event => @my_bin.event_id), notice: 'Label was successfully created.' }
        format.json { render :show, status: :created, location: @my_bin }
      else
        format.html { render :new }
        format.json { render json: @my_bin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labels/1
  # PATCH/PUT /labels/1.json
  def update
    @my_bin = Bin.find(params[:label][:bin_id])
    respond_to do |format|
      if @label.update(label_params)
        format.html { redirect_to modify_bin_path(:my_bin => params[:label][:bin_id], :my_event => @my_bin.event_id), notice: 'Label was successfully updated.' }
        format.json { render :show, status: :ok, location: @label }
      else
        format.html { render :edit }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labels/1
  # DELETE /labels/1.json
  def destroy
    @label.destroy
    respond_to do |format|
      format.html { redirect_to modify_bin_path(:my_bin => params[:my_bin], :my_event => params[:my_event]), notice: 'Label was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = Label.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def label_params
      params.require(:label).permit!
    end
end
