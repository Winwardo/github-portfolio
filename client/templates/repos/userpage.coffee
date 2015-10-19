Template.userrepos.helpers
	"repos": ->
		Repos.activeForGivenUser @username

Template.userinfo.helpers
	"userinfo": ->
		GithubUsers.forUser @username

Template.userrepos.events
	"click button": ->
		Meteor.call "syncReposForUsername", @username
		Meteor.call "syncUser", @username