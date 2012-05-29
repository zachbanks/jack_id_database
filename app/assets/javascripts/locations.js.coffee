# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery -> 
	# Hide Jack ID fieldset when Delete link is clicked.
	# Grab form and listen to on click event on the remove-fields link.
	$('form').on 'click', '.remove_fields', (event) ->
		# Change the hidden field value.
		$(this).prev('input[type=hidden]').val('1')

		# Hide the nearest fieldset.
		$(this).closest('fieldset').fadeOut()

		# Prevent normal link behavior.
		event.preventDefault()
	
	# See Railscasts episode for more details about implementation.
	# http://railscasts.com/episodes/196-nested-model-form-revised
	$('form').on 'click', '.add_fields', (event) ->
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		$(this).before($(this).data('fields').replace(regexp, time))
		event.preventDefault()