initialization
initializeThumbnailsOn: aWPOpenRequest
	aWPOpenRequest thumbnails
		do: [ :m | 
			m
				borderWidth: self thumbnailsBorderWidth;
				borderColor: self thumbnailsBorderColor ].
	self
		extent:
			(aWPOpenRequest thumbnails collect: [ :t | t width ]) sum @ (aWPOpenRequest thumbnails detectMax: #height) height.
	self
		addAllMorphs: aWPOpenRequest thumbnails;
		positionThumbnails: aWPOpenRequest thumbnails