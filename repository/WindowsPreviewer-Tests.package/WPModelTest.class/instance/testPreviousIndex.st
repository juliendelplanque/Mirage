tests-accessing
testPreviousIndex
	self
		assert: model currentIndex equals: 1;
		assert: model previousIndex equals: 3