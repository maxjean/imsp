class ChangeLikeToMedias < ActiveRecord::Migration
  def change
    change_column :medias, :like, :decimal, :default => 0.0
  end
end
