class AddColumnCoverToEvent < ActiveRecord::Migration
  def change
    add_column :events, :cover, :string
  end
end
