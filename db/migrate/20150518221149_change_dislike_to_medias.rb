class ChangeDislikeToMedias < ActiveRecord::Migration
  def change
    change_column :medias, :dislike, :decimal, :default => 0.0
  end
end
