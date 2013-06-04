class Reply < ActiveRecord::Base

  validates :topic_id, :content, :created_by_id, presence: true

  belongs_to :topic
  belongs_to :created_by, :class_name => 'User',  :foreign_key => 'created_by_id'
end
