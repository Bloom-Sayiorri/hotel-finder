class AddMultipleColumnsToHosts < ActiveRecord::Migration[7.1]
  def change
    add_column :hosts, :name, :string
    add_column :hosts, :avatar, :string
    add_column :hosts, :thumbnail_url, :string
    add_column :hosts, :location, :string
    add_column :hosts, :response_time, :string
    add_column :hosts, :response_rate, :integer
    add_column :hosts, :acceptance_rate, :integer
    add_column :hosts, :is_superhost, :boolean
    add_column :hosts, :has_profile_pic, :boolean
  end
end
