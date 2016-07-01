accessing
windowsOrderingMethod
	^ windowsOrderingMethod ifNil: [ windowsOrderingMethod := WPSettings windowsOrderingChoices first first ]