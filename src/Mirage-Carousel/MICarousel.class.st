"
I am the preview of the windows available in world.
"
Class {
	#name : #MICarousel,
	#superclass : #Morph,
	#traits : 'MIModelListener + MIViewSetting',
	#classTraits : 'MIModelListener classTrait + MIViewSetting classTrait',
	#instVars : [
		'thumbnailsSelectedBorderColor',
		'thumbnailsBorderColor',
		'thumbnailsBorderWidth',
		'titleMorph',
		'spaceBetweenThumbnails'
	],
	#classInstVars : [
		'isActivated'
	],
	#category : 'Mirage-Carousel-Morphic'
}

{ #category : #accessing }
MICarousel class >> activate: aBoolean [
	isActivated := aBoolean
]

{ #category : #'initialize-release' }
MICarousel class >> initialize [
	super initialize.
	self activate: false
]

{ #category : #accessing }
MICarousel class >> isActivated [
	^ isActivated
]

{ #category : #settings }
MICarousel class >> wpSettingOn: aBuilder [
	<systemsettings>
	(self buildSettingNamed: #wpCarouselSetting with: aBuilder)
		label: 'Carousel';
		description: 'Activate the Carousel view' translated
]

{ #category : #accessing }
MICarousel >> availableWidth [
	^ World width
]

{ #category : #opening }
MICarousel >> beCenteredInWorld [
	self center: World center
]

{ #category : #'announcement handling' }
MICarousel >> handleCloseRequest: aWPCloseRequest [
	aWPCloseRequest model announcer unsubscribe: self.
	self announcer unsubscribe: self
]

{ #category : #'announcement handling' }
MICarousel >> handleOpenRequest: aWPOpenRequest [
	self
		refreshThumbnailsOn: aWPOpenRequest;
		initializeTitleMorph;
		openCenteredInBackground: aWPOpenRequest background
]

{ #category : #'announcement handling' }
MICarousel >> handleWindowSelected: aWPThumbnailSelected [

	self
		refreshThumbnailsOn: aWPThumbnailSelected;
		refreshTitleOn: aWPThumbnailSelected.
	
	aWPThumbnailSelected thumbnail
		borderColor: self thumbnailsSelectedBorderColor.
]

{ #category : #initialization }
MICarousel >> initialize [
	super initialize.
	self
		color: Smalltalk ui theme mirageCarouselColor;
		thumbnailsBorderColor: Smalltalk ui theme mirageThumbnailsBorderColor;
		thumbnailsSelectedBorderColor: Smalltalk ui theme mirageThumbnailsSelectedBorderColor;
		thumbnailsBorderWidth: Smalltalk ui theme mirageThumbnailsBorderWidth;
		spaceBetweenThumbnails: Smalltalk ui theme mirageSpaceBetweenThumbnails;
		mirageLevel: 100
]

{ #category : #initialization }
MICarousel >> initializeTitleMorph [
	titleMorph := MITitleMorph new.
	titleMorph
		color: Color transparent;
		titleColor: self thumbnailsSelectedBorderColor;
		extent: self extent x @ titleMorph extent y;
		minimalHeight;
		position: titleMorph position x @ (titleMorph position y + self extent y).
	self addMorph: titleMorph.
]

{ #category : #testing }
MICarousel >> isWindowsPreviewer [
	^ true
]

{ #category : #opening }
MICarousel >> openCenteredInBackground: aWPBackgroundMorph [
	aWPBackgroundMorph addMorph: self.
	self beCenteredInWorld
]

{ #category : #thumbnails }
MICarousel >> positionThumbnailsAfterIndex: index on: aWPModelAnnouncement [
	| selected position |
	selected := aWPModelAnnouncement thumbnail.
	position := selected position + selected width + self spaceBetweenThumbnails.
	
	aWPModelAnnouncement thumbnails from: index + 1 to: aWPModelAnnouncement thumbnails size do: [ :thumbnail |
			thumbnail
				position: position;
				center: thumbnail center x @ self center y.
			position := (position x + thumbnail width + self spaceBetweenThumbnails) @ position y ]
]

{ #category : #thumbnails }
MICarousel >> positionThumbnailsBeforeIndex: index on: aWPModelAnnouncement [
	| selected position |
	selected := aWPModelAnnouncement thumbnail.
	position := selected position.

	(aWPModelAnnouncement thumbnails copyFrom: 1 to: index - 1) reversed do: [ :thumbnail |
			position := (position x - thumbnail width - self spaceBetweenThumbnails) @ position y.
			thumbnail
				position: position;
				center: thumbnail center x @ self center y ].
]

{ #category : #thumbnails }
MICarousel >> positionThumbnailsOn: aWPModelAnnouncement [
	| index |
	aWPModelAnnouncement thumbnail center: self center.
	
	index := aWPModelAnnouncement thumbnails indexOf: aWPModelAnnouncement thumbnail.
	self
		positionThumbnailsBeforeIndex: index on: aWPModelAnnouncement;
		positionThumbnailsAfterIndex: index on: aWPModelAnnouncement
]

{ #category : #thumbnails }
MICarousel >> refreshThumbnailsOn: aWPModelAnnouncement [
	self removeAllMorphsIn: (self submorphsSatisfying: [ :m | m class ~= MITitleMorph ]).

	self
		extent:
			self availableWidth @ (aWPModelAnnouncement thumbnails detectMax: #height) height.
	self
		addAllMorphs: aWPModelAnnouncement thumbnails;
		positionThumbnailsOn: aWPModelAnnouncement;
		resetThumbnailsBordersOn: aWPModelAnnouncement
]

{ #category : #title }
MICarousel >> refreshTitleOn: aWPThumbnailSelected [
	titleMorph title: aWPThumbnailSelected window label contents
]

{ #category : #thumbnails }
MICarousel >> resetThumbnailsBordersOn: aWPModelAnnouncement [
	aWPModelAnnouncement thumbnails
		do: [ :m | 
			m
				borderWidth: self thumbnailsBorderWidth;
				borderColor: self thumbnailsBorderColor ].
]

{ #category : #accessing }
MICarousel >> spaceBetweenThumbnails [
	^ spaceBetweenThumbnails
]

{ #category : #accessing }
MICarousel >> spaceBetweenThumbnails: anObject [
	spaceBetweenThumbnails := anObject
]

{ #category : #accessing }
MICarousel >> thumbnailsBorderColor [
	^ thumbnailsBorderColor
]

{ #category : #accessing }
MICarousel >> thumbnailsBorderColor: aColor [
	thumbnailsBorderColor := aColor
]

{ #category : #accessing }
MICarousel >> thumbnailsBorderWidth [
	^ thumbnailsBorderWidth
]

{ #category : #accessing }
MICarousel >> thumbnailsBorderWidth: anObject [
	thumbnailsBorderWidth := anObject
]

{ #category : #accessing }
MICarousel >> thumbnailsSelectedBorderColor [
	^ thumbnailsSelectedBorderColor
]

{ #category : #accessing }
MICarousel >> thumbnailsSelectedBorderColor: anObject [
	thumbnailsSelectedBorderColor := anObject
]
