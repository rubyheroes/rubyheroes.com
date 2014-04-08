module ApplicationHelper
  # Making this boolean false will disable the voting interface on the home page.
  def voting_enabled?
    false
  end

  # Making this boolean true will link to the previous year's heroes.
  def heroes_chosen?
    true
  end
end
