class MediaTimelinesController < ApplicationController

  def destroy
    @media_timeline.destroy
    respond_to do |format|
      format.html { redirect_to modify_bin_path(:my_bin => params[:my_bin], :my_event => params[:my_event]), notice: 'MediaTimeline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_media_timeline
    @media_timeline = MediaTimeline.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def media_timeline_params
    params.require(:media_timeline).permit!
  end
end
