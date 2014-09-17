class Question < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 40}
  validates :description, presence: true, length: { minimum: 150}

  has_many :answers, dependent: :destroy
  belongs_to :user

  default_scope { order('updated_at DESC') }
end
