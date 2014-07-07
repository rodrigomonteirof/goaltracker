class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication

  def index
    @goals = current_user.goals
  end

  def show
    @goal_history = GoalHistory.new
    @goal_history.goal = @goal
    @available_days = @goal.available_days(date_limit)
  end

  def new
    @goal = Goal.new
  end

  def edit
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user

    if @goal.valid? and @goal.save
      redirect_to @goal, notice: 'Goal was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @goal.valid? and @goal.update(goal_params)
      redirect_to @goal, notice: 'Goal was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_url
  end

  def date_limit
    if params[:year].present? and params[:month].present?
      date_limit = DateTime.new(params[:year].to_i, params[:month].to_i).end_of_month
    end

    if date_limit.blank? or date_limit >= DateTime.new(DateTime.now.year, DateTime.now.month).end_of_month
      date_limit = DateTime.now
    end

    date_limit
  end

  private
    def set_goal
      @goal = Goal.find(params[:id])

      unless @goal.user == current_user
        @goal = nil
        redirect_to action: "index"
      end
    end

    def goal_params
      params.require(:goal).permit(:name, :description, :start_date, :alarm_hour, :frequency, :frequency_type, :until_date)
    end
end
