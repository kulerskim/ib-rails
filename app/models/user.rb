class User < ActiveRecord::Base
  validates :name, :language, presence: true
  validates :name, uniqueness: true

  has_many :topics
  has_many :replies

  def to_s
    self.name
  end

  def self.default
    User.first
  end
end
