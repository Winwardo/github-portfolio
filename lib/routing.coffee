Router.configure
	layoutTemplate: 'mainLayout'

Router.route '/', -> @render 'index'
Router.route '/customise'
Router.route '/u/{:username}', ->
	this.render 'userpage', {username: this.params.username}