# Put application related configuration in this file

window.App =
	VERSION_MAJOR:   '0'
	VERSION_MINOR:   '0'
	VERSION_TINY:    '1'
	VERSION_PRE:     ''
	version: ->
		_.compact([ @VERSION_MAJOR, @VERSION_MINOR, @VERSION_TINY, @VERSION_PRE ]).join('.')
