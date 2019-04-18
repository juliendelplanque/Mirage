Extension { #name : #MacOSPlatform }

{ #category : #'*Mirage' }
MacOSPlatform >> mirageDefaultOpenPreviewerShortcut [
	^ KMModifier control + KMUntypeableSingleKeyCombination tab
]
