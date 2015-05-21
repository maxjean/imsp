class CreateMediasTimeline < ActiveRecord::Migration
  def change
    create_table :medias_timeline do |t|
      t.time :time
      t.integer :bin_id
      t.integer :label_id
      t.integer :document_id

      t.timestamps
    end
  end
end
