class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.text :body
      t.boolean :correct_answer

      t.timestamps
    end
  end
end
