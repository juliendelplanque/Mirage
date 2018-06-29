"
I define methods to manipulate the TaskbarMorph.
"
Trait {
	#name : #MITaskbarManipulator,
	#category : 'Mirage-Traits'
}

{ #category : #taskbar }
MITaskbarManipulator >> taskbarMorph [
	^ self taskbarMorphIn: World
]

{ #category : #taskbar }
MITaskbarManipulator >> taskbarMorphIn: aWorldMorph [
	^ aWorldMorph submorphs detect: [ :morph | morph isKindOf: TaskbarMorph ]
]
