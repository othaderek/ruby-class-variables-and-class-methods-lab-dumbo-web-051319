require "pry"

class Song
  attr_accessor :name, :artist, :genre

  @@artists = []
  @@genres = []
  @@count = 0

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
    @@artists << artist
    @@count += 1
    @@genres << genre
  end

  def self.count
    @@count
  end

  def self.artists # Need to delete any repeat instances of artists
    @@artists.uniq!
  end

  def self.genres # Need to delete any repeat instances of genres
    @@genres.uniq!
  end

  def self.genre_count
    @@genres.count_by {|e| e}
  end

  def self.artist_count
    @@artists.count_by {|e| e}

  end
end

module Enumerable
  def count_by(&block)
    each_with_object(Hash.new(0)) do |elem, memo|
      value = block.call(elem)
      memo[value] += 1
    end
  end
end


# select {|v| v =~ /[aeiou]/ }
