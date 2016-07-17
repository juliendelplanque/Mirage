accessing
windowsOrderingMethod
	^ windowsOrderingMethod
		ifNil: [ windowsOrderingMethod := MISettings windowsOrderingChoices sorted first tail ]