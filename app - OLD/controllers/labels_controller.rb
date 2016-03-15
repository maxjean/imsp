class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]
  after_filter :set_quiz_url, only: [:create, :update]


  # GET /labels
  # GET /labels.json
  def index
    @labels = Label.all
  end

  # GET /labels/1
  # GET /labels/1.json
  def show
    if request.xhr?
      if params[:id].to_i == 0
        #binding.debugger
        @selected_label_type = session[:selected_label_type]

        if @selected_label_type == "quiz"
          render :partial => "label_type_quiz"
        elsif @selected_label_type == "score"
          render :partial => "label_type_score"
        end
      else
        render :nothing => true
      end
    end
  end

  # GET /labels/new
  def new
    @label = Label.new
   # binding.debugger
    if request.xhr?
      binding.debugger
      if params[:label][:label_type] != nil
        session[:selected_label_type] = params[:label][:label_type]
      end
    end
  end

  # GET /labels/1/edit
  def edit
    puts "IN PARAMS EDIT:#{params}"
    #session[:selected_label_type] = params[:label][:label_type] unless nil
  end

  # POST /labels
  # POST /labels.json
  def create
    @my_bin = Bin.find(params[:label][:bin_id])
    @my_label = @my_bin.labels.new(label_params)
    if params[:label][:label_type] == "quiz"
      @my_label.question = params[:question]
      @my_label.field1 = params[:field1]
      @my_label.field2 = params[:field2]
      @my_label.field3 = params[:field3]
      @my_label.field4 = params[:field4]
      @my_label.correct_field = params[:correct_field]
    elsif params[:label][:label_type] == "score"
      @my_label.question = params[:question]
      @my_label.field1 = params[:field1]
      @my_label.field2 = params[:field2]
      @my_label.score_field1 = params[:score_field1]
      @my_label.score_field2 = params[:score_field2]
    end
    respond_to do |format|
      if @my_bin.save
        @my_label.save!
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

    if params[:label][:label_type] == "quiz"
      @label.update_attributes(:field1 => params[:field1], :field2 => params[:field2], :field3 => params[:field3], :field4 => params[:field4], :question => params[:question], :correct_field => params[:correct_field])
    elsif params[:label][:label_type] == "score"
      @label.update_attributes(:field1 => params[:field1], :field2 => params[:field2], :score_field1 => params[:score_field1], :score_field2 => params[:score_field2], :question => params[:question])
    end

      respond_to do |format|
      #if @label.update(label_params)
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
    #construct url for label quiz link
    def set_quiz_url
      if params[:action] == "create"
        event_id = @my_label.bin.event.id
        @my_label.quiz_url = "/quiz?event=#{event_id}&label=#{@my_label.id}"
        @my_label.save!
      elsif params[:action] == "update"
        event_id = @label.bin.event.id
        @label.quiz_url = "/quiz?event=#{event_id}&label=#{@label.id}"
        @label.save!
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = Label.find(params[:id]) unless params[:id].to_i == 0
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def label_params
      params.require(:label).permit!
    end
end
