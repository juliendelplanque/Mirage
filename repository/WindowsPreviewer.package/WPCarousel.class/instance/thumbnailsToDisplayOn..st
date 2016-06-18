thumbnails
thumbnailsToDisplayOn: aWPModelAnnouncement
	"Return the number of thumbnails to display."
	| count width | self flag: #'Maybe to remove'.
	count := 0.
	width := 0.
	aWPModelAnnouncement thumbnails do: [ :thumbnail |
		width < self availableWidth
			ifFalse: [ ^ count ].
		count := count + 1.
		width := width + thumbnail width ].

	^ count