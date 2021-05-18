class Book < ApplicationRecord
  belongs_to :library

  def self.sort_by_name
    order(name: :asc)
  end

  def self.filter_available_by_search_exact(query)
    self.where("available = true AND name LIKE '#{query}'")
  end

  def self.filter_available_by_search_partial(query)
    self.where("available = true AND name LIKE '%#{query}%'")
  end
end
