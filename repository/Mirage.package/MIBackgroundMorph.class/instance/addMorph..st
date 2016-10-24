as yet unclassified
addMorph: aMorph
	| firstGreater |
	firstGreater := submorphs
							detect: [ :morph | aMorph mirageLevel < morph mirageLevel ]
							ifNone: [ ^ self addMorphBack: aMorph ].
	^ self addMorph: aMorph inFrontOf: firstGreater