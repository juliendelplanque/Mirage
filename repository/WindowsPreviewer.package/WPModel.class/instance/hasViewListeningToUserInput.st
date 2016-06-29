testing
hasViewListeningToUserInput
	^ WPModel views anySatisfy: [ :class | class traits includes: WPPreviewerShortcuts ]