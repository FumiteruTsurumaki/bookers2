class CreateControllers < ActiveRecord::Migration[5.2]
  def change
    create_table :controllers do |t|
      t.text :name
      t.text :introduction
      t.string :profile_image_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
