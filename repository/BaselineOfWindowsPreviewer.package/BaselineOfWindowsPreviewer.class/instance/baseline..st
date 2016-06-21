baseline
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'WindowsPreviewer';
				package: 'WindowsPreviewer-Tests' with: [ spec requires: 'WindowsPreviewer' ] ]