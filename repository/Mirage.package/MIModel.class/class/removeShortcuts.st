keymap
removeShortcuts
	self globalKMCategory keymaps
		do: [ :keymap | 
			self globalKMCategory
				removeKeymapEntry: keymap]