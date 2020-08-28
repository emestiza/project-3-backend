class Budget < ApplicationRecord
  validates_presence_of :name
  belongs_to :user
  has_many :expenses, dependent: :destroy


end
