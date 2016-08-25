class Listing < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :host, :class_name => "User"

  has_many :reservations
  has_many :guests, :class_name => "User", through: :reservations
  has_many :reviews, through: :reservations

  def neighborhood_attributes=(attrs)
      unless attrs[:name].empty?
        self.neighborhood = Neighborhood.find_or_create(attrs)
      end
  end
end