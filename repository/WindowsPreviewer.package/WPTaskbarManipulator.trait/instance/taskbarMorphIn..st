taskbar
taskbarMorphIn: aWorldMorph
	^ aWorldMorph submorphs detect: [ :morph | morph isKindOf: TaskbarMorph ]