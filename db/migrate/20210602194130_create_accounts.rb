class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :name, null:false
      t.references :user, null: false, foreign_key: true, index:true
      t.boolean :active, null:false, default:true
      t.boolean :investment, null:false, default:false

      t.timestamps
    end
  end
end
