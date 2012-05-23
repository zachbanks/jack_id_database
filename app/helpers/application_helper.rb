module ApplicationHelper

  # Helps format flash messages with Twitter Bootstrap CSS classes. 
  # Is rendered in application.html.erb
  # Method is used in shared/_flash_messages.html.erb.
  def flash_class(level)
    case level
    when :notice then 'alert alert-info'
    when :success then 'alert alert-success'
    when :error then 'alert alert-error'
    when :alert then 'alert'
    end
  end
  
  # Will determine the title of a submit button depending on if it is new form or edit form.
  def submit_button_text(model, resource_name)
    new_record = model.new_record?
    new_record ? "Add #{resource_name}" : "Update #{resource_name}"
  end
end
