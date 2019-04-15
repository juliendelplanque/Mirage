"
I have methods to create the shortcuts of a ""previewer"" ie an object that has the duty to display windows preview to the use for him to choose which one he want to activate.

Any user of this trait must implements #on:do: for shortcuts creations (see  #createShortcutsOn:).
"
Trait {
	#name : #MIPreviewerShortcuts,
	#category : 'Mirage-Traits'
}

{ #category : #shortcuts }
MIPreviewerShortcuts >> closeWindowShortcut [
	^ KMModifier meta + $w asKeyCombination
]

{ #category : #'shortcuts creation' }
MIPreviewerShortcuts >> createShortcutsOn: aWPModel [
	self
		on: self nextShortcut do: [ aWPModel next ];
		on: self previousShortcut do: [ aWPModel previous ];
		on: self closeWindowShortcut do: [ aWPModel closeCurrentWindow ]
]

{ #category : #shortcuts }
MIPreviewerShortcuts >> nextShortcut [
	^ (KMModifier shift + KMUntypeableSingleKeyCombination tab)
		| (KMModifier shift + KMUntypeableSingleKeyCombination arrowRight)
]

{ #category : #shortcuts }
MIPreviewerShortcuts >> previousShortcut [
	^ KMModifier shift + KMUntypeableSingleKeyCombination arrowLeft
]
