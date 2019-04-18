Extension { #name : #KMModifier }

{ #category : #'*Mirage' }
KMModifier >> mirageKeyboardKeys [
	^ self subclassResponsibility
]

{ #category : #'*Mirage' }
KMModifier >> mirageShouldOpenSelectedWindowAccordingTo: aKeyBoardKey [
	^ self mirageKeyboardKeys includes: aKeyBoardKey
]
