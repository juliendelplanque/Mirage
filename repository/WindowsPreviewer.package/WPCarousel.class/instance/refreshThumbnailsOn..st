thumbnails
refreshThumbnailsOn: aWPOpenRequest
	self removeAllMorphsIn: (self submorphsSatisfying: [ :m | m class ~= WPTitleMorph ]).

	self
		extent:
			self availableWidth @ (aWPOpenRequest thumbnails detectMax: #height) height.
	self
		addAllMorphs: aWPOpenRequest thumbnails;
		positionThumbnailsOn: aWPOpenRequest