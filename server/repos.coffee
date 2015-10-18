Repos = new Meteor.Collection("repos")

Meteor.methods
	"syncRepos": ->
		console.log("Syncing repos");
		userId = Meteor.userId();
		user = Meteor.users.findOne(userId);
		gitusername = user.services.github.username;

		github = new GitHub
			version: "3.0.0",
			timeout: 5000

		result = github.repos.getFromUser
			user: gitusername

		Repos.remove({userId: userId})

		for repo in result
			Repos.insert
				userId: userId,
				data: repo,
				repoId: repo.id,
				isActive: false,
				sortId: -repo.stargazers_count,

	"setIsActive": (repoId, isActive) ->
		Repos.upsert
			'userId': Meteor.userId(),
			'repoId': repoId
		,
			$set: 
				'isActive': isActive

	"setSortValue": (repoId, sortValue) ->
		Repos.upsert
			'userId': Meteor.userId(),
			'repoId': repoId
		,
			$set:
				'sortId': sortValue
				
			