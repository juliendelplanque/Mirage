Extension { #name : #Win32Platform }

{ #category : #'*Mirage' }
Win32Platform >> mirageDefaultOpenPreviewerShortcut [
	^ KMModifier shift + KMUntypeableSingleKeyCombination tab
]
