*Mirage-Carousel
scheduleThumbnailUpdate
	[ 
		MICarouselSettings thumbnailUpdateTime seconds wait.
		self mirageMutex 
			critical: [ 
				self isCollapsed ifFalse: [ self updateMirageThumbnail ] ].
		self continueToScheduleUpdate
			ifTrue: [ self scheduleThumbnailUpdate ]
	] forkNamed: 'MirageThumbnailUpdater'