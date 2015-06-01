class AddIsCurrentToBin < ActiveRecord::Migration
  def change
    add_column :bins, :is_current, :boolean
  end
end
