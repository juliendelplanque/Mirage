initialization
initializeThumbnails
	self
		thumbnailSize: World extent * (0.2 @ 0.2);
		thumbnailsBorderColor: Color red;
		thumbnails: self collectWindowsThumbnails.
	self thumbnails
		do: [ :m | 
			m
				borderWidth: 1;
				borderColor: Color black ].
	self
		extent:
			(self thumbnails collect: [ :t | t extent x ]) sum
				@ self thumbnails first extent y.
	self
		addAllMorphs: self thumbnails;
		positionThumbnails.
	currentThumbnail := self submorphs first