class AddMediaTimelineIdToBin < ActiveRecord::Migration
  def change
    add_column :bins, :media_timeline_id, :integer
  end
end
