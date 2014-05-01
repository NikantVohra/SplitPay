class ExpensesController < ApplicationController
  before_filter :get_user

  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  
  def get_user
    @user = User.find(params[:user_id])
  end

  # GET /expenses
  # GET /expenses.json


  def index
    @expenses = @user.expenses
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @expense = @user.expenses.find(params[:id])
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = @user.expenses.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to  [@user,@expense], notice: 'Expense was successfully created.' }
        format.json { render json: [@user,@expense], status: :created, location: [@user,@expense] }
      else
        format.html { render action: 'new' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to [@user,@expense], notice: 'Expense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to user_expenses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = @user.expenses.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:category, :amount, :user_id)
    end
end
