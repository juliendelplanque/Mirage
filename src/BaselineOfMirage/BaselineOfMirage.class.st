Class {
	#name : #BaselineOfMirage,
	#superclass : #BaselineOf,
	#category : #BaselineOfMirage
}

{ #category : #baseline }
BaselineOfMirage >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'Mirage';
				package: 'Mirage-Tests' with: [ spec requires: 'Mirage' ];
				package: 'Mirage-Carousel' with: [ spec requires: 'Mirage' ];
				package: 'Mirage-Highlighter' with: [ spec requires: 'Mirage' ].
			spec
				for: #'pharo7.x' do: [ spec package: 'Mirage-Pharo7Compatibility' ]. ]
]
