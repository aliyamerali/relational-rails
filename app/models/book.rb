class Book < ApplicationRecord
  belongs_to :library

  def self.sort_by_name
    order(name: :asc)
  end
end
