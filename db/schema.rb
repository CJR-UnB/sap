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

ActiveRecord::Schema.define(version: 20160212134333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "description"
    t.integer  "credit_numbers"
    t.integer  "activity_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "activities", ["activity_type_id"], name: "index_activities_on_activity_type_id", using: :btree

  create_table "activities_members", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "activities_members", ["activity_id"], name: "index_activities_members_on_activity_id", using: :btree
  add_index "activities_members", ["member_id"], name: "index_activities_members_on_member_id", using: :btree

  create_table "activity_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.integer  "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "areas", ["sector_id"], name: "index_areas_on_sector_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "knowledge_levels", force: :cascade do |t|
    t.string   "level"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "knowledge_requests", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "knowledge_id"
    t.integer  "request_status_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "knowledge_requests", ["knowledge_id"], name: "index_knowledge_requests_on_knowledge_id", using: :btree
  add_index "knowledge_requests", ["member_id"], name: "index_knowledge_requests_on_member_id", using: :btree
  add_index "knowledge_requests", ["request_status_id"], name: "index_knowledge_requests_on_request_status_id", using: :btree

  create_table "knowledges", force: :cascade do |t|
    t.string   "description"
    t.integer  "knowledge_level_id"
    t.integer  "technology_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "knowledges", ["knowledge_level_id"], name: "index_knowledges_on_knowledge_level_id", using: :btree
  add_index "knowledges", ["technology_id"], name: "index_knowledges_on_technology_id", using: :btree

  create_table "knowledges_members", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "knowledge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "knowledges_members", ["knowledge_id"], name: "index_knowledges_members_on_knowledge_id", using: :btree
  add_index "knowledges_members", ["member_id"], name: "index_knowledges_members_on_member_id", using: :btree

  create_table "member_statuses", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "members", force: :cascade do |t|
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
    t.string   "name"
    t.string   "last_name"
    t.integer  "job_id"
    t.integer  "sector_id"
    t.integer  "area_id"
    t.integer  "member_status_id"
    t.integer  "role_id"
  end

  add_index "members", ["area_id"], name: "index_members_on_area_id", using: :btree
  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["job_id"], name: "index_members_on_job_id", using: :btree
  add_index "members", ["member_status_id"], name: "index_members_on_member_status_id", using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree
  add_index "members", ["role_id"], name: "index_members_on_role_id", using: :btree
  add_index "members", ["sector_id"], name: "index_members_on_sector_id", using: :btree

  create_table "members_projects", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "project_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "project_role_id"
  end

  add_index "members_projects", ["member_id"], name: "index_members_projects_on_member_id", using: :btree
  add_index "members_projects", ["project_id"], name: "index_members_projects_on_project_id", using: :btree
  add_index "members_projects", ["project_role_id"], name: "index_members_projects_on_project_role_id", using: :btree

  create_table "project_histories", force: :cascade do |t|
    t.text     "observation"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "project_histories", ["project_id"], name: "index_project_histories_on_project_id", using: :btree

  create_table "project_member_histories", force: :cascade do |t|
    t.text     "observation"
    t.integer  "member_id"
    t.integer  "project_id"
    t.integer  "project_role_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "project_member_histories", ["member_id"], name: "index_project_member_histories_on_member_id", using: :btree
  add_index "project_member_histories", ["project_id"], name: "index_project_member_histories_on_project_id", using: :btree
  add_index "project_member_histories", ["project_role_id"], name: "index_project_member_histories_on_project_role_id", using: :btree

  create_table "project_roles", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "project_statuses", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "description"
    t.float    "price"
    t.integer  "project_status_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "start_date"
    t.string   "end_date"
    t.string   "git"
    t.string   "heroku"
  end

  add_index "projects", ["project_status_id"], name: "index_projects_on_project_status_id", using: :btree

  create_table "request_histories", force: :cascade do |t|
    t.integer  "knowledge_request_id"
    t.text     "observation"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "request_histories", ["knowledge_request_id"], name: "index_request_histories_on_knowledge_request_id", using: :btree

  create_table "request_statuses", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "short_name"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "suggested_activities", force: :cascade do |t|
    t.string   "activity"
    t.integer  "activity_type_id"
    t.integer  "member_id"
    t.integer  "request_status_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "credit_numbers"
  end

  add_index "suggested_activities", ["activity_type_id"], name: "index_suggested_activities_on_activity_type_id", using: :btree
  add_index "suggested_activities", ["member_id"], name: "index_suggested_activities_on_member_id", using: :btree
  add_index "suggested_activities", ["request_status_id"], name: "index_suggested_activities_on_request_status_id", using: :btree

  create_table "technologies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "activities", "activity_types"
  add_foreign_key "activities_members", "activities"
  add_foreign_key "activities_members", "members"
  add_foreign_key "areas", "sectors"
  add_foreign_key "knowledge_requests", "knowledges"
  add_foreign_key "knowledge_requests", "members"
  add_foreign_key "knowledge_requests", "request_statuses"
  add_foreign_key "knowledges", "knowledge_levels"
  add_foreign_key "knowledges", "technologies"
  add_foreign_key "knowledges_members", "knowledges"
  add_foreign_key "knowledges_members", "members"
  add_foreign_key "members", "areas"
  add_foreign_key "members", "jobs"
  add_foreign_key "members", "member_statuses"
  add_foreign_key "members", "roles"
  add_foreign_key "members", "sectors"
  add_foreign_key "members_projects", "members"
  add_foreign_key "members_projects", "project_roles"
  add_foreign_key "members_projects", "projects"
  add_foreign_key "project_histories", "projects"
  add_foreign_key "project_member_histories", "members"
  add_foreign_key "project_member_histories", "project_roles"
  add_foreign_key "project_member_histories", "projects"
  add_foreign_key "projects", "project_statuses"
  add_foreign_key "request_histories", "knowledge_requests"
  add_foreign_key "suggested_activities", "activity_types"
  add_foreign_key "suggested_activities", "members"
  add_foreign_key "suggested_activities", "request_statuses"
end
