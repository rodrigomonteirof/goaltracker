class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication

  def index
    @goals = current_user.goals
  end

  def show
    @goal_history = GoalHistory.new
    @goal_history.goal = @goal
    @available_days = @goal.available_days(params[:date])
  end

  def new
    @goal = Goal.new
  end

  def edit
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user

    if @goal.valid? && @goal.save
      redirect_to @goal, notice: 'Goal was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @goal.valid? && @goal.update(goal_params)
      redirect_to @goal, notice: 'Goal was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @goal.destroy
    redirect_to goals_url
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])

    redirect_to action: 'index' unless @goal.user == current_user
  end

  def goal_params
    params.require(:goal).permit(
      :name,
      :description,
      :start_date,
      :alarm_hour,
      :frequency,
      :frequency_type,
      :until_date
    )
  end
end
