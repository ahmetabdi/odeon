class CreateCinemas < ActiveRecord::Migration[5.0]
  def change
    create_table :cinemas do |t|
      t.string :site_id
      t.string :site_name
      t.string :site_address_1
      t.string :site_address_2
      t.string :site_address_3
      t.string :site_address_4
      t.string :site_postcode
      t.string :site_telephone
      t.string :site_longitude
      t.string :site_latitude

      t.timestamps
    end
  end
end
