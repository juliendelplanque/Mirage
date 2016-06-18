thumbnails
positionThumbnailsBeforeIndex: index on: aWPModelAnnouncement
	| selected position |
	selected := aWPModelAnnouncement thumbnail.
	position := selected position.

	(aWPModelAnnouncement thumbnails copyFrom: 1 to: index - 1) reversed do: [ :thumbnail |
			position := (position x - thumbnail width - self spaceBetweenThumbnails) @ position y.
			thumbnail
				position: position;
				center: thumbnail center x @ self center y ].