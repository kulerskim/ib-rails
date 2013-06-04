class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :content
      t.belongs_to :created_by, index: true

      t.timestamps
    end
  end
end
