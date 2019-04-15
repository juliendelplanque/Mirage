"
I define the model of a Windows Previewer.

I hold the  SystemWindowsz, allow to switch to next or previous thumbnail and to apply actions on the window.
"
Class {
	#name : #MIModel,
	#superclass : #Object,
	#traits : 'MIWindowManipulator',
	#classTraits : 'MIWindowManipulator classTrait',
	#instVars : [
		'announcer',
		'windowsManaged',
		'currentIndex',
		'background'
	],
	#classInstVars : [
		'windowsOrderingMethod'
	],
	#category : 'Mirage-Model'
}

{ #category : #keymap }
MIModel class >> createGlobalKMCategory [
	KMRepository default
		setAsGlobalCategory: self globalKMCategoryName
]

{ #category : #keymap }
MIModel class >> createOpenShortcut [
	self globalKMCategory
		addKeymapEntry: (KMKeymap
								named: #'Open windows previews'
								shortcut: Smalltalk os mirageOpenPreviewerShortcut
								action: [ self open ]).
]

{ #category : #keymap }
MIModel class >> globalKMCategory [
	^ KMRepository default globalCategories
			detect: [ :cat | cat name = self globalKMCategoryName ]
			ifNone: [ 
				self createGlobalKMCategory.
				^ self globalKMCategory ]
]

{ #category : #keymap }
MIModel class >> globalKMCategoryName [
	^ #WindowsPreviewGlobal
]

{ #category : #installation }
MIModel class >> install [
	self
		createGlobalKMCategory;
		createOpenShortcut;
		updateSettingBrowsers
]

{ #category : #installation }
MIModel class >> install: aBoolean [
	aBoolean
		ifTrue: [ self install ]
		ifFalse: [ self uninstall ]
]

{ #category : #installation }
MIModel class >> isInstalled [
	^ self globalKMCategory
		hasKeymapNamed: #'Open windows previews'
]

{ #category : #opening }
MIModel class >> open [
	| instance |
	instance := self new.
	(self views collect: #new)
		do: [ :view | view listenToWPModelAnnouncementsOf: instance ].
	self windowsOrderingMethod value: instance.
	^ instance
		open;
		yourself
]

{ #category : #opening }
MIModel class >> openWithIndex: anInteger [
	| instance |
	instance := self new.
	(self views collect: #new)
		do: [ :view | view listenToWPModelAnnouncementsOf: instance ].
	self windowsOrderingMethod value: instance.
	^ instance
		openWithIndex: anInteger;
		yourself
]

{ #category : #keymap }
MIModel class >> removeShortcuts [
	self globalKMCategory keymaps
		do: [ :keymap | 
			self globalKMCategory
				removeKeymapEntry: keymap]
]

{ #category : #installation }
MIModel class >> uninstall [
	self
		removeShortcuts;
		updateSettingBrowsers
]

{ #category : #'setting browser' }
MIModel class >> updateSettingBrowsers [
	self flag: #hack.
	SettingBrowser allSubInstances do: #applyFilters
]

{ #category : #accessing }
MIModel class >> views [
	^ MIViewSetting users select: #isActivated
]

{ #category : #accessing }
MIModel class >> windowsOrderingMethod [
	^ windowsOrderingMethod
		ifNil: [ windowsOrderingMethod := MISettings windowsOrderingChoices sorted first value ]
]

{ #category : #accessing }
MIModel class >> windowsOrderingMethod: aSelector [
	windowsOrderingMethod := aSelector
]

{ #category : #announcing }
MIModel >> announce: anAnnouncement [
	self announcer announce: anAnnouncement
]

{ #category : #announcing }
MIModel >> announceCloseRequest [
	self announce: (MICloseRequest new
							model: self;
							yourself)
]

{ #category : #announcing }
MIModel >> announceOpenRequest [
	self announce: (MIOpenRequest new
							model: self;
							yourself)
]

{ #category : #announcing }
MIModel >> announceWindowSelected [
	self announce: (MIWindowSelected new
							model: self;
							yourself)
]

{ #category : #accessing }
MIModel >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
MIModel >> background [
	^ background
]

{ #category : #accessing }
MIModel >> background: anObject [
	background := anObject
]

{ #category : #actions }
MIModel >> close [
	self announceCloseRequest
]

{ #category : #actions }
MIModel >> closeCurrentWindow [
	self currentWindow mirageClose.
	self close.
	(self windowsManaged size - 1) > 0
		ifTrue: [ self class
						openWithIndex: (currentIndex = 1
												ifTrue: [ 1 ]
												ifFalse: [ currentIndex - 1 ]) ]
]

{ #category : #accessing }
MIModel >> currentIndex [
	^ currentIndex
]

{ #category : #accessing }
MIModel >> currentWindow [
	^ self windowsManaged at: (currentIndex min: self windowsManaged size)
]

{ #category : #initialization }
MIModel >> initialize [
	super initialize.
	currentIndex := 2.
	self initializeBackground
]

{ #category : #initialization }
MIModel >> initializeBackground [
	self background: MIBackgroundMorph new.
	self background
		listenToWPModelAnnouncementsOf: self.
]

{ #category : #testing }
MIModel >> manageAtLeastOneWindow [
	^ self windowsManaged size > 0
]

{ #category : #actions }
MIModel >> next [
	currentIndex := self nextIndex.
	self announceWindowSelected
]

{ #category : #'index computing' }
MIModel >> nextIndex [
	"Computes the value of the next index and returns it. Does not change #currentIndex inst. var."
	^ currentIndex = self windowsManaged size
		ifTrue: [ 1 ]
		ifFalse: [ currentIndex + 1 ].
]

{ #category : #accessing }
MIModel >> nextWindow [
	^ self windowsManaged at: self nextIndex
]

{ #category : #actions }
MIModel >> open [
	self manageAtLeastOneWindow
		ifTrue: [
			self announceOpenRequest.
			self announceWindowSelected ]
]

{ #category : #actions }
MIModel >> openCurrentWindow [
	self currentWindow mirageOpen.
	self announceCloseRequest
]

{ #category : #actions }
MIModel >> openWithIndex: anInteger [
	currentIndex := anInteger.
	self open
]

{ #category : #actions }
MIModel >> previous [
	currentIndex := self previousIndex.
	self announceWindowSelected
]

{ #category : #'index computing' }
MIModel >> previousIndex [
	"Computes the value of the previous index and returns it. Does not change #currentIndex inst. var."
	^ currentIndex = 1
		ifTrue: [ self windowsManaged size ]
		ifFalse: [ currentIndex - 1 ].
]

{ #category : #accessing }
MIModel >> previousWindow [
	^ self windowsManaged at: self previousIndex
]

{ #category : #shortcuts }
MIModel >> shortcutOn: aKeyCombination do: aBlock [
	^ background on: aKeyCombination do: aBlock
]

{ #category : #settings }
MIModel >> useWindowsOrderedByTaskbar [
	<mirageWindowsManagementNamed: 'Taskbar order'>
	self windowsManaged: self windowsOrderedByTaskbar
]

{ #category : #settings }
MIModel >> useWindowsOrderedByWorld [
	<mirageWindowsManagementNamed: 'World order'>
	self windowsManaged: self windowsOrderedByWorld
]

{ #category : #accessing }
MIModel >> windowsManaged [
	^ windowsManaged
]

{ #category : #accessing }
MIModel >> windowsManaged: anObject [
	windowsManaged := anObject
]
