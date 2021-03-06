# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_12_043849) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "bottomcomments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "bottom_id", null: false
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bottom_id"], name: "index_bottomcomments_on_bottom_id"
    t.index ["user_id"], name: "index_bottomcomments_on_user_id"
  end

  create_table "bottoms", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.integer "color"
    t.string "brand"
    t.text "review"
    t.integer "status", default: 0, null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.integer "address"
    t.integer "destination"
    t.string "cityname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "hour"
  end

  create_table "innercomments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "inner_id", null: false
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inner_id"], name: "index_innercomments_on_inner_id"
    t.index ["user_id"], name: "index_innercomments_on_user_id"
  end

  create_table "inners", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.integer "color"
    t.string "brand"
    t.text "review"
    t.integer "status", default: 0, null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "outercomments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "outer_id", null: false
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["outer_id"], name: "index_outercomments_on_outer_id"
    t.index ["user_id"], name: "index_outercomments_on_user_id"
  end

  create_table "outers", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.integer "color"
    t.string "brand"
    t.text "review"
    t.integer "status", default: 0, null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "post_tags", force: :cascade do |t|
    t.integer "outer_id"
    t.integer "inner_id"
    t.integer "bottom_id"
    t.integer "shoe_id"
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bottom_id"], name: "index_post_tags_on_bottom_id"
    t.index ["inner_id"], name: "index_post_tags_on_inner_id"
    t.index ["outer_id"], name: "index_post_tags_on_outer_id"
    t.index ["shoe_id"], name: "index_post_tags_on_shoe_id"
    t.index ["tag_id"], name: "index_post_tags_on_tag_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shoecomments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "shoe_id", null: false
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shoe_id"], name: "index_shoecomments_on_shoe_id"
    t.index ["user_id"], name: "index_shoecomments_on_user_id"
  end

  create_table "shoes", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.integer "color"
    t.string "brand"
    t.text "review"
    t.integer "status", default: 0, null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "address"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_deleted", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bottomcomments", "bottoms"
  add_foreign_key "bottomcomments", "users"
  add_foreign_key "innercomments", "inners"
  add_foreign_key "innercomments", "users"
  add_foreign_key "outercomments", "outers"
  add_foreign_key "outercomments", "users"
  add_foreign_key "post_tags", "bottoms"
  add_foreign_key "post_tags", "inners"
  add_foreign_key "post_tags", "outers"
  add_foreign_key "post_tags", "shoes"
  add_foreign_key "post_tags", "tags"
  add_foreign_key "shoecomments", "shoes"
  add_foreign_key "shoecomments", "users"
end
