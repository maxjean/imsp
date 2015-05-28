class CreateMediasTimeline < ActiveRecord::Migration
  def change
    create_table :medias_timeline do |t|
      t.time :time
      t.references :bin
      t.integer :label_id
      t.integer :document_id
      t.timestamps
    end
  end

  def down
    drop_table :medias_timeline
  end
end
