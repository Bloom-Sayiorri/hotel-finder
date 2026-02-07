class RenameGuestsToUser < ActiveRecord::Migration[7.1]
  def change
    rename_table :guests, :users
  end
end
