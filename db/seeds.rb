require 'constants'

6.times.with_index do |index| 
    a = Address.create!(
        country: Constants::COUNTRIES[index],
        state: Constants::STATES[index],
        postal_code: rand(4000),
        street_address: Constants::STREET_ADDRESSES[index]
    )
end
puts "Created: 6 unique addresses."

12.times.with_index do |index|
    fn = Constants::FIRST_NAMES[rand(Constants::N)]
    ln = Constants::LAST_NAMES[rand(Constants::N)] 
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

Constants::PARTS.length.times do |part|
    part_desc = Constants::PARTS[part][0]
    part_desc.slice!("\t")
    part_desc.slice!("\t")
    part_type = Constants::PARTS[part][1]
    part_type.slice!("\t")
    part_type.slice!("\t")
    
    user = User.find_by(id: rand(1..User.all.count))
    if user.nil? 
        puts "NILL"
        next
    end
    user.items.create!(
        price: rand(500),
        condition: Constants::CONDITIONS[rand(0..Constants::CONDITIONS.length)],
        description: part_desc,
        part_type: part_type,
    )
end

puts "Created: #{Constants::PARTS.length} items in random user accounts."