class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.integer :odeon_id
      t.string :title
      t.string :rating
      t.string :certificate
      t.string :image_url
      t.string :release_date
      t.string :genre
      t.string :trailer_url
      t.boolean :rateable
      t.boolean :top_five
      t.boolean :now_booking
      t.boolean :coming_soon
      t.boolean :future_release
      t.boolean :recommended
      t.boolean :is_bbf
      t.string :sites
    end
  end
end
