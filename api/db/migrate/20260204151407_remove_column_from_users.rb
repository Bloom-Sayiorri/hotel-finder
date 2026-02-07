class RemoveColumnFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :external_id, :string
  end
end
