*Mirage-Carousel
mirageMutex
	^ self valueOfProperty: #mirageMutex ifAbsentPut: [ Mutex new ]