class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug(name)
    slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def find_by_slug(slug)
  end
end
