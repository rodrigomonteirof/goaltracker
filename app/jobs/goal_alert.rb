class GoalAlert

  @queue = :goal_alert

  def self.perform(params = {})
    goal = Goal.find(params["id"])
    goal.send_alarm
  end

end
