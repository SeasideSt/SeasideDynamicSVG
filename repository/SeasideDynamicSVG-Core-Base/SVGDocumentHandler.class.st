Class {
	#name : #SVGDocumentHandler,
	#superclass : #WADocumentHandler,
	#instVars : [
		'isActive'
	],
	#category : #'SeasideDynamicSVG-Core-Base'
}

{ #category : #accessing }
SVGDocumentHandler >> expire [
	isActive  := false
]

{ #category : #accessing }
SVGDocumentHandler >> isActive [

     isActive isNil ifTrue: [ isActive := true ].
	^ isActive 
]
