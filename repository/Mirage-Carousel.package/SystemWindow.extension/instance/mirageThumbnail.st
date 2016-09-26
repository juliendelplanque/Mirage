*Mirage-Carousel
mirageThumbnail
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