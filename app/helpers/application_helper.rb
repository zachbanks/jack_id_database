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
  
  # Formats any datetime into a string in the format: 1/6/2012 at 1:35 PM (3 months ago).
  # @param [DateTime] datetime The datetime to be formatted.
  # @return [String] A formatted string in the format: 1/6/2012 at 12:56 AM (4 days ago).
  def relative_date_and_time_format_for(datetime)
    result = ''
    result <<  datetime.strftime('%m/%e/%Y at %l:%M %p') # 1/16/2012 at 1:35 PM
    result << " (#{time_ago_in_words(datetime)})"
  end
  
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
