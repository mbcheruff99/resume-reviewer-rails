
ActiveRecord::Schema[8.1].define(version: 2026_03_09_014049) do
  create_table "jobs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "location"
    t.string "salary"
    t.string "title"
    t.datetime "updated_at", null: false
  end
end
