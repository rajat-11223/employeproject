namespace :add_data_faker do
#end
desc 'add data using faker'
task add_data_using_faker: :environment do
  
  require 'faker'

 (1..5).each do |i|
#    desc "#{i} user created"
#    create_user
user_name = Faker::Address.unique.city

  addcitydata = City.create(name: user_name)
     puts "city data added successfully"
  end
end
end

#def create_user
#  user_name = Faker::Name.unique.name
#  user = User.new(
#    name: user_name,
#    email: Faker::Internet.free_email(user_name),
#    password: 'password',
#    phone: Faker::PhoneNumber.phone_number,
#    migration_id: Faker::Number.number(digits = 10)
#  )
#  user.save!
#end
#