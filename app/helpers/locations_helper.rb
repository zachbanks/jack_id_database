module LocationsHelper
  # Adds an * if given location has notes field that is not blank.
  def add_associated_notes_indicator_for(location)
    '<span class="has-notes">* </span>'.html_safe unless location.notes.blank? # html_safe allows html to be rendered in view.
  end

  # Returns a link of the name of the person to last modify the location and links to their email.
  def last_modified_by(location)
    link_to location.last_modified_by[:name], "mailto:#{location.last_modified_by[:email]}"
  end
end
