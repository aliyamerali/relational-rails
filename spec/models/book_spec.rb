require 'rails_helper'

describe Book, type: :model do
  describe 'relationship' do
    it { should belong_to(:library) }
  end
end
