namespace :odeon do
  desc "Fetch latest updates from Odeon API"
  task fetch: :environment do
    # Get all cinemas
    cinemas = Curl.get('https://api.odeon.co.uk/android-2.1/api/all-cinemas')
    cinemas = JSON.parse(cinemas.body_str)['data']['sites'].map {|x| x.last}

    cinemas.each do |cinema|
      Cinema.find_or_create_by(site_id: cinema['siteId']) do |c|
        c.site_name = cinema['siteName']
        c.site_address_1 = cinema['siteAddress1']
        c.site_address_2 = cinema['siteAddress2']
        c.site_address_3 = cinema['siteAddress3']
        c.site_address_4 = cinema['siteAddress4']
        c.site_postcode = cinema['sitePostcode']
        c.site_telephone = cinema['siteTelephone']
        c.site_longitude = cinema['siteLongitude']
        c.site_latitude = cinema['siteLatitude']
      end
    end

    films = Curl.get('https://api.odeon.co.uk/android-2.1/api/app-init')
    films = JSON.parse(films.body_str)["data"]["films"]

    films.each do |film|
      film_id = Film.find_or_create_by(odeon_id: film['filmMasterId']) do |f|
        f.odeon_id = film['filmMasterId']
        f.title = film['title']
        f.rating = film['halfRating']
        f.certificate = film['certificate']
        f.image_url = film['imageUrl']
        f.release_date = film['releaseDate']
        f.genre = film['genre']
        f.trailer_url = film['trailerUrl']
        f.rateable = film['isRateable']
        f.top_five = film['topFive']
        f.now_booking = film['nowBooking']
        f.coming_soon = film['comingSoon']
        f.future_release = film['futureRelease']
        f.recommended = film['recommended']
        f.is_bbf = film['isBBF']
      end

      film['sites'].each do |site|
        CinemaFilm.find_or_create_by(cinema_id: Cinema.where(site_id: site).first.id, film_id: film_id.id)
      end
    end
  end
end
