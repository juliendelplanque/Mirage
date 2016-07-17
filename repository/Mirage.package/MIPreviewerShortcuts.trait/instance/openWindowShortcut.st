shortcuts
openWindowShortcut
	^ Character space asKeyCombination
		| KMUntypeableSingleKeyCombination enter
		| Character cr asKeyCombination
		| Character lf asKeyCombination