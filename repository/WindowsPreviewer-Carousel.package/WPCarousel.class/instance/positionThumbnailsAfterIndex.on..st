thumbnails
positionThumbnailsAfterIndex: index on: aWPModelAnnouncement
	| selected position |
	selected := aWPModelAnnouncement thumbnail.
	position := selected position + selected width + self spaceBetweenThumbnails.
	
	aWPModelAnnouncement thumbnails from: index + 1 to: aWPModelAnnouncement thumbnails size do: [ :thumbnail |
			thumbnail
				position: position;
				center: thumbnail center x @ self center y.
			position := (position x + thumbnail width + self spaceBetweenThumbnails) @ position y ]