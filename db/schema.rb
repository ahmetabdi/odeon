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

ActiveRecord::Schema.define(version: 20151222135911) do

  create_table "cinemas", force: :cascade do |t|
    t.string   "site_id"
    t.string   "site_name"
    t.string   "site_address_1"
    t.string   "site_address_2"
    t.string   "site_address_3"
    t.string   "site_address_4"
    t.string   "site_postcode"
    t.string   "site_telephone"
    t.string   "site_longitude"
    t.string   "site_latitude"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "cinemas_films", force: :cascade do |t|
    t.integer "cinema_id"
    t.integer "film_id"
    t.index ["cinema_id"], name: "index_cinemas_films_on_cinema_id"
    t.index ["film_id"], name: "index_cinemas_films_on_film_id"
  end

  create_table "films", force: :cascade do |t|
    t.integer "odeon_id"
    t.string  "title"
    t.string  "rating"
    t.string  "certificate"
    t.string  "image_url"
    t.string  "release_date"
    t.string  "genre"
    t.string  "trailer_url"
    t.boolean "rateable"
    t.boolean "top_five"
    t.boolean "now_booking"
    t.boolean "coming_soon"
    t.boolean "future_release"
    t.boolean "recommended"
    t.boolean "is_bbf"
    t.string  "sites"
  end

end
