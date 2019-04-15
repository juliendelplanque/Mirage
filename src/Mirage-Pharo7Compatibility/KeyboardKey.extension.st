Extension { #name : #KeyboardKey }

{ #category : #'*Mirage-Pharo7Compatibility' }
KeyboardKey class >> named: aString [
	^ KeyTable detect: [ :keyboardKey | keyboardKey name = aString ]
]
