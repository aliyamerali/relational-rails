class Bartender < ApplicationRecord
  has_many :drinks, dependent: :destroy

  def abv_filter(number)
    drinks.where('abv > ?', number)
  end

  def drinks_count
    drinks.count
  end

  def alphabetical_order
    drinks.order(:name)
  end

  def self.most_recently_created
    order(created_at: :desc)
  end

  def self.number_of_bartender_drinks
    joins(:drinks)
    .group(:id)
    .order('count(drinks.id) desc')
  end

  def self.filter_bartenders(input)
    where(name: input)
  end
end
