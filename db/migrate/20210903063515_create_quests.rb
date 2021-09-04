class CreateQuests < ActiveRecord::Migration[6.0]
  def change
    create_table :quests do |t|
      t.string :title,   null: false, default: ""   
      t.text :content,   null: false
      t.boolean :is_solved, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
