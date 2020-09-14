class CreateIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :ideas do |t|
      t.integer    :genre_id, null: false
      t.string     :title,    null: false
      t.text       :content,  null: false
      #t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
