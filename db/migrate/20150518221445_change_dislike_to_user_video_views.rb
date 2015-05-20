class ChangeDislikeToUserVideoViews < ActiveRecord::Migration
  def change
    change_column :user_video_views, :like, :boolean, :default => false
  end
end
