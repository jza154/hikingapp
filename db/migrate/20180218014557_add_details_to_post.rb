class AddDetailsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :trail_name, :string
    add_column :posts, :region, :string
    add_column :posts, :difficulty, :string
    add_column :posts, :season, :string
    add_column :posts, :distance, :float
    add_column :posts, :location, :string
    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :float
  end
end
