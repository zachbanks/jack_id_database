module LocationsHelper
  # Adds an * if given location has notes field that is not blank.
  def add_associated_notes_indicator_for(location)
    '<span class="has-notes">* </span>'.html_safe unless location.notes.blank? # html_safe allows html to be rendered in view.
  end
end
