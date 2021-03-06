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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130930222056) do

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.string   "teacher"
    t.integer  "credits"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "courses", ["user_id"], :name => "index_courses_on_user_id"

  create_table "exams", :force => true do |t|
    t.integer  "course_id"
    t.datetime "dt_exam"
    t.string   "location"
    t.decimal  "grade"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "exams", ["user_id"], :name => "index_exams_on_user_id"

  create_table "grades", :force => true do |t|
    t.decimal  "value"
    t.integer  "exam_id"
    t.integer  "unit_id"
    t.integer  "matter_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sections", :force => true do |t|
    t.string   "description"
    t.decimal  "grade"
    t.boolean  "done"
    t.integer  "work_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  add_index "sections", ["user_id"], :name => "index_sections_on_user_id"

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.integer  "exam_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "subjects", ["user_id"], :name => "index_subjects_on_user_id"

  create_table "units", :force => true do |t|
    t.string   "title"
    t.integer  "matter_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "registration"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "works", :force => true do |t|
    t.string   "title"
    t.string   "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "final_dt"
    t.integer  "user_id"
    t.integer  "unit_id"
  end

  add_index "works", ["user_id"], :name => "index_works_on_user_id"

end
