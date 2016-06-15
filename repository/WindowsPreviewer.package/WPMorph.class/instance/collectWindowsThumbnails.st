thumbnails
collectWindowsThumbnails
	^ self windowsOrderedByTaskbar collect: [ :window |
		window taskbarThumbnail ]