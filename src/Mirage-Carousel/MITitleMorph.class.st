"
I am a title for the WPMorph.
"
Class {
	#name : #MITitleMorph,
	#superclass : #Morph,
	#instVars : [
		'title'
	],
	#category : 'Mirage-Carousel-Morphic'
}

{ #category : #'instance creation' }
MITitleMorph class >> title: aString color: aColor [
	^ self new
		title: aString;
		color: aColor;
		yourself
]

{ #category : #geometry }
MITitleMorph >> extent: aPoint [
	super extent: aPoint.
	title center: self center
]

{ #category : #initialization }
MITitleMorph >> initialize [
	super initialize.
	self color: Color gray.
	title := '' asMorph.
	title emphasis: 1. "Bold text"
	self addMorph: title
]

{ #category : #geometry }
MITitleMorph >> minimalHeight [
	self extent: self extent x @ title extent y
]

{ #category : #accessing }
MITitleMorph >> title [
	^ title
]

{ #category : #accessing }
MITitleMorph >> title: aString [
	title contents: aString.
	title center: self center
]

{ #category : #accessing }
MITitleMorph >> titleColor [
	^ title color
]

{ #category : #accessing }
MITitleMorph >> titleColor: aColor [
	title color: aColor
]
