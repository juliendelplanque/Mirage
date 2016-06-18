thumbnails
refreshThumbnailsOn: aWPOpenRequest
	self removeAllMorphsIn: (self submorphsSatisfying: [ :m | m class ~= WPTitleMorph ]).
	
	aWPOpenRequest thumbnails
		do: [ :m | 
			m
				borderWidth: self thumbnailsBorderWidth;
				borderColor: self thumbnailsBorderColor ].
	self
		extent:
			(aWPOpenRequest thumbnails collect: #width) sum @ (aWPOpenRequest thumbnails detectMax: #height) height.
	self
		addAllMorphs: aWPOpenRequest thumbnails;
		positionThumbnails: aWPOpenRequest thumbnails