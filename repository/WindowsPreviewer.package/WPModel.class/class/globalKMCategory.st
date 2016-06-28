keymap
globalKMCategory
	^ KMRepository default globalCategories
			detect: [ :cat | cat name = self globalKMCategoryName ]
			ifNone: [ 
				self createGlobalKMCategory.
				^ self globalKMCategory ]