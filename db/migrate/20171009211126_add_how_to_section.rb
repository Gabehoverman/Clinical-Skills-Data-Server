class AddHowToSection < ActiveRecord::Migration
  def change
    add_column :special_tests, :how_to, :string
  end
end
