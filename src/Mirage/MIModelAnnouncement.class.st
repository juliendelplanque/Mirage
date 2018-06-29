"
I am a generic announcement coming from a WPModel.
"
Class {
	#name : #MIModelAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'model'
	],
	#category : 'Mirage-Announcements'
}

{ #category : #accessing }
MIModelAnnouncement >> background [
	^ self model background
]

{ #category : #accessing }
MIModelAnnouncement >> model [
	^ model
]

{ #category : #accessing }
MIModelAnnouncement >> model: anObject [
	model := anObject
]

{ #category : #accessing }
MIModelAnnouncement >> nextWindow [
	^ self model nextWindow
]

{ #category : #accessing }
MIModelAnnouncement >> previousWindow [
	^ self model previousWindow
]

{ #category : #accessing }
MIModelAnnouncement >> window [
	^ self model currentWindow
]

{ #category : #accessing }
MIModelAnnouncement >> windows [
	^ self model windowsManaged
]
