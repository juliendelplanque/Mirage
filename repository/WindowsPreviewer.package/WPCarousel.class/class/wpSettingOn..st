settings
wpSettingOn: aBuilder
	<systemsettings>
	(aBuilder setting: #wpCarouselSetting)
		label: 'Carousel';
		description: 'Activate the Carousel view' translated;
		setSelector: #activate:;
		getSelector: #isActivated;
		target: self;
		parent: #wpViewsSettings.