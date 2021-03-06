class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :require_authentication

  def index
    @goals = current_user.goals
  end

  def show
    @goal_history = Goal::History.new(goal: @goal)
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
    @goal.frequency = Goal::Frequency.new

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

  def create_history
    @goal_history = Goal::History.where(
      goal_id: params[:goal_id],
      date: params[:goal_history][:date]
    ).first_or_create

    @goal_history.response = params[:goal_history][:response]
    @goal_history.save!

    head :ok
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
