Extension { #name : #MacOSPlatform }

{ #category : #'*Mirage' }
MacOSPlatform >> mirageOpenPreviewerShortcut [
	^ KMModifier shift + KMUntypeableSingleKeyCombination tab
]
