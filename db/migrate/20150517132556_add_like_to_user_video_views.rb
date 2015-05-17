class AddLikeToUserVideoViews < ActiveRecord::Migration
  def change
    add_column :user_video_views, :like, :boolean
  end
end
