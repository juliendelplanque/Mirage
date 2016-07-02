baselines
baselineDev: spec
	<version: 'dev-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec baseline: 'WindowsPreviewer' with: [
			spec repository: 'github://juliendelplanque/WindowsPreviewer:dev/repository' ] ].
