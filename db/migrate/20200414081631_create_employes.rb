class CreateEmployes < ActiveRecord::Migration[6.0]
  def change
    create_table :employes do |t|
    	t.string :name
    	t.references :city
    	t.references :manager

      t.timestamps
    end
  end
end
