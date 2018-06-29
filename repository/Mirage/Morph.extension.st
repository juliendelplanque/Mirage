Extension { #name : #Morph }

{ #category : #'*Mirage' }
Morph >> mirageLevel [
	^ self valueOfProperty: #mirageLevel ifAbsent: [ ^ Float infinity ]
]

{ #category : #'*Mirage' }
Morph >> mirageLevel: anInteger [
	^ self setProperty: #mirageLevel toValue: anInteger 
]
