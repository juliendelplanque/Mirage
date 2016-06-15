thumbnails
previousThumbnail
	| index |
	index := self thumbnails indexOf: currentThumbnail.
	currentThumbnail := index = 1
					ifTrue: [ self thumbnails last ]
					ifFalse: [ currentThumbnail := self thumbnails at: index - 1 ].
	^ currentThumbnail