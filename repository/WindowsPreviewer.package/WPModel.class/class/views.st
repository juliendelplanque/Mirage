accessing
views
	^ ((PragmaCollector new filter: [:prg | prg keyword = 'wpView'])
			reset;
			select: [ :prg | prg selector value: prg methodClass baseClass ])
			collect: [ :prg | prg methodClass baseClass ]