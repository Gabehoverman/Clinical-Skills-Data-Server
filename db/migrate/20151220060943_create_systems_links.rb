class CreateSystemsLinks < ActiveRecord::Migration
  def change
    create_table :links_systems do |t|
      t.references :system
      t.references :link
    end
  end
end
