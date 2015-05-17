class AddDislikeToUserVideoViews < ActiveRecord::Migration
  def change
    add_column :user_video_views, :dislike, :boolean
  end
end
