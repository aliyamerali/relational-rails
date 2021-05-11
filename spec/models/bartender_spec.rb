require 'rails_helper'

RSpec.describe Bartender, type: :model do
  describe 'relationships' do
    it { should have_many :drinks }
  end

  before :each do
    @bartender1 = Bartender.create!(name: "Steve", age: 32, on_vacation: false, city: "Denver", created_at: "2021-03-26 15:10:42")
    @bartender2 = Bartender.create!(name: "Jill", age: 27, on_vacation: true, city: "Baltimore", created_at: "2021-03-24 10:10:42")
    @bartender3 = Bartender.create!(name: "Aaron", age: 36, on_vacation: false, city: "Austin", created_at: "2021-03-28 20:10:42")
  end

  describe 'class methods' do
    describe '.most_recently_created' do
      it "will show bartenders in the order they were created at / start working" do
        expected = [@bartender3, @bartender1, @bartender2]
        expect(Bartender.most_recently_created).to eq(expected)
      end
    end
  end
end
  #
  # describe 'instance methods' do
  #   describe '#' do
  #   end
  # end
