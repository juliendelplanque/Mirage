initialization
initializeThumbnailsBorderOn: aWPOpenRequest
	aWPOpenRequest thumbnails
		do: [ :m | 
			m
				borderWidth: self thumbnailsBorderWidth;
				borderColor: self thumbnailsBorderColor ].