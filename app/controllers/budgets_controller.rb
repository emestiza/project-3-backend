class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all

    render json:@budgets
  end


  def create
    #this creates a new to do object
    @one_budget = Budget.new(budget_params)
    if @one_budget.save
      #if object is saved, show it to the user
      render :json => {
          :response => 'successfully created a new budget',
          :data => @one_budget
      }
    else
      # if not, show error message
      render :json => {
          :error => 'cannot save the data'
      }
    end
  end
  def show
    # attempts to find if record exists in the table - returns boolean
    @single_budget = Budget.exists?(params[:id])
    #if yes, show data
    if @single_budget
      render :json => {
          :response => 'successful',
          :data => Budget.find(params[:id])
      }
    else
      #if no, show the error
      render :json => {
          :response => 'record not found'
      }
    end
  end

  def budget_by_user
    @user = User.find(params[:user_id])
    @user_budget = Budget.where('user_id = ?', params[:user_id])
    render :json => {
        :response => "Here is your budget",
        :data => @user_budget
    }
  end

  def update
    #check if id is in the table
    if(@single_budget_update = Budget.find_by_id(params[:id])).present?
      @single_budget_update.update(budget_params)
      render :json => {
          :response => 'successfully updated budget',
          :data => @single_budget_update
      }
    else
      render :json => {
          :response => 'update failure'
      }
    end
  end
  def destroy
    if(@delete_budget = Budget.find_by_id(params[:id])).present?
      @delete_budget.destroy
      render :json => {
          :response => 'Successfully destroyed'
      }
    else
      render :json => {
          :response => 'Nothing to destroy, shall I destroy you instead?'
      }
    end
  end

  

  private

  def budget_params
    params.permit(:name, :amount, :user_id)
  end
end
