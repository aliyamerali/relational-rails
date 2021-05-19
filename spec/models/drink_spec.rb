require 'rails_helper'

RSpec.describe Drink, type: :model do
  describe 'relationships' do
    it { should belong_to(:bartender) }
  end

  before :each do
    @bartender1 = Bartender.create!(name: "Steve", age: 32, on_vacation: false, city: "Denver", created_at: "2021-03-26 15:10:42")
    @bartender2 = Bartender.create!(name: "Jill", age: 27, on_vacation: true, city: "Baltimore", created_at: "2021-03-24 10:10:42")
    @bartender3 = Bartender.create!(name: "Aaron", age: 36, on_vacation: false, city: "Austin", created_at: "2021-03-28 20:10:42")

    @drink1 = @bartender1.drinks.create!(name: "Martini", cost: 4.00, abv: 11, popular: true)
    @drink2 = @bartender1.drinks.create!(name: "4 horsmen", cost: 11.00, abv: 18, popular: false)

    @drink3 = @bartender2.drinks.create!(name: "Mojito", cost: 7.00, abv: 10, popular: true)
    @drink4 = @bartender2.drinks.create!(name: "Mai Tai", cost: 9.00, abv: 13, popular: true)

    @drink5 = @bartender3.drinks.create!(name: "Hurricane", cost: 6.00, abv: 5, popular: false)
    @drink6 = @bartender3.drinks.create!(name: "Gin and Tonic", cost: 7.00, abv: 9, popular: true)
  end

  describe 'class methods' do
    describe '.popular_drink' do
      it "I only see drinks where the boolean column is `true`" do
        expect(Drink.popular_drink).to eq([@drink1, @drink3, @drink4, @drink6])

        expect(Drink.popular_drink).to_not eq([@drink2, @drink5])
      end
    end

    describe '.filter_drinks' do
      it "will show filter the drinks by keyword" do
        expect(Drink.filter_drinks("Mojito")).to eq([@drink3])
        expect(Drink.filter_drinks("Mojito")).to_not eq([@drink4])
      end
    end

    describe '.partial_filter' do
      it "will filter the drinks by partial keyword" do
        expect(Drink.partial_filter("ito")).to eq([@drink3])
        expect(Drink.partial_filter("ito")).to_not eq([@drink6])
      end
    end
  end
end
