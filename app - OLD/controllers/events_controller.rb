class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  # GET /events
  # GET /events.json
  def index
    @events = current_user.events
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = set_event
    @event_bin = @event.bins.where(:is_current => true)[0]
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_bin
    if params[:your_event]
      @your_event = params[:your_event]
    elsif params[:event_id]
      @bin = Bin.create!(:event_id => params[:event_id], :title => params[:title], :is_display => params[:is_display])
      if @bin.save
        @timeline = @bin
        respond_to do |format|
          format.html { redirect_to("/events/#{params[:event_id]}", notice: 'Bin was succesfully created.') }
        end
      end
    end
  end

  def modify_bin
    if params[:my_event]
      @my_event = Event.find(params[:my_event])
      @my_bin = Bin.find(params[:my_bin])
    elsif params[:event_id]
      @bin = Bin.find(params[:my_bin])

      if params[:is_current] == "1"
         Bin.where.not(:id => @bin.id).update_all(:is_current => false)
      end

      #binding.debugger
      @bin.update_attributes!(:event_id => params[:event_id], :title => params[:title], :is_display => params[:is_display], :is_current => params[:is_current], :media_id => params[:media][:id], )
      @media_timeline_attributes = params[:bin][:media_timeline_attributes]
      if @media_timeline_attributes.present?
        @media_timeline_attributes.each do |media_timeline_attribute|
          @db_media_timeline_attribute = @bin.media_timelines.find_by_id(media_timeline_attribute[0])
          if @db_media_timeline_attribute.present?
            if media_timeline_attribute[1][:_destroy] == "0"
              @db_media_timeline_attribute.time = media_timeline_attribute[1][:time]
              @db_media_timeline_attribute.label_id = media_timeline_attribute[1][:label_id]
              @db_media_timeline_attribute.document_id = media_timeline_attribute[1][:document_id]
              @db_media_timeline_attribute.bin_id = params[:my_bin]
              @db_media_timeline_attribute.save!
            elsif media_timeline_attribute[1][:_destroy] == "1"
              @db_media_timeline_attribute.destroy!
            end
          end
        end
      end

      if @bin.save
        respond_to do |format|
          format.html { redirect_to("/events/#{params[:event_id]}", notice: 'Bin was successfully updated.')}
        end
      end
    end
  end

  def quiz
    @label = Label.find(params[:label])
    if @label.is_display == true
      if @label.labels_users_answers.find_by_user_id(current_user.id).present? && @label.gives_results == true
        render :quiz_results #OKAY
      else
        render :quiz  #OKAY
      end
    else
      "redirect_to the event viewing page"
      "not yet accessible, please try again later."
    end

    if request.xhr?
      if params[:select_field]
        if !@label.labels_users_answers.find_by_user_id(current_user.id).present?
          @label.labels_users_answers.create(:user_id => current_user.id, :answer => params[:select_field], :quiz_step => "quiz_results")
          if @label.is_display == true && @label.gives_results == true
            puts "render-quiz-results xhr"
            render :quiz_results #OKAY
          else
            puts "redirect-quiz-results to viewing1"
            render :quiz
          end
        else
          puts "redirect-quiz-results to viewing2" #you already answered!, please back again to check result, in xxxtimes remaining
          render :quiz
        end
      end
      #binding.debugger
    end

    #binding.debugger
  end

  def media_timeline_api
    current_event = session[:event]
    current_event_ref = current_event[0]["event_id"]
    current_event = Event.find(current_event_ref)

    ebins = current_event.bins.where(:is_current => true)
    ebin = ebins[0]

    current_media_timelines = ebin.media_timelines.includes(:document, :label).order(time: :asc)
    media_timelines = []
    current_media_timelines.each do |mt| media_timelines << { "time" => Time.parse(mt.time.to_s).seconds_since_midnight, "label" => mt.label, "document" => mt.document } end

    media_timeline_api = media_timelines
    #binding.debugger
    render :json => media_timeline_api
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit!
    end
end
