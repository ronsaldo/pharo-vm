C translation
initializeCTranslationDictionary 
	"Initialize the dictionary mapping message names to actions for C code generation."

	| pairs |
	
	translationDict := Dictionary new: 200.
	pairs := #(
	#&				#generateAnd:on:indent:
	#|				#generateOr:on:indent:
	#and:			#generateSequentialAnd:on:indent:
	#or:			#generateSequentialOr:on:indent:
	#not			#generateNot:on:indent:

	#+				#generatePlus:on:indent:
	#-				#generateMinus:on:indent:
	#negated		#generateNegated:on:indent:
	#*				#generateTimes:on:indent:
	#/				#generateDivide:on:indent:
	#//				#generateDivide:on:indent:
	#\\				#generateModulo:on:indent:
	#<<			#generateShiftLeft:on:indent:
	#>>			#generateShiftRight:on:indent:
	#min:			#generateMin:on:indent:
	#max:			#generateMax:on:indent:
	#between:and:	#generateBetweenAnd:on:indent:

	#bitAnd:			#generateBitAnd:on:indent:
	#bitOr:				#generateBitOr:on:indent:
	#bitXor:			#generateBitXor:on:indent:
	#bitShift:			#generateBitShift:on:indent:
	#signedBitShift:	#generateSignedBitShift:on:indent:
	#bitInvert32		#generateBitInvert32:on:indent:
	#bitClear:			#generateBitClear:on:indent:

	#<				#generateLessThan:on:indent:
	#<=			#generateLessThanOrEqual:on:indent:
	#=				#generateEqual:on:indent:
	#>				#generateGreaterThan:on:indent:
	#>=			#generateGreaterThanOrEqual:on:indent:
	#~=			#generateNotEqual:on:indent:
	#==			#generateEqual:on:indent:
	#~~			#generateNotEqual:on:indent:
	#isNil			#generateIsNil:on:indent:
	#notNil			#generateNotNil:on:indent:

	#whileTrue: 	#generateWhileTrue:on:indent:
	#whileFalse:	#generateWhileFalse:on:indent:
	#whileTrue 	#generateDoWhileTrue:on:indent:
	#whileFalse		#generateDoWhileFalse:on:indent:
	#to:do:			#generateToDo:on:indent:
	#to:by:do:		#generateToByDo:on:indent:
	#repeat 		#generateRepeat:on:indent:

	#ifTrue:			#generateIfTrue:on:indent:
	#ifFalse:		#generateIfFalse:on:indent:
	#ifTrue:ifFalse:	#generateIfTrueIfFalse:on:indent:
	#ifFalse:ifTrue:	#generateIfFalseIfTrue:on:indent:

	#ifNotNil:		#generateIfNotNil:on:indent:
	#ifNil:			#generateIfNil:on:indent:
	#ifNotNil:ifNil:	#generateIfNotNilIfNil:on:indent:
	#ifNil:ifNotNil:	#generateIfNilIfNotNil:on:indent:

	#at:				#generateAt:on:indent:
	#at:put:			#generateAtPut:on:indent:
	#basicAt:		#generateAt:on:indent:
	#basicAt:put:	#generateAtPut:on:indent:

	#integerValueOf:			#generateIntegerValueOf:on:indent:
	#integerObjectOf:			#generateIntegerObjectOf:on:indent:
	#isIntegerObject: 			#generateIsIntegerObject:on:indent:
	#cCode:					#generateInlineCCode:on:indent:
	#cCode:inSmalltalk:			#generateInlineCCode:on:indent:
	#cPreprocessorDirective:	#generateInlineCPreprocessorDirective:on:indent:
	#cppIf:ifTrue:ifFalse:		#generateInlineCppIfElse:on:indent:
	#cppIf:ifTrue:				#generateInlineCppIfElse:on:indent:
	#cCoerce:to:				#generateCCoercion:on:indent:
	#cCoerceSimple:to:			#generateCCoercion:on:indent:
	#addressOf:				#generateAddressOf:on:indent:
	#signedIntFromLong		#generateSignedIntFromLong:on:indent:
	#signedIntToLong			#generateSignedIntToLong:on:indent:
	#signedIntFromShort		#generateSignedIntFromShort:on:indent:
	#signedIntToShort			#generateSignedIntToShort:on:indent:
	#preIncrement				#generatePreIncrement:on:indent:
	#preDecrement			#generatePreDecrement:on:indent:
	#inline:						#generateInlineDirective:on:indent:
	#asFloat					#generateAsFloat:on:indent:
	#asInteger					#generateAsInteger:on:indent:
	#asUnsignedInteger		#generateAsUnsignedInteger:on:indent:
	#asLong					#generateAsLong:on:indent:
	#asUnsignedLong			#generateAsUnsignedLong:on:indent:
	#asSymbol					#generateAsSymbol:on:indent:
	#flag:						#generateFlag:on:indent:
	#anyMask:					#generateBitAnd:on:indent:
	#raisedTo:					#generateRaisedTo:on:indent:
	#touch:						#generateTouch:on:indent:

	#bytesPerWord 			#generateBytesPerWord:on:indent:
	#baseHeaderSize			#generateBaseHeaderSize:on:indent:
	
	#sharedCodeNamed:inCase:		#generateSharedCodeDirective:on:indent:

	#perform:							#generatePerform:on:indent:
	#perform:with:						#generatePerform:on:indent:
	#perform:with:with:					#generatePerform:on:indent:
	#perform:with:with:with:				#generatePerform:on:indent:
	#perform:with:with:with:with:		#generatePerform:on:indent:
	#perform:with:with:with:with:with:	#generatePerform:on:indent:

	#value								#generateValue:on:indent:
	#value:								#generateValue:on:indent:
	#value:value:						#generateValue:on:indent:

	#shouldNotImplement				#generateSmalltalkMetaError:on:indent:
	#shouldBeImplemented			#generateSmalltalkMetaError:on:indent:
	).

	1 to: pairs size by: 2 do: [:i |
		translationDict at: (pairs at: i) put: (pairs at: i + 1)].

	pairs := #(
	#ifTrue:					#generateIfTrueAsArgument:on:indent:	
	#ifFalse:				#generateIfFalseAsArgument:on:indent:
	#ifTrue:ifFalse:			#generateIfTrueIfFalseAsArgument:on:indent:
	#ifFalse:ifTrue:			#generateIfFalseIfTrueAsArgument:on:indent:
	#ifNotNil:				#generateIfNotNilAsArgument:on:indent:	
	#ifNil:					#generateIfNilAsArgument:on:indent:
	#ifNotNil:ifNil:			#generateIfNotNilIfNilAsArgument:on:indent:
	#ifNil:ifNotNil:			#generateIfNilIfNotNilAsArgument:on:indent:
	#cCode:				#generateInlineCCodeAsArgument:on:indent:
	#cCode:inSmalltalk:		#generateInlineCCodeAsArgument:on:indent:
	#cppIf:ifTrue:ifFalse:	#generateInlineCppIfElseAsArgument:on:indent:
	#cppIf:ifTrue:			#generateInlineCppIfElseAsArgument:on:indent:
	).

	asArgumentTranslationDict := Dictionary new: 8.
	1 to: pairs size by: 2 do: [:i |
		asArgumentTranslationDict at: (pairs at: i) put: (pairs at: i + 1)].
