class GoalHistoriesController < ApplicationController
  def create
    @goal_history = GoalHistory.where(
      goal_id: params[:goal_id],
      date: params[:goal_history][:date]
    ).first_or_create

    @goal_history.response = params[:goal_history][:response]
    @goal_history.save!

    head :ok
  end
end
