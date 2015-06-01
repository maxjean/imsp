class AddMediaIdToBin < ActiveRecord::Migration
  def change
    add_column :bins, :media_id, :uuid
  end
end
