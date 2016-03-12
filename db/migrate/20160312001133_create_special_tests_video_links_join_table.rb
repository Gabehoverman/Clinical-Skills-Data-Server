class CreateSpecialTestsVideoLinksJoinTable < ActiveRecord::Migration
  def change
    create_table :special_tests_video_links, :id => false do |t|
      t.references :special_test
      t.references :video_link
    end
  end
end
