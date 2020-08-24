class Budget < ApplicationRecord
  validates_presence_of :name
  has_many :expenses, dependent: :destroy
end
