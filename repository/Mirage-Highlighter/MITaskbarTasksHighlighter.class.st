"
I highlight taskbar tasks selected during the preview.
"
Class {
	#name : #MITaskbarTasksHighlighter,
	#superclass : #Object,
	#traits : 'MIModelListener + MIViewSetting',
	#classTraits : 'MIModelListener classTrait + MIViewSetting classTrait',
	#instVars : [
		'buttonHighlighter'
	],
	#classInstVars : [
		'isActivated'
	],
	#category : 'Mirage-Highlighter-Core'
}

{ #category : #accessing }
MITaskbarTasksHighlighter class >> activate: aBoolean [
	isActivated := aBoolean
]

{ #category : #'setting building' }
MITaskbarTasksHighlighter class >> buildSettingNamed: aSymbol with: aBuilder [
	^ (aBuilder setting: aSymbol)
			setSelector: #activate:;
			getSelector: #isActivated;
			target: self;
			parent: self parent;
			yourself
]

{ #category : #'class initialization' }
MITaskbarTasksHighlighter class >> initialize [
	super initialize.
	self activate: false
]

{ #category : #accessing }
MITaskbarTasksHighlighter class >> isActivated [
	^ isActivated
]

{ #category : #accessing }
MITaskbarTasksHighlighter class >> parent [
	^ #mirageViewsSettings
]

{ #category : #settings }
MITaskbarTasksHighlighter class >> wpSettingOn: aBuilder [
	<systemsettings>
	(self buildSettingNamed: #wpTaskbarTasksHighlighterSetting with: aBuilder)
		label: 'Taskbar tasks highlighter';
		description: 'Activate the taskbar tasks highlighter' translated
]

{ #category : #'announcement handling' }
MITaskbarTasksHighlighter >> handleCloseRequest: aWPCloseRequest [
	aWPCloseRequest model announcer unsubscribe: self
]

{ #category : #'announcement handling' }
MITaskbarTasksHighlighter >> handleOpenRequest: aWPOpenRequest [
	aWPOpenRequest background addMorph: buttonHighlighter
]

{ #category : #'announcement handling' }
MITaskbarTasksHighlighter >> handleWindowSelected: aWPThumbnailSelected [
	buttonHighlighter
		highlightButton: (aWPThumbnailSelected window worldTaskbar buttonForMorph: aWPThumbnailSelected window)
]

{ #category : #initialization }
MITaskbarTasksHighlighter >> initialize [
	super initialize.
	buttonHighlighter := MIButtonHighlighterMorph new
									mirageLevel: 200;
									yourself
]
