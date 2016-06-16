thumbnails
positionThumbnails
	| horizontalShift |
	horizontalShift := 0.
	self thumbnails do: [ :thumbnail |
		thumbnail position: (self position x + horizontalShift) @ self position y.
		horizontalShift := horizontalShift + thumbnail width.
		thumbnail center: thumbnail center x @ self center y ].