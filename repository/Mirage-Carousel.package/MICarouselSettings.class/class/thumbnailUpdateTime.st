accessing
thumbnailUpdateTime
	^ thumbnailUpdateTime ifNil: [ thumbnailUpdateTime := self defaultThumbnailUpdateTime ]