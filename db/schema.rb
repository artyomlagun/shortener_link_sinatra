require_relative 'connection'

ActiveRecord::Schema.define do
  create_table :links, force: :cascade do |t|
    t.string  :long_link
    t.string  :short_link
    t.integer :visit_counter, default: 0
    t.datetime :created_at, precision: 6, null: false
  end
end