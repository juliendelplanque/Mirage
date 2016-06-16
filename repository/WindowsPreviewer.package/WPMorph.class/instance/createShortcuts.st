shortcuts
createShortcuts
	self
		on: Character space asKeyCombination do: [ self wpModel openCurrent ];
		on: KMUntypeableSingleKeyCombination escape do: [ self wpModel close ];
		on: KMUntypeableSingleKeyCombination tab do: [ self wpModel next ];
		on: KMModifier shift + KMUntypeableSingleKeyCombination tab do: [ self wpModel previous ]