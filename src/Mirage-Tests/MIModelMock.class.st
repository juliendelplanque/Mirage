Class {
	#name : #MIModelMock,
	#superclass : #MIModel,
	#category : #'Mirage-Tests'
}

{ #category : #initialization }
MIModelMock >> initializeBackground [
	"Do not set the background morph in mock."
]

{ #category : #keymap }
MIModelMock >> openPreviewerKeymap [
	^ KMKeymap named: 'Mock keymap' shortcut: KMModifier control + Character tab asKeyCombination action: [ "Do nothing on purpose" ]
]
