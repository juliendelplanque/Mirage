tests-actions
testPrevious
	| blockExecuted |
	blockExecuted := false.
	model announcer
		when: WPThumbnailSelected do: [ blockExecuted := true ].
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