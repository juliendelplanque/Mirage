"
I am the background of windows preview I hold all other views as submorphs.
"
Class {
	#name : #MIBackgroundMorph,
	#superclass : #Morph,
	#traits : 'MIModelListener + MIPreviewerShortcuts',
	#classTraits : 'MIModelListener classTrait + MIPreviewerShortcuts classTrait',
	#instVars : [
		'model',
		'shortcutToRestore'
	],
	#category : #'Mirage-Morphic'
}

{ #category : #'submorphs-add/remove' }
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
	self delete.
	MIModel openPreviewerKeymap shortcut: shortcutToRestore.
	shortcutToRestore := nil
]

{ #category : #'announcement handling' }
MIBackgroundMorph >> handleOpenRequest: aWPOpenRequest [
	model := aWPOpenRequest model.
	shortcutToRestore := MIModel openPreviewerKeymap shortcut.
	MIModel openPreviewerKeymap disable.
	self
		createShortcutsOn: aWPOpenRequest model;
		listenToFocusLossOn: aWPOpenRequest;
		extent: World extent;
		openInWorld;
		takeKeyboardFocus.
]

{ #category : #'announcement handling' }
MIBackgroundMorph >> handleWindowSelected: aWPThumbnailSelected [
	"Do nothing"
]

{ #category : #'events-processing' }
MIBackgroundMorph >> handlesKeyUp: anEvent [
	^ true
]

{ #category : #initialization }
MIBackgroundMorph >> initialize [
	super initialize.
	self
		color: Smalltalk ui theme mirageBackgroundColor;
		beSticky
]

{ #category : #'events-processing' }
MIBackgroundMorph >> keyUp: anEvent [
	super keyUp: anEvent.
	"User unpress shift key thus putting it up."
	anEvent key = (KeyboardKey named: 'SHIFT_L')
		ifTrue: [ model openCurrentWindow ]
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
