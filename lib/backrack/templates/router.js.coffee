class App.Router extends Backbone.Router
	routes:
		'': 'root'
	root: ->
		view = new App.RootView
		view.render()
