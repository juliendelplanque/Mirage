thumbnails
nextThumbnail
	| index |
	index := self thumbnails indexOf: currentThumbnail.
	currentThumbnail := index = self thumbnails size
					ifTrue: [ self thumbnails first ]
					ifFalse: [ currentThumbnail := self thumbnails at: index + 1 ].
	^ currentThumbnail