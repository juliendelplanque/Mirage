accessing
windowForCurrentThumbnail
	| index |
	index := self thumbnails indexOf: current.
	^ (self windowsOrderedByTaskbar at: index)