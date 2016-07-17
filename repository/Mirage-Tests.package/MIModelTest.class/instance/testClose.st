tests-actions
testClose
	| blockExecuted |
	blockExecuted := false.
	model announcer when: MICloseRequest do: [ blockExecuted := true ].
	model close.
	self assert: blockExecuted