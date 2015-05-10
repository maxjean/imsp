class AddDeployedAtToMedias < ActiveRecord::Migration
  def change
    add_column :medias, :deployed_at, :datetime
  end
end
