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

ActiveRecord::Schema.define(version: 20160423211311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "components", force: :cascade do |t|
    t.integer "system_id"
    t.string  "name"
    t.text    "inspection"
    t.text    "notes"
  end

  create_table "exam_techniques", force: :cascade do |t|
    t.integer "system_id"
    t.string  "name"
    t.string  "details"
  end

  create_table "exam_techniques_image_links", id: false, force: :cascade do |t|
    t.integer "exam_technique_id"
    t.integer "image_link_id"
  end

  create_table "exam_techniques_video_links", id: false, force: :cascade do |t|
    t.integer "exam_technique_id"
    t.integer "video_link_id"
  end

  create_table "image_links", force: :cascade do |t|
    t.string "title"
    t.string "link"
  end

  create_table "image_links_special_tests", id: false, force: :cascade do |t|
    t.integer "special_test_id"
    t.integer "image_link_id"
  end

  create_table "muscles", force: :cascade do |t|
    t.integer "component_id"
    t.string  "name"
  end

  create_table "palpations", force: :cascade do |t|
    t.integer "component_id"
    t.string  "structure"
    t.text    "details"
    t.text    "notes"
  end

  create_table "personnel_acknowledgements", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "notes"
  end

  create_table "range_of_motions", force: :cascade do |t|
    t.integer "component_id"
    t.string  "motion"
    t.string  "degrees"
    t.text    "notes"
  end

  create_table "software_acknowledgements", force: :cascade do |t|
    t.string "name"
    t.string "link"
  end

  create_table "special_tests", force: :cascade do |t|
    t.integer "component_id"
    t.string  "name"
    t.string  "positive_sign"
    t.string  "indication"
    t.text    "notes"
  end

  create_table "special_tests_video_links", id: false, force: :cascade do |t|
    t.integer "special_test_id"
    t.integer "video_link_id"
  end

  create_table "systems", force: :cascade do |t|
    t.string "name"
    t.text   "details"
  end

  create_table "video_links", force: :cascade do |t|
    t.string "title"
    t.string "link"
  end

end
