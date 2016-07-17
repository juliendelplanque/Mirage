thumbnails
refreshThumbnailsOn: aWPModelAnnouncement
	self removeAllMorphsIn: (self submorphsSatisfying: [ :m | m class ~= MITitleMorph ]).

	self
		extent:
			self availableWidth @ (aWPModelAnnouncement thumbnails detectMax: #height) height.
	self
		addAllMorphs: aWPModelAnnouncement thumbnails;
		positionThumbnailsOn: aWPModelAnnouncement;
		resetThumbnailsBordersOn: aWPModelAnnouncement