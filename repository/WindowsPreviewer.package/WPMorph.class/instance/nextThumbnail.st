thumbnails
nextThumbnail
	| index |
	index := self thumbnails indexOf: current.
	current := index = self thumbnails size
					ifTrue: [ self thumbnails first ]
					ifFalse: [ current := self thumbnails at: index + 1 ].
	^ current