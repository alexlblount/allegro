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

ActiveRecord::Schema[7.2].define(version: 2024_10_16_042746) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.bigint "auditable_id"
    t.string "auditable_type"
    t.bigint "associated_id"
    t.string "associated_type"
    t.bigint "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.jsonb "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_type", "associated_id"], name: "associated_index"

  add_index "audits", ["auditable_type", "auditable_id", "version"], name: "auditable_index"

  add_index "audits", ["audited_changes"], name: "audited_changes", using: :gin

  add_index "audits", ["created_at"], name: "index_audits_on_created_at"

  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid"

  add_index "audits", ["user_id", "user_type"], name: "user_index"

end
