"
I highlight windows selected during the preview.
"
Class {
	#name : #MIWindowsHighlighter,
	#superclass : #Object,
	#traits : 'MIModelListener + MIViewSetting',
	#classTraits : 'MIModelListener classTrait + MIViewSetting classTrait',
	#instVars : [
		'windowHighlighter'
	],
	#classInstVars : [
		'isActivated'
	],
	#category : 'Mirage-Highlighter-Core'
}

{ #category : #accessing }
MIWindowsHighlighter class >> activate: aBoolean [
	isActivated := aBoolean
]

{ #category : #'setting building' }
MIWindowsHighlighter class >> buildSettingNamed: aSymbol with: aBuilder [
	^ (aBuilder setting: aSymbol)
			setSelector: #activate:;
			getSelector: #isActivated;
			target: self;
			parent: self parent;
			yourself
]

{ #category : #'class initialization' }
MIWindowsHighlighter class >> initialize [
	super initialize.
	self activate: false
]

{ #category : #accessing }
MIWindowsHighlighter class >> isActivated [
	^ isActivated
]

{ #category : #accessing }
MIWindowsHighlighter class >> parent [
	^ #mirageViewsSettings
]

{ #category : #settings }
MIWindowsHighlighter class >> wpSettingOn: aBuilder [
	<systemsettings>
	(self buildSettingNamed: #wpWindowsHighlighterSetting with: aBuilder)
		label: 'Windows highlighter';
		description: 'Activate the windows highlighter' translated
]

{ #category : #'announcement handling' }
MIWindowsHighlighter >> handleCloseRequest: aWPCloseRequest [
	aWPCloseRequest model announcer unsubscribe: self
]

{ #category : #'announcement handling' }
MIWindowsHighlighter >> handleOpenRequest: aWPOpenRequest [
	aWPOpenRequest background submorphs
		detect: #isWindowsPreviewer
		ifFound: [ :windowsPreviewer | aWPOpenRequest background addMorph: windowHighlighter after: windowsPreviewer ]
		ifNone: [ aWPOpenRequest background addMorph: windowHighlighter ]
]

{ #category : #'announcement handling' }
MIWindowsHighlighter >> handleWindowSelected: aWPThumbnailSelected [
	aWPThumbnailSelected window isCollapsed
		ifFalse: [ 
			windowHighlighter
				highlightWindow: aWPThumbnailSelected window ]
]

{ #category : #initialization }
MIWindowsHighlighter >> initialize [
	super initialize.
	windowHighlighter := MIWindowHighlighterMorph new
									mirageLevel: 200;
									yourself
]
