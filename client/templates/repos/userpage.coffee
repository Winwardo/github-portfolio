Template.userpage.helpers
	"repos": ->
		Repos.activeForGivenUser @username

Template.userpage.events
	"click button": ->
		Meteor.call "syncReposForUsername", @username