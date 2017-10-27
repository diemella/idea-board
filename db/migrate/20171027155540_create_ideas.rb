class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :content
      t.boolean :public
      t.integer :creator_id

      t.timestamps
    end
  end
end
