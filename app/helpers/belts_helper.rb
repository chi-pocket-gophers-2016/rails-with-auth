module BeltsHelper
  def owner?(belt)
    belt.owner == current_user
  end
end