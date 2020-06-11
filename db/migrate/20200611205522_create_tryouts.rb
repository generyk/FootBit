class CreateTryouts < ActiveRecord::Migration[6.0]
  def change
    create_table :tryouts do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
