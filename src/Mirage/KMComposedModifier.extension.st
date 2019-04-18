Extension { #name : #KMComposedModifier }

{ #category : #'*Mirage' }
KMComposedModifier >> mirageKeyboardKeys [
	^ self modifiers first mirageKeyboardKeys
]
