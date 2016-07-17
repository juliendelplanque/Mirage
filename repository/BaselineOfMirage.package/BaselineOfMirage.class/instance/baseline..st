baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'Mirage';
				package: 'Mirage-Tests' with: [ spec requires: 'Mirage' ];
				package: 'Mirage-Carousel' with: [ spec requires: 'Mirage' ];
				package: 'Mirage-Highlighter' with: [ spec requires: 'Mirage' ] ]