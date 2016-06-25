shortcuts creation
createShortcutsOn: aWPModel
	self
		on: Character space asKeyCombination do: [ aWPModel openCurrentWindow ];
		on: KMUntypeableSingleKeyCombination escape do: [ aWPModel close ];
		on: KMUntypeableSingleKeyCombination tab do: [ aWPModel next ];
		on: KMUntypeableSingleKeyCombination arrowRight do: [ aWPModel next ];
		on: KMModifier shift + KMUntypeableSingleKeyCombination tab do: [ aWPModel previous ];
		on: KMUntypeableSingleKeyCombination arrowLeft do: [ aWPModel previous ]