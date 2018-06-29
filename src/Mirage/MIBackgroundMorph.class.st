"
I am the background of windows preview I hold all other views as submorphs.
"
Class {
	#name : #MIBackgroundMorph,
	#superclass : #Morph,
	#traits : 'MIModelListener + MIPreviewerShortcuts',
	#classTraits : 'MIModelListener classTrait + MIPreviewerShortcuts classTrait',
	#category : 'Mirage-Morphic'
}

{ #category : #'as yet unclassified' }
MIBackgroundMorph >> addMorph: aMorph [
	| firstGreater |
	firstGreater := submorphs
							detect: [ :morph | aMorph mirageLevel < morph mirageLevel ]
							ifNone: [ ^ self addMorphBack: aMorph ].
	^ self addMorph: aMorph inFrontOf: firstGreater
]

{ #category : #'announcement handling' }
MIBackgroundMorph >> handleCloseRequest: aWPCloseRequest [
	self announcer unsubscribe: self.
	aWPCloseRequest model announcer unsubscribe: self.
	self delete
]

{ #category : #'announcement handling' }
MIBackgroundMorph >> handleOpenRequest: aWPOpenRequest [
	self
		createShortcutsOn: aWPOpenRequest model;
		listenToFocusLossOn: aWPOpenRequest;
		extent: World extent;
		openInWorld;
		takeKeyboardFocus
]

{ #category : #'announcement handling' }
MIBackgroundMorph >> handleWindowSelected: aWPThumbnailSelected [
	"Do nothing"
]

{ #category : #initialization }
MIBackgroundMorph >> initialize [
	super initialize.
	self
		color: Smalltalk ui theme mirageBackgroundColor;
		beSticky
]

{ #category : #listening }
MIBackgroundMorph >> listenToFocusLossOn: aWPOpenRequest [
	self announcer when: MorphLostFocus do: [ :ann |
		aWPOpenRequest model close ].
]

{ #category : #accessing }
MIBackgroundMorph >> wantsToBeTopmost [
	^ true
]
