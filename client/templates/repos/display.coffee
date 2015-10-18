Template.two.helpers
	"activeRepos": ->
		Repos.activeForUser()
Template.two.events
	"click": ->
		console.log("hi")
		console.log @