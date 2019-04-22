class VideosServices < ActiveRecord::Migration[5.2]
  def change
    create_join_table :videos, :services
  end
end
