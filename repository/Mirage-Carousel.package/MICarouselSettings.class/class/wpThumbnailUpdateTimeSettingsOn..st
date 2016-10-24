settings-definition
wpThumbnailUpdateTimeSettingsOn: aBuilder
	<systemsettings>
	(aBuilder range: #mirageThumbnailUpdateTime)
		label: 'Thumbnail update time';
		description: 'Set the time between thumbnail updates in seconds' translated;
		setSelector: #thumbnailUpdateTime:;
		getSelector: #thumbnailUpdateTime;
		default: self thumbnailUpdateTime;
		range: (1 to: 30);
		target: self;
		parent: #mirageSettings.