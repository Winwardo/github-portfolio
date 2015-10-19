Router.configure
	layoutTemplate: 'mainLayout'

Router.onBeforeAction ->
	unless Meteor.userId()
		@render 'index'
	else
		@next()
,
	only: ['customise']

Router.route '/', -> @render 'index'
Router.route '/customise'
Router.route '/example'
Router.route '/u/:username', ->
	this.render 'userpage', {'data': {'username': this.params.username}}