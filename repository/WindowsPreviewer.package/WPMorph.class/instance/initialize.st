initialization
initialize
	super initialize.
	self thumbnailSize: World extent * (0.2@0.2).
	self thumbnailsBorderColor: Color red.
	self thumbnails: self collectWindowsThumbnails.
	self thumbnails do: [ :m |
		m
			borderWidth: 1;
			borderColor: Color black ].
	self extent: (self thumbnails collect: [ :t | t extent x ]) sum@self thumbnails first extent y.
	self addAllMorphs: self thumbnails.
	self positionThumbnails.
	currentThumbnail := self submorphs first.
	
	self initializeTitleMorph.
	
	self createShortcuts.
	self selectThumbnailUsing: #yourself.