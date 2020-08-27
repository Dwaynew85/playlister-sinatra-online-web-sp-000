class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.gsub(/[^a-z0-9\s]/i, '').parameterize
  end

  def self.find_by_slug(slug)
    self.find_by(name: slug.titleize)
  end
end
