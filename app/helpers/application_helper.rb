module ApplicationHelper
  # Example usage: yes_or_no(@artwork, :available)
  def yes_or_no(object, message)
    yes_or_no =
      object.send(message) ? 'yes' : 'no'
    I18n.t(yes_or_no)
  end
end
