"
A SVGDisabledAnchorBrushTest is a test class for testing the behavior of SVGDisabledAnchorBrush
"
Class {
	#name : #SVGDisabledAnchorBrushTest,
	#superclass : #TestCase,
	#category : #'SeasideDynamicSVG-Core-Tests'
}

{ #category : #'tests-callbacks' }
SVGDisabledAnchorBrushTest >> testCallback [

	| result |
	result := SVGCanvas builder render: [ :html |
		html anchor 
			disabled: true;
			callback: [self notNil ] ]
		withContext: (WARenderContext new 
			disableSVGAnchors: true).
	self assert: result = ''.

]
