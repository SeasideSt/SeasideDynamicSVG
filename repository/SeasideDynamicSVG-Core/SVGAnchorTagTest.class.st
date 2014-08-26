"
A SVGAnchorTagTest is a test class for testing the behavior of SVGAnchorTag
"
Class {
	#name : #SVGAnchorTagTest,
	#superclass : #TestCase,
	#category : #'SeasideDynamicSVG-Core-Tests'
}

{ #category : #'as yet unclassified' }
SVGAnchorTagTest class >> DoIt [
	^ SVGCanvas builder render: [ :html | self assert: html anchor = '<a></a>' ] 
]

{ #category : #tests }
SVGAnchorTagTest >> testAnchorTag [
	
	| result |
	result := SVGCanvas builder render: [ :html | html anchor ].
	self assert: result = '<a xlink:href="javascript:void(0)"></a>'.

]

{ #category : #'tests-attributes-xlink' }
SVGAnchorTagTest >> testXlinkActuateOnRequest [

	| result |
	result := SVGCanvas builder render: [ :html |
		html anchor
		xlinkActuateOnRequest].
	self assert: result = '<a xlink:actuate="onRequest" xlink:href="javascript:void(0)"></a>'.

]

{ #category : #'tests-attributes-xlink' }
SVGAnchorTagTest >> testXlinkHref [

	| result |
	result := SVGCanvas builder render: [ :html |
		html anchor
		xlinkHref: 'http://localhost'].
	self assert: result = '<a xlink:href="http://localhost"></a>'.

]

{ #category : #'tests-attributes-xlink' }
SVGAnchorTagTest >> testXlinkShowNew [

	| result |
	result := SVGCanvas builder render: [ :html |
		html anchor
		xlinkShowNew].
	self assert: result = '<a xlink:show="new" xlink:href="javascript:void(0)"></a>'.

]

{ #category : #'tests-attributes-xlink' }
SVGAnchorTagTest >> testXlinkShowReplace [

	| result |
	result := SVGCanvas builder render: [ :html |
		html anchor
		xlinkShowReplace].
	self assert: result = '<a xlink:show="replace" xlink:href="javascript:void(0)"></a>'.

]

{ #category : #'tests-attributes-xlink' }
SVGAnchorTagTest >> testXlinkTitle [

	| result |
	result := SVGCanvas builder render: [ :html |
		html anchor
		xlinkTitle: 'testXlinkTitle'].
	self assert: result = '<a xlink:title="testXlinkTitle" xlink:href="javascript:void(0)"></a>'.

]

{ #category : #'tests-attributes-xlink' }
SVGAnchorTagTest >> testXlinkType [

	| result |
	result := SVGCanvas builder render: [ :html |
		html anchor
		xlinkType: 'testXlinkType'].
	self assert: result = '<a xlink:type="testXlinkType" xlink:href="javascript:void(0)"></a>'.

]
