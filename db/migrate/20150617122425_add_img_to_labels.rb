class AddImgToLabels < ActiveRecord::Migration
  def change
    add_column :labels, :img, :string
  end
end
