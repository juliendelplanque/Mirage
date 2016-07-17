tests-actions
testNext
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