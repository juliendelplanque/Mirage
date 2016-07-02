accessing
windowsOrderingMethod
	^ windowsOrderingMethod
		ifNil: [ windowsOrderingMethod := WPSettings windowsOrderingChoices sorted first tail ]