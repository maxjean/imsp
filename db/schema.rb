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

ActiveRecord::Schema.define(version: 20150604134523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "bins", force: :cascade do |t|
    t.string   "title"
    t.uuid     "event_id"
    t.boolean  "is_display"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "media_timeline_id"
    t.boolean  "is_current"
    t.uuid     "media_id"
  end

  create_table "category_of_playlists_channels", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "cover"
    t.uuid     "channel_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "channel_id"
  end

  create_table "category_of_playlists_channels_playlists", id: false, force: :cascade do |t|
    t.integer "category_of_playlists_channel_id", null: false
    t.uuid    "playlist_id",                      null: false
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

  create_table "comments", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "initial_comment_id"
    t.uuid     "user_id"
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.integer  "bin_id"
    t.boolean  "is_display"
    t.string   "authors"
    t.string   "added_by"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
  end

  create_table "events", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.string   "title"
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

  create_table "events_medias", id: false, force: :cascade do |t|
    t.uuid "event_id"
    t.uuid "media_id"
  end

  create_table "events_playlists", id: false, force: :cascade do |t|
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
    t.string   "name"
    t.string   "genre"
    t.string   "type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "media_treatments", force: :cascade do |t|
    t.uuid     "media_id"
    t.string   "subtitle"
    t.string   "name"
    t.string   "error"
    t.float    "progression"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medias", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.integer  "system_profil_id",                null: false
    t.integer  "media_category_id"
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
    t.text     "description"
    t.string   "form_step"
    t.string   "video"
    t.datetime "deployed_at"
    t.decimal  "like",              default: 0.0
    t.decimal  "dislike",           default: 0.0
  end

  create_table "medias_playlists", id: false, force: :cascade do |t|
    t.uuid "media_id"
    t.uuid "playlist_id"
  end

  create_table "medias_timeline", force: :cascade do |t|
    t.time     "time"
    t.integer  "bin_id"
    t.integer  "label_id"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playlists", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "title"
    t.uuid     "user_id"
    t.string   "cover"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

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

  create_table "user_on_hold_videos", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "media_id"
    t.boolean  "seen",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_subscriptions", force: :cascade do |t|
    t.uuid     "channel_id"
    t.uuid     "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_video_views", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "media_id"
    t.datetime "last_time_seen"
    t.string   "category"
    t.string   "genre"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "dislike"
    t.boolean  "like",           default: false
    t.string   "client_ip"
  end

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "name"
    t.string   "channel_name"
    t.string   "pseudo"
    t.string   "phone"
    t.string   "address"
    t.string   "zip_code"
    t.string   "city"
    t.string   "states"
    t.string   "country"
    t.boolean  "isAdmin"
    t.string   "profil"
    t.string   "cover"
    t.string   "last_device_used"
    t.text     "tags"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "limit_pseudo_change"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
