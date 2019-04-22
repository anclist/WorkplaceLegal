class BlogsServices < ActiveRecord::Migration[5.2]
  def change
    create_join_table :blogs, :services
  end
end
