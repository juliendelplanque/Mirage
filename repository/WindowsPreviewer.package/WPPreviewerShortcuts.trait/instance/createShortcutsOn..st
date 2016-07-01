shortcuts creation
createShortcutsOn: aWPModel
	self
		on: Character space asKeyCombination
				| KMUntypeableSingleKeyCombination enter
				| Character cr asKeyCombination
				| Character lf asKeyCombination do: [ aWPModel openCurrentWindow ];
		on: KMUntypeableSingleKeyCombination escape do: [ aWPModel close ];
		on: KMUntypeableSingleKeyCombination tab
				| KMUntypeableSingleKeyCombination arrowRight do: [ aWPModel next ];
		on: (KMModifier shift + KMUntypeableSingleKeyCombination tab)
				| KMUntypeableSingleKeyCombination arrowLeft do: [ aWPModel previous ]