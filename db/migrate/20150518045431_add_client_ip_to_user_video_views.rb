class AddClientIpToUserVideoViews < ActiveRecord::Migration
  def change
    add_column :user_video_views, :client_ip, :string
  end
end
