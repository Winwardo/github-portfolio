Router.configure
	layoutTemplate: 'mainLayout'

Router.route '/', -> @render 'index'
Router.route '/second'