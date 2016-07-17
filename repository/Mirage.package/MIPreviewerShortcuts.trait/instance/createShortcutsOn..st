shortcuts creation
createShortcutsOn: aWPModel
	self
		on: self openWindowShortcut do: [ aWPModel openCurrentWindow ];
		on: self closeShortcut do: [ aWPModel close ];
		on: self nextShortcut do: [ aWPModel next ];
		on: self previousShortcut do: [ aWPModel previous ];
		on: self closeWindowShortcut do: [ aWPModel closeCurrentWindow ]