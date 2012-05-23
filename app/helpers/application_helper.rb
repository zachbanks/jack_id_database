module ApplicationHelper
  # Helps format flash messages with Twitter Bootstrap CSS classes. 
  # Is rendered in application.html.erb
  # Method is used in shared/_flash_messages.html.erb.
  def flash_class(level)
    case level
    when :notice then 'alert alert-info'
    when :success then 'alert alert-success'
    when :error then 'alert alert-error'
    when :alert then 'alert alert-error'
    end
  end
  
  # Assigns CSS button classes for a submit button.
  # If object is a new record, give the submit button a success button, otherwise give it a warning button.
  def submit_button_class(model)
    new_record = model.new_record?
    css_class = new_record ? 'success' : 'warning' # These are Twitter Bootstrap button classes.
    "btn btn-#{css_class}"
  end
end
