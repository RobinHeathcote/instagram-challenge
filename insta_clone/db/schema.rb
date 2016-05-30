

ActiveRecord::Schema.define(version: 20160529183551) do


  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "post_id"
  end

  add_index "comments", ["post_id"],
    name: "index_comments_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "caption"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "user_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true,
   using: :btree
  add_index "users", ["reset_password_token"],
    name: "index_users_on_reset_password_token",
    unique: true, using: :btree
  add_index "users", ["user_name"], name: "index_users_on_user_name",
  unique: true, using: :btree

  add_foreign_key "comments", "posts"
  add_foreign_key "posts", "users"
end
