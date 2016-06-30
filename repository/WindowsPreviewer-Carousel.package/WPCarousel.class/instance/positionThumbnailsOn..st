thumbnails
positionThumbnailsOn: aWPModelAnnouncement
	| index |
	aWPModelAnnouncement thumbnail center: self center.
	
	index := aWPModelAnnouncement thumbnails indexOf: aWPModelAnnouncement thumbnail.
	self
		positionThumbnailsBeforeIndex: index on: aWPModelAnnouncement;
		positionThumbnailsAfterIndex: index on: aWPModelAnnouncement