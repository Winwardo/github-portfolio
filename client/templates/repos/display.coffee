Template.repoSimple.helpers
	"image": ->
		if @imageUrl
			return @imageUrl
		else
			"https://placeholdit.imgix.net/~text?txtsize=60&txt=" + @data.name + "&w=320&h=320&txttrack=0"

Template.two.helpers
	"activeRepos": ->
		Repos.activeForUser()
		
Template.two.events
	"click": ->
		console.log @