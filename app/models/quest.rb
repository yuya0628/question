class Quest < ApplicationRecord
  belongs_to :user
  has_many :quest_answers, dependent: :destroy
end
