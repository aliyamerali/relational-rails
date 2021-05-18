require 'rails_helper'

RSpec.describe Bartender, type: :model do
  describe 'relationships' do
    it { should have_many :drinks }
  end

  before :each do
    @bartender1 = Bartender.create!(name: "Steve", age: 32, on_vacation: false, city: "Denver", created_at: "2021-03-26 15:10:42")
    @bartender2 = Bartender.create!(name: "Jill", age: 27, on_vacation: true, city: "Baltimore", created_at: "2021-03-24 10:10:42")
    @bartender3 = Bartender.create!(name: "Aaron", age: 36, on_vacation: false, city: "Austin", created_at: "2021-03-28 20:10:42")

    @drink1 = @bartender1.drinks.create!(name: "Martini", cost: 4.00, abv: 11, popular: true)
    @drink2 = @bartender1.drinks.create!(name: "4 horsmen", cost: 11.00, abv: 18, popular: false)
    @drink7 = @bartender1.drinks.create!(name: "Apple-Tini", cost: 6.00, abv: 9, popular: false)

    @drink3 = @bartender2.drinks.create!(name: "Mojito", cost: 7.00, abv: 10, popular: true)
    @drink4 = @bartender2.drinks.create!(name: "Mai Tai", cost: 9.00, abv: 13, popular: true)

    @drink5 = @bartender3.drinks.create!(name: "Hurricane", cost: 6.00, abv: 5, popular: false)
    @drink6 = @bartender3.drinks.create!(name: "Gin and Tonic", cost: 7.00, abv: 9, popular: true)
  end

  describe 'class methods' do
    describe '.most_recently_created' do
      it "will show bartenders in the order they were created at / start working" do
        expected = [@bartender3, @bartender1, @bartender2]
        expect(Bartender.most_recently_created).to eq(expected)
      end
    end
  end

  describe 'instance methods' do
    describe '#drinks_count' do
      it "shows the count of the number of children associated with this parent" do
        expect(@bartender1.drinks_count).to eq(3)
      end
    end

    describe '#alphabetical_order' do
      it "shows the count of the number of children associated with this parent" do
        expect(@bartender1.alphabetical_order).to eq([@drink2, @drink7, @drink1])
      end
    end

    describe '#abv_filter' do
      it "shows only the records that are above the abv input by the user" do
        expect(@bartender1.abv_filter(10)).to eq([@drink1, @drink2])

        expect(@bartender1.abv_filter(10)).to_not eq([@drink7])
      end
    end
  end
end
