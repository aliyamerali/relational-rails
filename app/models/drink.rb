class Drink < ApplicationRecord
  belongs_to :bartender

  def self.popular_drink
    where(popular: true)
  end
end
