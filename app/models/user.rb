class User < ApplicationRecord
  has_secure_password

  has_many :budgets, dependent: :destroy
  has_many :expenses, through: :budgets

end
