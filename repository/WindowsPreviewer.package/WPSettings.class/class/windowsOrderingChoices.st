accessing
windowsOrderingChoices
	^ ((Pragma allNamed: #wpWindowsManagementNamed: in: WPModel)
		collect: [ :pragma |
			pragma arguments first -> pragma selector ])