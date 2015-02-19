# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150219120843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "bins", force: :cascade do |t|
    t.string  "title"
    t.uuid    "event_id"
    t.boolean "is_display"
  end

  create_table "category_of_playlists_channels", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "cover"
    t.uuid     "channel_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_of_playlists_channels_playlists_join", force: :cascade do |t|
    t.uuid "category_of_playlists_channel_id"
    t.uuid "playlist_id"
  end

  create_table "channel_comments", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "channel_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "channel_comments_users_join", force: :cascade do |t|
    t.uuid     "channel_comment_id"
    t.uuid     "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "channels", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "title"
    t.integer  "nb_views"
    t.integer  "nb_subscribers"
    t.string   "profil"
    t.string   "cover"
    t.text     "presentation_text"
    t.string   "presentation_video"
    t.uuid     "user_id"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.integer  "bin_id"
    t.boolean  "is_display"
    t.string   "authors"
    t.string   "file"
    t.string   "added_by"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "address"
    t.string   "zip_code"
    t.string   "city"
    t.string   "states"
    t.string   "country"
    t.datetime "beginning_datetime"
    t.datetime "finishing_datetime"
    t.boolean  "is_live",            default: true
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_medias_join", force: :cascade do |t|
    t.uuid "event_id"
    t.uuid "media_id"
  end

  create_table "events_playlists_join", force: :cascade do |t|
    t.uuid "event_id"
    t.uuid "playlist_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string   "title"
    t.integer  "bin_id"
    t.boolean  "is_display"
    t.string   "authors"
    t.string   "file"
    t.string   "added_by"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media_categories", force: :cascade do |t|
    t.uuid     "media_id"
    t.string   "name"
    t.string   "genre"
    t.string   "type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media_comments", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "media_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media_comments_users_join", force: :cascade do |t|
    t.uuid     "media_comment_id"
    t.uuid     "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media_processes", force: :cascade do |t|
    t.string   "subtitle"
    t.string   "name"
    t.uuid     "media_id"
    t.string   "error"
    t.float    "progression"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medias", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.integer  "system_profil_id", null: false
    t.string   "title"
    t.string   "authors"
    t.string   "file"
    t.time     "duration"
    t.string   "added_by"
    t.string   "status"
    t.string   "img"
    t.string   "is_live"
    t.boolean  "is_available"
    t.integer  "nb_views"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medias_playlists_join", force: :cascade do |t|
    t.uuid "media_id"
    t.uuid "playlist_id"
  end

  create_table "playlists", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "title"
    t.uuid     "user_id"
    t.string   "cover"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "system_profils", force: :cascade do |t|
    t.string   "title"
    t.string   "parameters"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_abouts", force: :cascade do |t|
    t.uuid     "user_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_subscriptions", force: :cascade do |t|
    t.uuid     "channel_id"
    t.uuid     "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_video_seens", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "media_id"
    t.datetime "last_time_seen"
    t.string   "category"
    t.string   "genre"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_watch_later", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "media_id"
    t.boolean  "seen",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "channel_name"
    t.string   "pseudo"
    t.string   "phone"
    t.string   "address"
    t.string   "zip_code"
    t.string   "city"
    t.string   "states"
    t.string   "country"
    t.string   "isAdmin"
    t.string   "profil"
    t.string   "cover"
    t.string   "last_connexion"
    t.string   "last_device_used"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
