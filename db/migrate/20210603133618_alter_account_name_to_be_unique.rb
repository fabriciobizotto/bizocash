class AlterAccountNameToBeUnique < ActiveRecord::Migration[6.1]
  def up
    change_column :accounts, :name, :string, limit:20, null:false
    add_index :accounts, :name, unique:true, name: 'index_accounts_on_name'
    # add_index :accounts, [:name, :active, :investment], unique:true, name: 'index_accounts_on_name'
  end

  def down
    change_column :accounts, :name, :string
    remove_index :accounts, name: 'index_accounts_on_name'
  end
end
