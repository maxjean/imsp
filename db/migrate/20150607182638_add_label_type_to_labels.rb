class AddLabelTypeToLabels < ActiveRecord::Migration
  def change
    add_column :labels, :label_type, :string
  end
end
