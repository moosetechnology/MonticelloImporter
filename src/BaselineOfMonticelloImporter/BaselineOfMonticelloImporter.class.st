Class {
	#name : #BaselineOfMonticelloImporter,
	#superclass : #BaselineOf,
	#category : #BaselineOfMonticelloImporter
}

{ #category : #baselines }
BaselineOfMonticelloImporter >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #accessing }
BaselineOfMonticelloImporter >> customProjectAttributes [
	RPackageOrganizer default packages detect: [ :package | package name = 'BaselineOfMoose' ] ifNone: [ ^#(#WithoutMoose) ].
	
	^ #()
]

{ #category : #baselines }
BaselineOfMonticelloImporter >> defineDependencies: spec [
]

{ #category : #baselines }
BaselineOfMonticelloImporter >> defineGroups: spec [
]

{ #category : #baselines }
BaselineOfMonticelloImporter >> definePackages: spec [
	spec
		package: 'Moose-MonticelloImporter';
		package: 'Moose-Tests-MonticelloImporter' with: [ spec requires: 'Moose-MonticelloImporter' ].

	spec
		for: #(#WithoutMoose)
		do: [ spec baseline: 'Moose' with: [ spec repository: 'github://moosetechnology/Moose:development/src' ].
			spec package: 'Moose-MonticelloImporter' with: [ spec requires: #('Moose') ] ]
]
