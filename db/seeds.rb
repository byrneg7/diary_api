# frozen_string_literal: true

require 'database_cleaner/active_record'
DatabaseCleaner.strategy = :truncation, {only: %w[users]}
DatabaseCleaner.clean

p "\nSeeding db... \n"

puts "\t Creating Users..."
10.times do
  User.create(
      name: Faker::Name.first_name + Faker::Name::last_name,
      password: Faker::Internet.password,
  )
end

p "Seeding finished... \n \n"