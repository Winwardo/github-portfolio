@github = new GitHub
	version: "3.0.0",
	timeout: 5000,
github.authenticate
	type: "oauth",
	key: "a184371f18d597225d40",
	secret: "c1feb33c6ea866412ad0485d821db0a0237c3e4a"