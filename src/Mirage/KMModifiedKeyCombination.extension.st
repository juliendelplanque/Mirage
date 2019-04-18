Extension { #name : #KMModifiedKeyCombination }

{ #category : #'*Mirage' }
KMModifiedKeyCombination >> mirageShouldOpenSelectedWindowAccordingTo: aKeyBoardKey [
	^ self modifier mirageShouldOpenSelectedWindowAccordingTo: aKeyBoardKey
]
