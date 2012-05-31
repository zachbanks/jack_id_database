module ApplicationHelper
  include ActiveSupport::Inflector
  
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

  # TODO: Add description of method.
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: { id: id, fields: fields.gsub("\n", "") })
  end
  
  # Returns link to floor plan for a location object, if that floor plan exists.
  def link_to_floor_plan(location)
    link_to 'Show Floor Plan', display_floor_plan_path(location) if has_floor_plan?(location)
  end


  # Generates a random string from lower case letters.
  # @param length [Fixnum] Desired length of the random string.
  # @param character_set [Range or Array] Range or array of desired characters to be included in random strings.
  # @return [String] Random string of lowercase letters.
  def generate_random_string(length, character_set)
    charset = character_set.to_a
    (0...length).map{ charset[rand(charset.size)] }.join
  end

  # Make will_paginate play nice with Twitter Bootstrap.
  # Based on https://gist.github.com/1205828, in turn based on https://gist.github.com/1182136
  class BootstrapLinkRenderer < ::WillPaginate::ActionView::LinkRenderer
    protected

    def html_container(html)
      tag :div, tag(:ul, html), container_attributes
    end

    def page_number(page)
      tag :li, link(page, page, :rel => rel_value(page)), :class => ('active' if page == current_page)
    end

    def gap
      tag :li, link(super, '#'), :class => 'disabled'
    end

    def previous_or_next_page(page, text, classname)
      tag :li, link(text, page || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
    end
  end

  def page_navigation_links(pages)
    will_paginate(pages, :class => 'pagination', :inner_window => 2, :outer_window => 0, :renderer => BootstrapLinkRenderer, :previous_label => '&larr;'.html_safe, :next_label => '&rarr;'.html_safe)
  end
end

