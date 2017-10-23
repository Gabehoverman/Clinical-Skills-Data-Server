class AddSystemToVideo < ActiveRecord::Migration
  def change
    add_column :video_links, :system_id, :integer
  end
end
