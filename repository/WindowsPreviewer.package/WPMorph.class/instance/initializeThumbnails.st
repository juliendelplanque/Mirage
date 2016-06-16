initialization
initializeThumbnails
	self
		thumbnailSize: World extent * (0.2 @ 0.2);
		thumbnailsBorderColor: Color orange;
		thumbnails: self collectWindowsThumbnails.
	self thumbnails
		do: [ :m | 
			m
				borderWidth: 1;
				borderColor: Color black ].
	self
		extent:
			(self thumbnails collect: [ :t | t width ]) sum @ (self thumbnails detectMax: #height) height.
	self
		addAllMorphs: self thumbnails;
		positionThumbnails.
	currentThumbnail := self submorphs first