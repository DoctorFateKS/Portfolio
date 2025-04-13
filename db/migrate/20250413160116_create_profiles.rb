class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :title
      t.text :bio
      t.text :skills
      t.text :social_links

      t.timestamps
    end
    add_index :profiles, :name
  end
end
