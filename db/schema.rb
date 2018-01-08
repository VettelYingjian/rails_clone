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

ActiveRecord::Schema.define(version: 20180108032050) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, length: {"slug"=>70, "sluggable_type"=>nil, "scope"=>70}, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", length: {"slug"=>140, "sluggable_type"=>nil}, using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "pet_categories", force: :cascade do |t|
    t.integer "pet_id",      limit: 4
    t.integer "category_id", limit: 4
  end

  create_table "pets", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.text     "description",   limit: 65535
    t.string   "image",         limit: 255
    t.string   "breed",         limit: 255
    t.string   "contact_email", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",       limit: 4
  end

  create_table "thredded_categories", force: :cascade do |t|
    t.integer  "messageboard_id", limit: 4,   null: false
    t.string   "name",            limit: 191, null: false
    t.string   "description",     limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "slug",            limit: 191, null: false
  end

  add_index "thredded_categories", ["messageboard_id", "slug"], name: "index_thredded_categories_on_messageboard_id_and_slug", unique: true, using: :btree
  add_index "thredded_categories", ["messageboard_id"], name: "index_thredded_categories_on_messageboard_id", using: :btree
  add_index "thredded_categories", ["name"], name: "thredded_categories_name_ci", using: :btree

  create_table "thredded_messageboard_groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "position",   limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "thredded_messageboard_notifications_for_followed_topics", force: :cascade do |t|
    t.integer "user_id",         limit: 4,                 null: false
    t.integer "messageboard_id", limit: 4,                 null: false
    t.string  "notifier_key",    limit: 90,                null: false
    t.boolean "enabled",                    default: true, null: false
  end

  add_index "thredded_messageboard_notifications_for_followed_topics", ["user_id", "messageboard_id", "notifier_key"], name: "thredded_messageboard_notifications_for_followed_topics_unique", unique: true, using: :btree

  create_table "thredded_messageboard_users", force: :cascade do |t|
    t.integer  "thredded_user_detail_id",  limit: 4, null: false
    t.integer  "thredded_messageboard_id", limit: 4, null: false
    t.datetime "last_seen_at",                       null: false
  end

  add_index "thredded_messageboard_users", ["thredded_messageboard_id", "last_seen_at"], name: "index_thredded_messageboard_users_for_recently_active", using: :btree
  add_index "thredded_messageboard_users", ["thredded_messageboard_id", "thredded_user_detail_id"], name: "index_thredded_messageboard_users_primary", using: :btree
  add_index "thredded_messageboard_users", ["thredded_user_detail_id"], name: "fk_rails_06e42c62f5", using: :btree

  create_table "thredded_messageboards", force: :cascade do |t|
    t.string   "name",                  limit: 191,                   null: false
    t.string   "slug",                  limit: 191
    t.text     "description",           limit: 65535
    t.integer  "topics_count",          limit: 4,     default: 0
    t.integer  "posts_count",           limit: 4,     default: 0
    t.integer  "position",              limit: 4,                     null: false
    t.integer  "last_topic_id",         limit: 4
    t.integer  "messageboard_group_id", limit: 4
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.boolean  "locked",                              default: false, null: false
  end

  add_index "thredded_messageboards", ["messageboard_group_id"], name: "index_thredded_messageboards_on_messageboard_group_id", using: :btree
  add_index "thredded_messageboards", ["slug"], name: "index_thredded_messageboards_on_slug", using: :btree

  create_table "thredded_notifications_for_followed_topics", force: :cascade do |t|
    t.integer "user_id",      limit: 4,                 null: false
    t.string  "notifier_key", limit: 90,                null: false
    t.boolean "enabled",                 default: true, null: false
  end

  add_index "thredded_notifications_for_followed_topics", ["user_id", "notifier_key"], name: "thredded_notifications_for_followed_topics_unique", unique: true, using: :btree

  create_table "thredded_notifications_for_private_topics", force: :cascade do |t|
    t.integer "user_id",      limit: 4,                 null: false
    t.string  "notifier_key", limit: 90,                null: false
    t.boolean "enabled",                 default: true, null: false
  end

  add_index "thredded_notifications_for_private_topics", ["user_id", "notifier_key"], name: "thredded_notifications_for_private_topics_unique", unique: true, using: :btree

  create_table "thredded_post_moderation_records", force: :cascade do |t|
    t.integer  "post_id",                   limit: 4
    t.integer  "messageboard_id",           limit: 4
    t.text     "post_content",              limit: 65535
    t.integer  "post_user_id",              limit: 4
    t.text     "post_user_name",            limit: 65535
    t.integer  "moderator_id",              limit: 4
    t.integer  "moderation_state",          limit: 4,     null: false
    t.integer  "previous_moderation_state", limit: 4,     null: false
    t.datetime "created_at",                              null: false
  end

  add_index "thredded_post_moderation_records", ["messageboard_id", "created_at"], name: "index_thredded_moderation_records_for_display", using: :btree

  create_table "thredded_posts", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.text     "content",          limit: 65535
    t.string   "ip",               limit: 255
    t.string   "source",           limit: 255,   default: "web"
    t.integer  "postable_id",      limit: 4,                     null: false
    t.integer  "messageboard_id",  limit: 4,                     null: false
    t.integer  "moderation_state", limit: 4,                     null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "thredded_posts", ["content"], name: "thredded_posts_content_fts", type: :fulltext
  add_index "thredded_posts", ["messageboard_id"], name: "index_thredded_posts_on_messageboard_id", using: :btree
  add_index "thredded_posts", ["moderation_state", "updated_at"], name: "index_thredded_posts_for_display", using: :btree
  add_index "thredded_posts", ["postable_id"], name: "index_thredded_posts_on_postable_id_and_postable_type", using: :btree
  add_index "thredded_posts", ["user_id"], name: "index_thredded_posts_on_user_id", using: :btree

  create_table "thredded_private_posts", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.text     "content",     limit: 65535
    t.integer  "postable_id", limit: 4,     null: false
    t.string   "ip",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "thredded_private_topics", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "last_user_id", limit: 4
    t.string   "title",        limit: 255,             null: false
    t.string   "slug",         limit: 191,             null: false
    t.integer  "posts_count",  limit: 4,   default: 0
    t.string   "hash_id",      limit: 191,             null: false
    t.datetime "last_post_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "thredded_private_topics", ["hash_id"], name: "index_thredded_private_topics_on_hash_id", using: :btree
  add_index "thredded_private_topics", ["slug"], name: "index_thredded_private_topics_on_slug", using: :btree

  create_table "thredded_private_users", force: :cascade do |t|
    t.integer  "private_topic_id", limit: 4
    t.integer  "user_id",          limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "thredded_private_users", ["private_topic_id"], name: "index_thredded_private_users_on_private_topic_id", using: :btree
  add_index "thredded_private_users", ["user_id"], name: "index_thredded_private_users_on_user_id", using: :btree

  create_table "thredded_topic_categories", force: :cascade do |t|
    t.integer "topic_id",    limit: 4, null: false
    t.integer "category_id", limit: 4, null: false
  end

  add_index "thredded_topic_categories", ["category_id"], name: "index_thredded_topic_categories_on_category_id", using: :btree
  add_index "thredded_topic_categories", ["topic_id"], name: "index_thredded_topic_categories_on_topic_id", using: :btree

  create_table "thredded_topics", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "last_user_id",     limit: 4
    t.string   "title",            limit: 255,                 null: false
    t.string   "slug",             limit: 191,                 null: false
    t.integer  "messageboard_id",  limit: 4,                   null: false
    t.integer  "posts_count",      limit: 4,   default: 0,     null: false
    t.boolean  "sticky",                       default: false, null: false
    t.boolean  "locked",                       default: false, null: false
    t.string   "hash_id",          limit: 191,                 null: false
    t.string   "type",             limit: 191
    t.integer  "moderation_state", limit: 4,                   null: false
    t.datetime "last_post_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "thredded_topics", ["hash_id"], name: "index_thredded_topics_on_hash_id", using: :btree
  add_index "thredded_topics", ["messageboard_id"], name: "index_thredded_topics_on_messageboard_id", using: :btree
  add_index "thredded_topics", ["moderation_state", "sticky", "updated_at"], name: "index_thredded_topics_for_display", using: :btree
  add_index "thredded_topics", ["slug"], name: "index_thredded_topics_on_slug", unique: true, using: :btree
  add_index "thredded_topics", ["title"], name: "thredded_topics_title_fts", type: :fulltext
  add_index "thredded_topics", ["user_id"], name: "index_thredded_topics_on_user_id", using: :btree

  create_table "thredded_user_details", force: :cascade do |t|
    t.integer  "user_id",                     limit: 4,             null: false
    t.datetime "latest_activity_at"
    t.integer  "posts_count",                 limit: 4, default: 0
    t.integer  "topics_count",                limit: 4, default: 0
    t.datetime "last_seen_at"
    t.integer  "moderation_state",            limit: 4, default: 0, null: false
    t.datetime "moderation_state_changed_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "thredded_user_details", ["latest_activity_at"], name: "index_thredded_user_details_on_latest_activity_at", using: :btree
  add_index "thredded_user_details", ["moderation_state", "moderation_state_changed_at"], name: "index_thredded_user_details_for_moderations", using: :btree
  add_index "thredded_user_details", ["user_id"], name: "index_thredded_user_details_on_user_id", unique: true, using: :btree

  create_table "thredded_user_messageboard_preferences", force: :cascade do |t|
    t.integer  "user_id",                  limit: 4,                 null: false
    t.integer  "messageboard_id",          limit: 4,                 null: false
    t.boolean  "follow_topics_on_mention",           default: true,  null: false
    t.boolean  "auto_follow_topics",                 default: false, null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "thredded_user_messageboard_preferences", ["user_id", "messageboard_id"], name: "thredded_user_messageboard_preferences_user_id_messageboard_id", unique: true, using: :btree

  create_table "thredded_user_post_notifications", force: :cascade do |t|
    t.integer  "user_id",     limit: 4, null: false
    t.integer  "post_id",     limit: 4, null: false
    t.datetime "notified_at",           null: false
  end

  add_index "thredded_user_post_notifications", ["post_id"], name: "index_thredded_user_post_notifications_on_post_id", using: :btree
  add_index "thredded_user_post_notifications", ["user_id", "post_id"], name: "index_thredded_user_post_notifications_on_user_id_and_post_id", unique: true, using: :btree

  create_table "thredded_user_preferences", force: :cascade do |t|
    t.integer  "user_id",                  limit: 4,                 null: false
    t.boolean  "follow_topics_on_mention",           default: true,  null: false
    t.boolean  "auto_follow_topics",                 default: false, null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "thredded_user_preferences", ["user_id"], name: "index_thredded_user_preferences_on_user_id", unique: true, using: :btree

  create_table "thredded_user_private_topic_read_states", force: :cascade do |t|
    t.integer  "user_id",     limit: 4,             null: false
    t.integer  "postable_id", limit: 4,             null: false
    t.integer  "page",        limit: 4, default: 1, null: false
    t.datetime "read_at",                           null: false
  end

  add_index "thredded_user_private_topic_read_states", ["user_id", "postable_id"], name: "thredded_user_private_topic_read_states_user_postable", unique: true, using: :btree

  create_table "thredded_user_topic_follows", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "topic_id",   limit: 4, null: false
    t.datetime "created_at",           null: false
    t.integer  "reason",     limit: 1
  end

  add_index "thredded_user_topic_follows", ["user_id", "topic_id"], name: "thredded_user_topic_follows_user_topic", unique: true, using: :btree

  create_table "thredded_user_topic_read_states", force: :cascade do |t|
    t.integer  "user_id",     limit: 4,             null: false
    t.integer  "postable_id", limit: 4,             null: false
    t.integer  "page",        limit: 4, default: 1, null: false
    t.datetime "read_at",                           null: false
  end

  add_index "thredded_user_topic_read_states", ["user_id", "postable_id"], name: "thredded_user_topic_read_states_user_postable", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",          limit: 255
    t.string   "email",             limit: 255
    t.string   "firstname",         limit: 255
    t.string   "lastname",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest",   limit: 255
    t.boolean  "admin",                         default: false
    t.string   "reset_digest",      limit: 255
    t.datetime "reset_sent_at"
    t.string   "activation_digest", limit: 255
    t.boolean  "activated",                     default: false
    t.datetime "activated_at"
  end

  add_foreign_key "thredded_messageboard_users", "thredded_messageboards", on_delete: :cascade
  add_foreign_key "thredded_messageboard_users", "thredded_user_details", on_delete: :cascade
  add_foreign_key "thredded_user_post_notifications", "thredded_posts", column: "post_id", on_delete: :cascade
  add_foreign_key "thredded_user_post_notifications", "users", on_delete: :cascade
end
