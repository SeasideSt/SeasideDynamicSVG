Class {
	#name : #SVGMergeNodeTag,
	#superclass : #SVGFilterSubElement,
	#category : #'SeasideDynamicSVG-Core-Filter'
}

{ #category : #accessing }
SVGMergeNodeTag >> input: aString [
	self attributes at: 'in' put: aString
]

{ #category : #private }
SVGMergeNodeTag >> tag [
	^'feMergeNode'
]
