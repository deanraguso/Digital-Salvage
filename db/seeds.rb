FIRST_NAMES = ["Shawn", "Dameon", "Clara", "Ruby", "Joseph", "Darren"]
LAST_NAMES = ["Stein", "Lloyd", "Fury", "Campbell", "Fisher", "Casperson"]
COUNTRIES = ["Australia", "United States", "Canada", "China", "Russia", "Italy"]
STATES = ["Victoria", "Washington", "Montreal", "Wuhan", "Moscow", "Sicily"]
STREET_ADDRESSES = [
    "100 Smith Street, Smithville",
    "200 John Street, Johnville",
    "300 Anns Way, Mt. Ann",
    "400 Bank Court, Financeville",
    "500 White Road, Plain",
    "600 Redders Lane, Tommatina"
]
N = 6

6.times.with_index do |index| 
    a = Address.create!(
        country: COUNTRIES[index],
        state: STATES[index],
        postal_code: rand(4000),
        street_address: STREET_ADDRESSES[index]
    )
end
puts "Created: 6 unique addresses."

12.times.with_index do |index|
    fn = FIRST_NAMES[rand(N)]
    ln = LAST_NAMES[rand(N)] 
    tmp = rand(100)

    User.create!(first_name: fn, last_name: ln,
        email: "#{fn}#{tmp}@#{ln}.com",
        password: "#{fn}#{tmp}#{ln}",
        password_confirmation: "#{fn}#{tmp}#{ln}",
        address_id: (index/2 + 1))
end

puts "Created: 12 unique users. (Passwords use capial letters start of names!)"

User.create!(first_name: "Sample", last_name: "Account",
    email: "sample@sample.com",
    password: "password",
    password_confirmation: "password",
    address_id: 1)

puts "Created: main sample account. acc: sample@sample.com pw: password"
