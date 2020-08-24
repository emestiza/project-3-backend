class Budget < ApplicationRecord
  validates_presence_of :name
  # nsh
  has_many :expenses, dependent: :destroy
  belongs_to :user

end
