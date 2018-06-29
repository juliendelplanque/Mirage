"
I define methods to manipulate windows of a WorldMorph.
"
Trait {
	#name : #MIWindowManipulator,
	#traits : 'MITaskbarManipulator',
	#classTraits : 'MITaskbarManipulator classTrait',
	#category : 'Mirage-Traits'
}

{ #category : #'windows manipulation' }
MIWindowManipulator >> topWindow [
	^ self topWindowIn: World
]

{ #category : #'windows manipulation' }
MIWindowManipulator >> topWindowIn: aWorldMorph [
	^ (self windowsIn: aWorldMorph)
			detect: #isTopWindow
			ifNone: [ ENoTopWindow signal ]
]

{ #category : #'windows manipulation' }
MIWindowManipulator >> windows [
	^ self windowsIn: World
]

{ #category : #'windows manipulation' }
MIWindowManipulator >> windowsIn: aWorldMorph [
	^ aWorldMorph submorphs select: [ :morph | morph isKindOf: SystemWindow ]
]

{ #category : #'windows manipulation' }
MIWindowManipulator >> windowsOrderedByTaskbar [
	^ self windowsOrderedByTaskbarIn: World
]

{ #category : #'windows manipulation' }
MIWindowManipulator >> windowsOrderedByTaskbarIn: aWorldMorph [
	^ ((self taskbarMorphIn: aWorldMorph) orderedTasks
			collect: #morph) select: [ :morph | morph isKindOf: SystemWindow ]
]

{ #category : #'windows manipulation' }
MIWindowManipulator >> windowsOrderedByWorld [
	^ self windowsOrderedByWorldIn: World
]

{ #category : #'windows manipulation' }
MIWindowManipulator >> windowsOrderedByWorldIn: aWorldMorph [
	^ aWorldMorph submorphs select: #isSystemWindow
]
