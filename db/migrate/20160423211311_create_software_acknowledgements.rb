class CreateSoftwareAcknowledgements < ActiveRecord::Migration
  def change
    create_table :software_acknowledgements do |t|

    	t.string :name
    	t.string :link
    	
    end
  end
end
