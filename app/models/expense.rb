class Expense < ApplicationRecord
  belongs_to :budget
  

  validates_presence_of :amount, :category
end
