"
I define the behavior of an object that listen to a WPModel.

The following methods **must** be overrided by the classes using me:
- #handleCloseRequest: For actions to be done when the user quit the windows previewer.
- #handleOpenRequest: For actions to be done when the user open the window previewer.
- #handleWindowSelected: For actions to be done when the user selected another window.
"
Trait {
	#name : #MIModelListener,
	#category : 'Mirage-Traits'
}

{ #category : #'announcement handling' }
MIModelListener >> handleCloseRequest: aMICloseRequest [
	"Override this method to define the actions to do when the previewer is closed."
	^ self explicitRequirement
]

{ #category : #'announcement handling' }
MIModelListener >> handleOpenRequest: aMIOpenRequest [
	"Override this method to define the actions to do when the previewer is opened."
	^ self explicitRequirement
]

{ #category : #'announcement handling' }
MIModelListener >> handleWindowSelected: aMIThumbnailSelected [
	"Override this method to define the actions to do when the previewer's current window change."
	^ self explicitRequirement
]

{ #category : #listening }
MIModelListener >> listenToWPModelAnnouncementsOf: aMIModel [
	aMIModel announcer
		when: MIWindowSelected send: #handleWindowSelected: to: self;
		when: MICloseRequest send: #handleCloseRequest: to: self;
		when: MIOpenRequest send: #handleOpenRequest: to: self
]
