*WindowsPreviewer
wpThumbnail
	^ self valueOfProperty: #wpThumbnail ifAbsentPut: [ self taskbarThumbnail ]