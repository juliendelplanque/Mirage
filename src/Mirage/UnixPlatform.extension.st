Extension { #name : #UnixPlatform }

{ #category : #'*Mirage' }
UnixPlatform >> mirageDefaultOpenPreviewerShortcut [
	^ KMModifier ctrl + KMUntypeableSingleKeyCombination tab
]
