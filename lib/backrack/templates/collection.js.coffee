class App.Bookmarks extends Backbone.Collection
	<%- if @url -%>
	url: <%= @url %>
	<%- end -%>
	<%- if @model -%>
	model: App.<%= @model %>
	<%- end -%>
