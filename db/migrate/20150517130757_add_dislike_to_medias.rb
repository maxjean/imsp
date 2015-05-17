class AddDislikeToMedias < ActiveRecord::Migration
  def change
    add_column :medias, :dislike, :decimal
  end
end
