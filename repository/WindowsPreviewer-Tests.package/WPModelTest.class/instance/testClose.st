tests-actions
testClose
	| blockExecuted |
	blockExecuted := false.
	model announcer when: WPCloseRequest do: [ blockExecuted := true ].
	model close.
	self assert: blockExecuted