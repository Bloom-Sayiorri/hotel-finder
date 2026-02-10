class AddConstraintsToRoleInUsers < ActiveRecord::Migration[7.1]
  def up
    # 1) Fill NULL roles with default (normal = 0)
    execute <<~SQL
      UPDATE users
      SET role = 0
      WHERE role IS NULL;
    SQL

    # 2) Set default
    change_column_default :users, :role, 0

    # 3) Add NOT NULL constraint
    change_column_null :users, :role, false
  end

  def down
    change_column_null :users, :role, true
    change_column_default :users, :role, nil
  end
end
