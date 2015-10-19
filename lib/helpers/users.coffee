@Users = {}

Users.getUsernameForId = (userId) ->
	Meteor.users.findOne(userId).services.github.username

Users.getCurrentUsername = ->
	Users.getUsernameForId Meteor.userId()