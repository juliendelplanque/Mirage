Extension { #name : #MacOSPlatform }

{ #category : #'*Mirage' }
MacOSPlatform >> mirageDefaultOpenPreviewerShortcut [
	^ KMModifier shift + KMUntypeableSingleKeyCombination tab
]
