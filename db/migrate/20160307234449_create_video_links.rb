class CreateVideoLinks < ActiveRecord::Migration
  def change
    create_table :video_links do |t|

      t.string :title
      t.string :link

    end
  end
end
