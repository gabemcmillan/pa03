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

ActiveRecord::Schema.define(:version => 20130611233610) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "advicepost_prices", :force => true do |t|
    t.integer  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "pricelabel"
  end

  create_table "adviceposts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "categoryname"
    t.string   "miniresume",    :limit => 2000
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "price"
    t.integer  "advisor_id"
    t.string   "website"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "status"
    t.integer  "score"
    t.string   "rating_select"
    t.string   "astatus"
    t.string   "tokenID"
    t.string   "refundTokenID"
    t.string   "headline"
  end

  create_table "advisors", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.date     "birthday"
    t.string   "gender"
    t.string   "username"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "advisor_id"
    t.string   "headline"
    t.string   "payment_option"
    t.string   "paypal_email"
    t.integer  "score"
    t.boolean  "agree_paypal",           :default => false
    t.boolean  "agree_emails",           :default => false
    t.string   "status"
    t.string   "tokenID"
    t.string   "refundTokenID"
    t.string   "astatus"
  end

  add_index "advisors", ["email"], :name => "index_advisors_on_email", :unique => true
  add_index "advisors", ["reset_password_token"], :name => "index_advisors_on_reset_password_token", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "categoryname"
    t.string   "categorydesc"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "status"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "getadvices", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "giveadvices", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "advisor_id"
    t.integer  "advicepost_id"
    t.text     "messageq"
    t.text     "messager"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "status"
    t.string   "transaction_id"
  end

  create_table "payments", :force => true do |t|
    t.float    "amount"
    t.string   "transaction_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ratings", :force => true do |t|
    t.integer "advisor_id"
    t.integer "score"
    t.string  "rating_select"
    t.integer "advicepost_id"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
    t.string   "email"
    t.string   "gender"
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "zip"
    t.string   "howheard"
    t.text     "braintree_customer_id"
    t.boolean  "agree_emails",           :default => false
  end

end
