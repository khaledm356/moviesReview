require 'smarter_csv'

namespace :csv do
    desc 'Import movies and actors from csv files'
    task :import_movies_actors => :environment do 
        SmarterCSV.process('movies.csv', {:chunk_size => 1000}) do |chunk|
            chunk.each do |row|
                movie = Movie.find_or_create_by(name: row[:movie], description: row[:description] ,director: Director.find_or_create_by(name: row[:director]),year: row[:year])
                actor = Actor.find_or_create_by(name: row[:actor])
                acting = Acting.find_or_create_by(movie_id: movie.id, actor_id: actor.id)
                filming_location = FilmingLocation.find_or_create_by(location: Location.find_or_create_by(country: row[:country], name: row[:filming_location]), movie: movie)
            end
        end
    end

    desc 'Import reviews from csv files'
    task :import_reviews => :environment do 
        SmarterCSV.process('reviews.csv', {:chunk_size => 1000}) do |chunk|
            chunk.each do |row|
                movie = Movie.find_or_create_by(name: row[:movie])
                user = User.find_or_create_by(name: row[:user])
                reviews = Review.find_or_create_by(movie: movie, user: user, comment: row[:review], stars: row[:stars])
            end
        end
    end
end
