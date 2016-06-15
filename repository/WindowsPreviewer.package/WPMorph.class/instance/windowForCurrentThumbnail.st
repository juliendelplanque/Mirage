accessing
windowForCurrentThumbnail
	| index |
	index := self thumbnails indexOf: currentThumbnail.
	^ (self windowsOrderedByTaskbar at: index)