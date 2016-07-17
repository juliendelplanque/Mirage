accessing
windowsOrderingChoices
	^ ((Pragma allNamed: #wpWindowsManagementNamed: in: MIModel)
		collect: [ :pragma |
			pragma arguments first -> pragma selector ])