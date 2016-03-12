class CreateImageLinksSpecialTestsJoinTable < ActiveRecord::Migration
  def change
    create_table :image_links_special_tests, :id => false do |t|
      t.references :special_test
      t.references :image_link
    end
  end
end
