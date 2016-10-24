*Mirage-Carousel
scheduleThumbnailUpdate
	[ 
		MICarouselSettings thumbnailUpdateTime seconds wait.
		self mirageMutex critical: [ self updateMirageThumbnail ].
		self continueToScheduleUpdate
			ifTrue: [ self scheduleThumbnailUpdate ]
	] forkNamed: 'MirageThumbnailUpdater'.