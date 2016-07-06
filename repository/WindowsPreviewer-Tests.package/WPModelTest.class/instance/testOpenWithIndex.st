tests-actions
testOpenWithIndex
	| blockExecuted1 blockExecuted2 |
	blockExecuted1 := blockExecuted2 := false.	
	model announcer when: WPOpenRequest do: [ blockExecuted1 := true ].
	model announcer when: WPWindowSelected do: [ blockExecuted2 := true ].
	model openWithIndex: 42.
	self
		assert: blockExecuted1;
		assert: blockExecuted2;
		assert: model currentIndex equals: 42.
	"Delete the background from world."
	model background delete