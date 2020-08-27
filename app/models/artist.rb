class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.gsub(/[^a-z0-9\s]/i, '').parameterize
  end

  def self.find_by_slug(slug)
    self.find_by(name: slug.titleize)
  end
end
