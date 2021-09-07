class CreateQuestAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :quest_answers do |t|
      t.text :answer
      t.integer :user_id
      t.integer :quest_id

      t.timestamps
    end
  end
end
