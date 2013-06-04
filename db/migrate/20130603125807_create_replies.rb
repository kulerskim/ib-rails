class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.belongs_to :topic, index: true
      t.text :content
      t.belongs_to :created_by, index: true

      t.timestamps
    end
  end
end
