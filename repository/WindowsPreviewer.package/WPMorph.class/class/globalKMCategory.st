keymap
globalKMCategory
	^ KMRepository default globalCategories
			detect: [ :cat | cat name = self globalKMCategoryName ]