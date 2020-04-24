namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [City, Employe, Manager,Subordinate].each(&:delete_all)
    
    City.populate 10 do |category|
      category.name = Populator.words(1..3).titleize
      Employe.populate 10..100 do |product|
        product.city_id = category.id
        product.name = Populator.words(1..5).titleize
        #product.city_id = category.id
       
      end
    end
    
    Subordinate.populate 20 do |person|
      person.name    = Faker::Name.name
      person.cord1 = Faker::Number.number(digits: 5)
      person.cord2   = Faker::Number.number(digits: 5)
     
    end
  end
end