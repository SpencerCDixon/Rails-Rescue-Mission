class Answer < ActiveRecord::Base

  validates :description, presence: true, length: { minimum: 50 }

  belongs_to :question
  belongs_to :user

  default_scope { order('updated_at ASC') }
end
