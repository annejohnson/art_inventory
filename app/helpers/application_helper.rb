module ApplicationHelper
  # Example usage: yes_or_no(@artwork, :available)
  def yes_or_no(object, message)
    object.send(message) ? 'yes' : 'no'
  end
end
