shortcuts
createShortcuts
	self
		on: Character space asKeyCombination do: [ self activateCurrentWindow ];
		on: KMUntypeableSingleKeyCombination escape do: [ self close ];
		on: KMUntypeableSingleKeyCombination tab do: [ self selectNextThumbnail ];
		on: KMModifier shift + KMUntypeableSingleKeyCombination tab do: [ self selectPreviousThumbnail ];
		on: KMModifier ctrl + $w asKeyCombination do: [ self closeCurrentWindow ]