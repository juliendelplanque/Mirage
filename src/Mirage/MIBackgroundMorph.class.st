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

{ #category : #'event handling' }
MIBackgroundMorph >> keyUp: anEvent [
	"This hook is used to open currently selected window when user release modifier key of the shorcut used to open Mirage.
	 For example, if Mirage is opened using Shift+Tab, the selected window will be opened when Shift key is released.
	"
	super keyUp: anEvent.
	(shortcutToRestore mirageShouldOpenSelectedWindowAccordingTo: anEvent key)
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
