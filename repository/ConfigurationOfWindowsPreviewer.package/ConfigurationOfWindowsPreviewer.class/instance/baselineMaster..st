baselines
baselineMaster: spec
	<version: 'master-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec baseline: 'WindowsPreviewer' with: [
			spec repository: 'github://juliendelplanque/WindowsPreviewer/repository' ] ].
