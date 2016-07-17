baselines
baselineDev: spec
	<version: 'dev-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec baseline: 'Mirage' with: [
			spec repository: 'github://juliendelplanque/Mirage:dev/repository' ] ].
