Extension { #name : #KMShiftModifier }

{ #category : #'*Mirage' }
KMShiftModifier >> mirageKeyboardKeys [
	^ { KeyboardKey named: 'SHIFT_L' . KeyboardKey named: 'SHIFT_R' }
]
