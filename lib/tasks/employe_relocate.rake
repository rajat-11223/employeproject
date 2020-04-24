namespace :employe_relocate do

desc 'employes wants to relocate'
task employe_want_to_relocate: :environment do

    employe = Employe.all.sample(10).pluck(:id)
    updateemp =  Employe.where(id: employe).update_all(:willing_to_relocate => true)

end
end
