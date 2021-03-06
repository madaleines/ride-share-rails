class Passenger < ApplicationRecord
  has_many :trips
  validates :name, presence: true, format: {with: /\A[a-zA-Z\.\'\-]{2,50}(?: [a-zA-Z\.\'\-]{2,50})+\Z/}
  validates :phone_num, presence: true

  self.per_page = 10

  def is_in_ride?
    self.trips.each do |trip|
      if trip.rating == nil
        return true
      end
    end
    return false
  end

  def total_charged
    return self.trips.sum { | trip | trip.cost }
  end
end
