class Drink < ApplicationRecord
  belongs_to :bartender

  def self.popular_drink
    where(popular: true)
  end

  def self.filter_drinks(input)
    where(name: input)
  end
end
