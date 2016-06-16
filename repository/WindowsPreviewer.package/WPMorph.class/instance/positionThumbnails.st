thumbnails
positionThumbnails
	| horizontalShift |
	horizontalShift := 0.
	self thumbnails do: [ :thumbnail |
		thumbnail position: (thumbnail position x + horizontalShift) @ thumbnail position y.
		horizontalShift := horizontalShift + thumbnail extent x.
		thumbnail center: thumbnail center x @ self center y ].