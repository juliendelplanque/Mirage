"
The settings for the Windows Previewer's carousel.
"
Class {
	#name : #MICarouselSettings,
	#superclass : #Object,
	#classInstVars : [
		'thumbnailUpdateTime'
	],
	#category : 'Mirage-Carousel-Settings'
}

{ #category : #accessing }
MICarouselSettings class >> defaultThumbnailUpdateTime [
	^ 5 seconds
]

{ #category : #accessing }
MICarouselSettings class >> thumbnailUpdateThreadsPriority [
	^ 10
]

{ #category : #accessing }
MICarouselSettings class >> thumbnailUpdateTime [
	^ thumbnailUpdateTime ifNil: [ thumbnailUpdateTime := self defaultThumbnailUpdateTime ]
]

{ #category : #accessing }
MICarouselSettings class >> thumbnailUpdateTime: anObject [
	anObject isInteger
		ifTrue: [ thumbnailUpdateTime := anObject seconds ].
	
	anObject class = Duration
		ifFalse: [ self error: 'Thumbnail update time should be a duration or an integer.' ].
		
	thumbnailUpdateTime := anObject
]

{ #category : #'settings-definition' }
MICarouselSettings class >> wpThumbnailUpdateTimeSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder range: #mirageThumbnailUpdateTime)
		label: 'Thumbnail update time';
		description: 'Set the time between thumbnail updates in seconds' translated;
		setSelector: #thumbnailUpdateTime:;
		getSelector: #thumbnailUpdateTime;
		default: self thumbnailUpdateTime;
		range: (1 to: 30);
		target: self;
		parent: #mirageSettings.
]
