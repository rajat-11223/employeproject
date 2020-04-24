class AddFieldToEmploye < ActiveRecord::Migration[6.0]
  def change

  	add_column :employes, :willing_to_relocate, :boolean, default: false
  end
end



