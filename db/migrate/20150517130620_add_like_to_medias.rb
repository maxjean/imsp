class AddLikeToMedias < ActiveRecord::Migration
  def change
    add_column :medias, :like, :decimal
  end
end
