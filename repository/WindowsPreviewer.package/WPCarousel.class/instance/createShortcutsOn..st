shortcuts
createShortcutsOn: aWPOpenRequest
	self
		on: Character space asKeyCombination do: [ aWPOpenRequest model openCurrentWindow ];
		on: KMUntypeableSingleKeyCombination escape do: [ aWPOpenRequest model close ];
		on: KMUntypeableSingleKeyCombination tab do: [ aWPOpenRequest model next ];
		on: KMUntypeableSingleKeyCombination arrowRight do: [ aWPOpenRequest model next ];
		on: KMModifier shift + KMUntypeableSingleKeyCombination tab do: [ aWPOpenRequest model previous ];
		on: KMUntypeableSingleKeyCombination arrowLeft do: [ aWPOpenRequest model previous ]