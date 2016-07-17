baselines
baselineMaster: spec
	<version: 'master-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec baseline: 'Mirage' with: [
			spec repository: 'github://juliendelplanque/Mirage/repository' ] ].
