Extension { #name : #MIModelAnnouncement }

{ #category : #'*Mirage-Carousel' }
MIModelAnnouncement >> nextThumbnail [
	^ self nextWindow mirageThumbnail
]

{ #category : #'*Mirage-Carousel' }
MIModelAnnouncement >> previousThumbnail [
	^ self previousWindow mirageThumbnail
]

{ #category : #'*Mirage-Carousel' }
MIModelAnnouncement >> thumbnail [
	^ self window mirageThumbnail
]

{ #category : #'*Mirage-Carousel' }
MIModelAnnouncement >> thumbnails [
	^ self windows collect: #mirageThumbnail
]
