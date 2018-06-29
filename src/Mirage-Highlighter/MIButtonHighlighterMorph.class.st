"
I highlight a button of the taskbar.
"
Class {
	#name : #MIButtonHighlighterMorph,
	#superclass : #Morph,
	#category : 'Mirage-Highlighter-Morphic'
}

{ #category : #highlighting }
MIButtonHighlighterMorph >> highlightButton: aButton [
	self
		position: aButton position - (0@self height);
		width: aButton width
]

{ #category : #initialization }
MIButtonHighlighterMorph >> initialize [
	super initialize.
	self
		height: Smalltalk ui theme mirageTaskbarTasksHighlighterHeight;
		color: Smalltalk ui theme mirageTaskbarTasksHighlighterColor
]
