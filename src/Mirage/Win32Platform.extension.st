Extension { #name : #Win32Platform }

{ #category : #'*Mirage' }
Win32Platform >> mirageOpenPreviewerShortcut [
	^ KMModifier shift + KMUntypeableSingleKeyCombination tab
]
