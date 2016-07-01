*WindowsPreviewer-Carousel
wpThumbnail
	^ self valueOfProperty: #wpThumbnail ifAbsentPut: [ self taskbarThumbnail ]