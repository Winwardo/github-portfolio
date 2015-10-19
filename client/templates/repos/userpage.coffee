Template.userrepos.helpers
	"repos": ->
		Repos.activeForGivenUser @username

Template.userinfo.helpers
	"userinfo": ->
		profileInfo = GithubUsers.forUser @username
		document.title = profileInfo.name + "'s GitHub portfolio"
		profileInfo

Template.userrepos.events
	"click button": ->
		Meteor.call "syncReposForUsername", @username
		Meteor.call "syncUser", @username

Template.userpage.helpers
	"userHasInfo": ->
		user = GithubUsers.forUser @username
		if user
			return true
		else
			Meteor.call "syncReposForUsername", @username
			Meteor.call "syncUser", @username
			return false