class CreateTags < ActiveRecord::Migration[6.1]
  def up
    create_table :tags do |t|
      t.string :name, null:false
      t.boolean :active, null: false, default: true
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end

    add_index :tags, :name, name: "tags_name_uk", :unique =>  true
  end

  def down 
    drop_table :tags
    remove_index :tags, name: :tags_name_uk
  end
end
