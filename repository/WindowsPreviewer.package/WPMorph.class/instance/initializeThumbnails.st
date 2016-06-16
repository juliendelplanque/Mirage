initialization
initializeThumbnails
	self
		thumbnailsBorderColor: Color black;
		thumbnailsSelectedBorderColor: Color orange;
		thumbnailsBorderWidth: 3;
		thumbnails: self collectWindowsThumbnails.
	self thumbnails
		do: [ :m | 
			m
				borderWidth: self thumbnailsBorderWidth;
				borderColor: self thumbnailsBorderColor ].
	self
		extent:
			(self thumbnails collect: [ :t | t width ]) sum @ (self thumbnails detectMax: #height) height.
	self
		addAllMorphs: self thumbnails;
		positionThumbnails.
	currentThumbnail := self submorphs first