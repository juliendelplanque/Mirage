thumbnails
positionThumbnailsOn: aWPThumbnailSelected
	| "horizontalShift" position selected index |
	selected := aWPThumbnailSelected thumbnail.
	index := aWPThumbnailSelected thumbnails indexOf: selected.
	selected center: self center.
	
	position := selected position.

	(aWPThumbnailSelected thumbnails copyFrom: 1 to: index - 1) reversed do: [ :thumbnail |
			position := (position x - thumbnail width - self spaceBetweenThumbnails) @ position y.
			thumbnail
				position: position;
				center: thumbnail center x @ self center y ].

	position := selected position + selected width + self spaceBetweenThumbnails.
	aWPThumbnailSelected thumbnails from: index + 1 to: aWPThumbnailSelected thumbnails size do: [ :thumbnail |
			thumbnail
				position: position;
				center: thumbnail center x @ self center y.
			position := (position x + thumbnail width + self spaceBetweenThumbnails) @ position y ]