as yet unclassified
defineAsTarget
	gen puts:
'
add_custom_target(${libName} 
	DEPENDS ${externalModulesDir}/${libraryFileName}
	)
'