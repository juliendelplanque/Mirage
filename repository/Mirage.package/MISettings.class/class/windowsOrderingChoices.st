accessing
windowsOrderingChoices
	^ ((Pragma allNamed: #mirageWindowsManagementNamed: in: MIModel)
		collect: [ :pragma |
			pragma arguments first -> pragma selector ])