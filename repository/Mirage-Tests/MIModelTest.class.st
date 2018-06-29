Class {
	#name : #MIModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : 'Mirage-Tests'
}

{ #category : #running }
MIModelTest >> setUp [
	model := MIModel new.
	model windowsManaged: { SystemWindow new . SystemWindow new . SystemWindow new }
]

{ #category : #'tests-actions' }
MIModelTest >> testClose [
	| blockExecuted |
	blockExecuted := false.
	model announcer when: MICloseRequest do: [ blockExecuted := true ].
	model close.
	self assert: blockExecuted
]

{ #category : #'tests-actions' }
MIModelTest >> testNext [
	| blockExecuted |
	blockExecuted := false.
	model announcer
		when: MIWindowSelected do: [ blockExecuted := true ].
	self
		assert: model windowsManaged size equals: 3;
		assert: model currentIndex equals: 1.
	model next.
	self
		assert: blockExecuted;
		assert: model currentIndex equals: 2.
	blockExecuted := false.
	model next.
	self
		assert: blockExecuted;
		assert: model currentIndex equals: 3.
	blockExecuted := false.
	model next.
	self
		assert: blockExecuted;
		assert: model currentIndex equals: 1.
]

{ #category : #'tests-accessing' }
MIModelTest >> testNextIndex [
	self
		assert: model currentIndex equals: 1;
		assert: model nextIndex equals: 2
]

{ #category : #'tests-accessing' }
MIModelTest >> testNextWindow [
	self
		assert: model currentWindow equals: (model windowsManaged at: 1);
		assert: model nextWindow equals: (model windowsManaged at: 2)
]

{ #category : #'tests-actions' }
MIModelTest >> testOpen [
	| blockExecuted1 blockExecuted2 |
	blockExecuted1 := blockExecuted2 := false.	
	model announcer when: MIOpenRequest do: [ blockExecuted1 := true ].
	model announcer when: MIWindowSelected do: [ blockExecuted2 := true ].
	model open.
	self
		assert: blockExecuted1;
		assert: blockExecuted2.
	"Delete the background from world."
	model background delete
]

{ #category : #'tests-actions' }
MIModelTest >> testOpenWithIndex [
	| blockExecuted1 blockExecuted2 |
	blockExecuted1 := blockExecuted2 := false.	
	model announcer when: MIOpenRequest do: [ blockExecuted1 := true ].
	model announcer when: MIWindowSelected do: [ blockExecuted2 := true ].
	model openWithIndex: 42.
	self
		assert: blockExecuted1;
		assert: blockExecuted2;
		assert: model currentIndex equals: 42.
	"Delete the background from world."
	model background delete
]

{ #category : #'tests-actions' }
MIModelTest >> testPrevious [
	| blockExecuted |
	blockExecuted := false.
	model announcer
		when: MIWindowSelected do: [ blockExecuted := true ].
	self
		assert: model windowsManaged size equals: 3;
		assert: model currentIndex equals: 1.
	model previous.
	self
		assert: blockExecuted;
		assert: model currentIndex equals: 3.
	blockExecuted := false.
	model previous.
	self
		assert: blockExecuted;
		assert: model currentIndex equals: 2.
	blockExecuted := false.
	model previous.
	self
		assert: blockExecuted;
		assert: model currentIndex equals: 1.
]

{ #category : #'tests-accessing' }
MIModelTest >> testPreviousIndex [
	self
		assert: model currentIndex equals: 1;
		assert: model previousIndex equals: 3
]

{ #category : #'tests-accessing' }
MIModelTest >> testPreviousWindow [
	self
		assert: model currentWindow equals: (model windowsManaged at: 1);
		assert: model previousWindow equals: (model windowsManaged at: 3)
]
