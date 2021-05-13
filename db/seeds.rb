require 'date'

Bartender.destroy_all
Drink.destroy_all
Library.destroy_all
Book.destroy_all


@bartender1 = Bartender.create!(name: "Steve", age: 32, on_vacation: false, city: "Denver")
@bartender2 = Bartender.create!(name: "Jill", age: 27, on_vacation: true, city: "Baltimore")
@bartender3 = Bartender.create!(name: "Aaron", age: 36, on_vacation: false, city: "Austin")

@drink1 = @bartender1.drinks.create!(name: "Martini", cost: 4.00, abv: 11, popular: true)
@drink2 = @bartender1.drinks.create!(name: "4 horsmen", cost: 11.00, abv: 18, popular: false)

@drink3 = @bartender2.drinks.create!(name: "Mojito", cost: 7.00, abv: 10, popular: true)
@drink4 = @bartender2.drinks.create!(name: "Mai Tai", cost: 9.00, abv: 13, popular: true)

@drink5 = @bartender3.drinks.create!(name: "Hurricane", cost: 6.00, abv: 5, popular: false)
@drink6 = @bartender3.drinks.create!(name: "Gin and Tonic", cost: 7.00, abv: 9, popular: true)


@library1 = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true, created_at: DateTime.new(2021,2,3,4,5,6))
@library2 = Library.create!(name: "Ford-Warren", staff_count: 12, member_count: 1200, open: false, created_at: DateTime.new(2020,2,3,4,5,6))
@library3 = Library.create!(name: "Park Hill", staff_count: 20, member_count: 2300, open: true, created_at: DateTime.new(2019,2,3,4,5,6))

@book1 = @library1.books.create!(name: "Harry Potter and the Sorcerer's Stone", publish_year: 1998, available: true)
@book2 = @library1.books.create!(name: "1Q84", publish_year: 2011, available: false)

@book3 = @library2.books.create!(name: "On the Move: A Life", publish_year: 2015, available: true)
@book4 = @library2.books.create!(name: "The Vanishing Half", publish_year: 2020, available: false)

@book5 = @library3.books.create!(name: "I'm Just A Person", publish_year: 2016, available: true)
@book6 = @library3.books.create!(name: "The Ocean at the End of the Lane", publish_year: 2013, available: false)
