Extension { #name : #SystemWindow }

{ #category : #'*Mirage' }
SystemWindow >> mirageClose [
	^ self close
]

{ #category : #'*Mirage' }
SystemWindow >> mirageOpen [
	self isMinimized
		ifTrue: [ self restore ]
		ifFalse: [
			self isActive
				ifFalse: [self activate] ]
]
