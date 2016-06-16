windows manipulation
topWindowIn: aWorldMorph
	^ (self windowsIn: aWorldMorph)
			detect: #isTopWindow
			ifNone: [ ENoTopWindow signal ]