class CreateCinemasFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :cinemas_films do |t|
      t.belongs_to :cinema, index: true
      t.belongs_to :film, index: true
    end
  end
end
