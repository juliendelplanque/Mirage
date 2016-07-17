tests-actions
testOpen
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