class CinemaFilm < ActiveRecord::Base
  self.table_name = "cinemas_films"

  belongs_to :cinema
  belongs_to :film
end
