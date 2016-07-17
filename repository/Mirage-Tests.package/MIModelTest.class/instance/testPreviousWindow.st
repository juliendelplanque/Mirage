tests-accessing
testPreviousWindow
	self
		assert: model currentWindow equals: (model windowsManaged at: 1);
		assert: model previousWindow equals: (model windowsManaged at: 3)