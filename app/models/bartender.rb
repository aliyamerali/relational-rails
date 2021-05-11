class Bartender < ApplicationRecord
  has_many :drinks, dependent: :destroy
end
