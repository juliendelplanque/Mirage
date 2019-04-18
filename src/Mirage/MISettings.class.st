"
The settings for the Windows Previewer.
"
Class {
	#name : #MISettings,
	#superclass : #Object,
	#category : 'Mirage-Settings'
}

{ #category : #accessing }
MISettings class >> windowsOrderingChoices [
	^ ((Pragma allNamed: #mirageWindowsManagementNamed: in: MIModel)
		collect: [ :pragma |
			pragma arguments first -> pragma methodSelector ])
]

{ #category : #'settings-definition' }
MISettings class >> wpActivateSettingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #mirage)
		label: 'Activate';
		description: 'Activate the window previewer' translated;
		setSelector: #install:;
		getSelector: #isInstalled;
		target: MIModel;
		parent: #mirageSettings.
]

{ #category : #'settings-definition' }
MISettings class >> wpOpenShortcutSettingsOn: aBuilder [
	<systemsettings>
	MIModel isInstalled
		ifFalse: [ ^ self ].
	(aBuilder shortcut: #mirageOpenShortcutSetting)
		label: 'Open shortcut';
		description: 'Set the shortcut to open the windows previewer' translated;
		category: MIModel globalKMCategoryName;
		shortcutName: #'Open windows previews';
		parent: #mirageSettings
]

{ #category : #'settings-definition' }
MISettings class >> wpSettingsOn: aBuilder [
	<systemsettings>
	
	(aBuilder group: #mirageSettings)
		label: 'Mirage' translated;
		parent: #tools.
]

{ #category : #'settings-definition' }
MISettings class >> wpViewsSettingsOn: aBuilder [
	<systemsettings>
	
	(aBuilder group: #mirageViewsSettings)
		label: 'Views to use' translated;
		parent: #mirageSettings
	
]

{ #category : #'settings-definition' }
MISettings class >> wpWindowsManagementSettingOn: aBuilder [
	<systemsettings>
	(aBuilder pickOne: #windowsOrder)
		label: 'Windows management';
		description: 'Set the windows management needed' translated;
		target: MIModel;
		domainValues: self windowsOrderingChoices;
		setSelector: #windowsOrderingMethod:;
		getSelector: #windowsOrderingMethod;
		parent: #mirageSettings
]
