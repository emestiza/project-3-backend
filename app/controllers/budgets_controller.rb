class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all

    render json:@budgets
  end
end
