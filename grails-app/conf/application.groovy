

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'projet_grails1.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'projet_grails1.UserRole'
grails.plugin.springsecurity.authority.className = 'projet_grails1.Role'
grails.plugin.springsecurity.securityConfigType = "Annotation"
grails.plugins.springsecurity.successHandler.defaultTargetUrl = '/action/controller '
grails.plugins.springsecurity.ui.register.postRegisterUrl = '/action/controller '
grails.plugin.springsecurity.logout.postOnly = false


grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/dbconsole/**',   access: ['ROLE_ADMIN']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']],
	[pattern: '/role/**', 		 access: ['ROLE_ADMIN']],
	[pattern: '/user/**', 		 access: ['ROLE_ADMIN','ROLE_MOD','ROLE_USER']],
	[pattern: '/userRole/**', 	 access: ['ROLE_ADMIN','ROLE_MOD']],
    [pattern: '/pois/**', 	     access: ['ROLE_ADMIN','ROLE_MOD','ROLE_USER']],
    [pattern: '/groupPois/**', 	 access: ['ROLE_ADMIN','ROLE_MOD','ROLE_USER']],
    [pattern: '/localisation/**',access: ['ROLE_ADMIN','ROLE_MOD']],
    [pattern: '/media/**', 	     access: ['ROLE_ADMIN','ROLE_MOD']],



]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

