class App.<%= @camelized_name %>View extends Backbone.View
	template: JST['templates/<%= @name %>']
	render: ->
		$(@el).html @template()
		$('body').append $(@el)
		@
