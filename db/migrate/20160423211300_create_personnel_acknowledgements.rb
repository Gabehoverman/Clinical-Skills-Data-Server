class CreatePersonnelAcknowledgements < ActiveRecord::Migration
  def change
    create_table :personnel_acknowledgements do |t|
    	
    	t.string :name
    	t.string :role
    	t.string :notes

    end
  end
end
