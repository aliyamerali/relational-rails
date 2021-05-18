class Bartender < ApplicationRecord
  has_many :drinks, dependent: :destroy

  def self.most_recently_created
    order(created_at: :desc)
  end

  def drinks_count
    drinks.count
  end

  def alphabetical_order
    drinks.order(:name)
  end
end
