Template.splash.events
	"submit #findUsername": (event) ->
		event.preventDefault()
		username = $("#findUsername2").val()
		Router.go ("/u/" + username)
