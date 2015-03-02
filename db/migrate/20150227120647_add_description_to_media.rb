class AddDescriptionToMedia < ActiveRecord::Migration
  def change
    add_column :medias, :description, :text
  end
end
