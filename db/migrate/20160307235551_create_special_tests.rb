class CreateSpecialTests < ActiveRecord::Migration
  def change
    create_table :special_tests do |t|

      t.references :component

      t.string :name
      t.string :positive_sign
      t.string :indication
      t.text :notes

    end
  end
end