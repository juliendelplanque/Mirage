"
I am the trait that should be used to be able to activate a view from the Settings browser.

- #activate: Must be overrided to activate the view according to a Boolean given as parameter.
- #isActivated Must be overrided to return true if the view is activated, else false.
"
Trait {
	#name : #MIViewSetting,
	#category : 'Mirage-Traits'
}

{ #category : #accessing }
MIViewSetting classSide >> activate: aBoolean [
	"Override this method such that if true is given as parameter, the view is
	 activated else, it is not."
	self explicitRequirement
]

{ #category : #'setting building' }
MIViewSetting classSide >> buildSettingNamed: aSymbol with: aBuilder [
	^ (aBuilder setting: aSymbol)
			setSelector: #activate:;
			getSelector: #isActivated;
			target: self;
			parent: self parent;
			yourself
]

{ #category : #accessing }
MIViewSetting classSide >> isActivated [
	"Override this method such that it returns true if the view is activated, else false."
	^ self explicitRequirement
]

{ #category : #accessing }
MIViewSetting classSide >> parent [
	^ #mirageViewsSettings
]

{ #category : #settings }
MIViewSetting classSide >> wpSettingOn: aBuilder [
	"Override this method to make the view appears in the Setting browser.
	You will probably call #buildSettingNamed:with: when override it.
	Do not forget to use <systemsettings> pragma."
	self explicitRequirement
]
