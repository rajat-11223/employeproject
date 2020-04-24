class AddImageToEmploye < ActiveRecord::Migration[6.0]
  def change

  	add_column :employes, :image, :string
  	
  end
end
