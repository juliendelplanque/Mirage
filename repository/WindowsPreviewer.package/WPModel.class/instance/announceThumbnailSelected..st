announcing
announceThumbnailSelected: index
	self announce: (WPThumbnailSelected new
							model: self;
							yourself)