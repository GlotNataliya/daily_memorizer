class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
