thumbnails
resetThumbnailsBordersOn: aWPModelAnnouncement
	aWPModelAnnouncement thumbnails
		do: [ :m | 
			m
				borderWidth: self thumbnailsBorderWidth;
				borderColor: self thumbnailsBorderColor ].