windows manipulation
windowsIn: aWorldMorph
	^ aWorldMorph submorphs select: [ :morph | morph isKindOf: SystemWindow ]