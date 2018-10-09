Extension { #name : #SystemWindow }

{ #category : #'*Mirage-Carousel' }
SystemWindow >> continueToScheduleUpdate [
	^ self valueOfProperty: #continueToScheduleUpdate ifAbsentPut: [ false ]
]

{ #category : #'*Mirage-Carousel' }
SystemWindow >> continueToScheduleUpdate: aBoolean [
	self setProperty: #continueToScheduleUpdate toValue: aBoolean
]

{ #category : #'*Mirage-Carousel' }
SystemWindow >> mirageMutex [
	^ self valueOfProperty: #mirageMutex ifAbsentPut: [ Mutex new ]
]

{ #category : #'*Mirage-Carousel' }
SystemWindow >> mirageThumbnail [
	self continueToScheduleUpdate
		ifFalse: [ 
			self continueToScheduleUpdate: true.
			self onAnnouncement: WindowClosed do: [ 
				self continueToScheduleUpdate: false ].
			self scheduleThumbnailUpdate ].
	self mirageMutex critical: [ 
		^ self
			valueOfProperty: self mirageThumbnailPropertySymbol
			ifAbsentPut: [ 
				self continueToScheduleUpdate: true.
				self taskbarThumbnail ] ]
]

{ #category : #'*Mirage-Carousel' }
SystemWindow >> mirageThumbnailPropertySymbol [
	^ #mirageThumbnail
]

{ #category : #'*Mirage-Carousel' }
SystemWindow >> scheduleThumbnailUpdate [
	([ 
		MICarouselSettings thumbnailUpdateTime wait.
		self mirageMutex 
			critical: [ 
				self isCollapsed ifFalse: [ self updateMirageThumbnail ] ].
		self continueToScheduleUpdate
			ifTrue: [ self scheduleThumbnailUpdate ]
	] forkNamed: 'MirageThumbnailUpdater') priority: MICarouselSettings thumbnailUpdateThreadsPriority
]

{ #category : #'*Mirage-Carousel' }
SystemWindow >> updateMirageThumbnail [
	self
		setProperty: self mirageThumbnailPropertySymbol
		toValue: self taskbarThumbnail
]
