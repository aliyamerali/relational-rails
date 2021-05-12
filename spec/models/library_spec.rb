require 'rails_helper'

describe Library, type: :model do
  describe 'relationship' do
    it { should have_many :books }
  end
end
