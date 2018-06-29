Class {
	#name : #ConfigurationOfMirage,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfMirage'
}

{ #category : #'development support' }
ConfigurationOfMirage class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>
]

{ #category : #private }
ConfigurationOfMirage class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #'ConfigurationOf'
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #'ConfigurationOf' ifAbsent: aBlock ].
]

{ #category : #catalog }
ConfigurationOfMirage class >> catalogContactInfo [
	^ 'julien.delplanque@live.be'
]

{ #category : #catalog }
ConfigurationOfMirage class >> catalogDescription [
	^ 'A windows switcher with a previewer for Pharo!

Enable/disable it by toggling the checkbox in Tools>Mirage>Activate in the Settings Browser.

Check the github repository for documentation [https://github.com/juliendelplanque/Mirage].'
]

{ #category : #catalog }
ConfigurationOfMirage class >> catalogKeywords [
	^ #('mirage' 'windows management' 'windows previewer' 'windows switcher' 'morphic' 'gui' 'ergonomy')
]

{ #category : #private }
ConfigurationOfMirage class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfMirage class >> ensureMetacelloBaseConfiguration [
  Smalltalk
    at: #'ConfigurationOf'
    ifAbsent: [ 
      | repository version |
      repository := MCHttpRepository
        location: 'http://smalltalkhub.com/mc/dkh/metacello/main'
        user: ''
        password: ''.
      repository
        versionReaderForFileNamed: 'Metacello-Base-dkh.107'
        do: [ :reader | 
          version := reader version.
          version load.
          version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfMirage class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfMirage class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfMirage class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfMirage class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfMirage class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfMirage >> baselineDev: spec [
	<version: 'dev-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec baseline: 'Mirage' with: [
			spec repository: 'github://juliendelplanque/Mirage:dev/repository' ] ].

]

{ #category : #baselines }
ConfigurationOfMirage >> baselineMaster: spec [
	<version: 'master-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec baseline: 'Mirage' with: [
			spec repository: 'github://juliendelplanque/Mirage/repository' ] ].

]

{ #category : #accessing }
ConfigurationOfMirage >> customProjectAttributes [
    "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes "

    ^ #()
]

{ #category : #'symbolic versions' }
ConfigurationOfMirage >> dev: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: 'dev-baseline'.

]

{ #category : #accessing }
ConfigurationOfMirage >> project [
    ^ project
        ifNil: [ 
            "Bootstrap Metacello if it is not already loaded"
            self class ensureMetacello.
            project := MetacelloMCProject new projectAttributes: self customProjectAttributes.	"Create the Metacello project"
            (Smalltalk at: #'MetacelloVersionConstructor') on: self project: project.	"Construct the project"
            project loadType: #'linear'.	"change to #atomic if desired"
            project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfMirage >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: 'master-baseline'.

]
