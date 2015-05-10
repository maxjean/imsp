class AddVideoToMedias < ActiveRecord::Migration
  def change
    add_column :medias, :video, :string
  end
end
