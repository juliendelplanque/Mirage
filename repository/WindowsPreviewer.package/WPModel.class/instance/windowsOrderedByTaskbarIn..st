windows manipulation
windowsOrderedByTaskbarIn: aWorldMorph
	^ ((self taskbarMorphIn: aWorldMorph) orderedTasks
			collect: #morph) select: [ :morph | morph isKindOf: SystemWindow ]