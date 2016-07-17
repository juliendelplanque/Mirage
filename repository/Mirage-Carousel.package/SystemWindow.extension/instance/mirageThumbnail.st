*Mirage-Carousel
mirageThumbnail
	^ self valueOfProperty: #mirageThumbnail ifAbsentPut: [ self taskbarThumbnail ]