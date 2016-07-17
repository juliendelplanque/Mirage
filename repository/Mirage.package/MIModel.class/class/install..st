installation
install: aBoolean
	aBoolean
		ifTrue: [ self install ]
		ifFalse: [ self uninstall ]