thumbnails
previousThumbnail
	| index |
	index := self thumbnails indexOf: current.
	current := index = 1
					ifTrue: [ self thumbnails last ]
					ifFalse: [ current := self thumbnails at: index - 1 ].
	^ current