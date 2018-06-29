"
I highlight a SystemWindow (or subclass).
"
Class {
	#name : #MIWindowHighlighterMorph,
	#superclass : #BorderedMorph,
	#category : 'Mirage-Highlighter-Morphic'
}

{ #category : #highlighting }
MIWindowHighlighterMorph >> highlightWindow: aSystemWindow [
	self
		position: aSystemWindow position; 
		extent: aSystemWindow extent
]

{ #category : #initialization }
MIWindowHighlighterMorph >> initialize [
	super initialize.
	self
		color: Color transparent;
		borderColor: Smalltalk ui theme mirageHighlighterBorderColor;
		borderWidth: Smalltalk ui theme mirageHighlighterBorderWidth
]
