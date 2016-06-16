windows manipulation
taskbarMorphIn: aWorldMorph
	^ aWorldMorph submorphs detect: [ :morph | morph isKindOf: TaskbarMorph ]