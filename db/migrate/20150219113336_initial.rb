class Initial < ActiveRecord::Migration
  def self.up

    #users
    create_table :users, id: :uuid  do |t|
      t.string  :email
      t.string  :firstname
      t.string  :lastname
      t.string  :channel_name
      t.string  :pseudo
      t.string  :phone
      t.string  :address
      t.string  :zip_code
      t.string  :city
      t.string  :states
      t.string  :country
      t.string  :isAdmin
      t.string  :profil
      t.string  :cover
      t.string  :last_connexion
      t.string  :last_device_used
      t.text    :tags
      t.timestamps
    end

    create_table :user_subscriptions do |t|
      t.uuid  :channel_id
      t.uuid  :user_id
      t.timestamps
    end

    create_table :user_on_hold_videos do |t|
      t.uuid  :user_id
      t.uuid  :media_id
      t.boolean :seen, default: false
      t.timestamps
    end

    create_table :user_abouts do |t|
      t.uuid  :user_id
      t.text  :description
      t.timestamps
    end

    create_table :user_video_views do |t|
      t.uuid        :user_id
      t.uuid        :media_id
      t.datetime    :last_time_seen
      t.string      :category
      t.string      :genre
      t.string      :type
      t.timestamps
    end

    #events
    create_table  :events, id: :uuid do |t|
      t.uuid      :user_id
      t.string    :title
      t.string    :address
      t.string    :zip_code
      t.string    :city
      t.string    :states
      t.string    :country
      t.datetime  :beginning_datetime
      t.datetime  :finishing_datetime
      t.boolean   :is_live, default: true
      t.text      :description
      t.timestamps
    end

    create_table :events_playlists, id: false do |t|
      t.uuid  :event_id
      t.uuid  :playlist_id
    end

    create_table :events_medias, id: false do  |t|
      t.uuid  :event_id
      t.uuid  :media_id
    end

    #system profils
    create_table  :system_profils do |t|
      t.string  :title
      t.string  :parameters
      t.text    :description
      t.timestamps
    end

    #medias
    create_table  :medias, id: :uuid do |t|
      t.references :system_profil, null: false
      t.references :media_category
      t.string     :title
      t.string     :authors
      t.string     :file
      t.time       :duration
      t.string     :added_by
      t.string     :status
      t.string     :img
      t.string     :is_live
      t.boolean    :is_available
      t.integer    :nb_views
      t.text       :tags
      t.timestamps
    end

    create_table :media_treatments do |t|
      t.uuid    :media_id
      t.string  :subtitle
      t.string  :name
      t.string  :error
      t.float   :progression
      t.timestamps
    end

    create_table :media_categories do |t|
      t.string  :name
      t.string  :genre
      t.string  :type
      t.text    :description
      t.timestamps
    end

    create_table :medias_playlists, id: false do  |t|
      t.uuid  :media_id
      t.uuid  :playlist_id
    end

    #playlists
    create_table :playlists, id: :uuid do |t|
      t.string    :title
      t.uuid      :user_id
      t.string    :cover
      t.text      :tags
      t.timestamps
    end

    create_table :category_of_playlists_channels do |t|
      t.string  :title
      t.text    :description
      t.string  :cover
      t.uuid    :channel_uid
      t.timestamps
    end

    create_table :category_of_playlists_channels_playlists, id: false do |t|
      t.references  :category_of_playlists_channel, null: false
      t.uuid  :playlist_id, null: false
    end

    #channels
    create_table :channels, id: :uuid do |t|
      t.string  :title
      t.integer :nb_views
      t.integer :nb_subscribers
      t.string  :profil
      t.string  :cover
      t.text    :presentation_text
      t.string  :presentation_video
      t.uuid    :user_id
      t.text    :tags
      t.timestamps
    end

    #bins
    create_table :bins do |t|
      t.string  :title
      t.uuid    :event_id
      t.boolean :is_display
      t.timestamps
    end

    create_table :documents do |t|
      t.string      :title
      t.references  :bin
      t.boolean     :is_display
      t.string      :authors
      t.string      :file
      t.string      :added_by
      t.text        :description
      t.timestamps
    end

    create_table :labels do |t|
      t.string      :title
      t.references  :bin
      t.boolean     :is_display
      t.string      :authors
      t.string      :file
      t.string      :added_by
      t.text        :description
      t.timestamps
    end

    create_table :comments, id: :uuid do |t|
      t.uuid    :initial_comment_id  #initial comment_id => response
      t.uuid    :user_id #sender
      t.text    :content
      t.belongs_to :commentable, polymorphic: true
      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]

    puts "All initial tables have been created!!!"

  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
