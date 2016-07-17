tests-accessing
testNextWindow
	self
		assert: model currentWindow equals: (model windowsManaged at: 1);
		assert: model nextWindow equals: (model windowsManaged at: 2)