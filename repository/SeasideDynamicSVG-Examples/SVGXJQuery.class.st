Class {
	#name : #SVGXJQuery,
	#superclass : #SVGXExample,
	#instVars : [
		'color'
	],
	#category : #'SeasideDynamicSVG-Examples'
}

{ #category : #drawing }
SVGXJQuery >> drawCircleOn: svg [ 
	
	svg circle
		id: #anchoredCircle;
		center: 400@250;
		radius: 17.64;
		fill: self toggleColor.
		
]

{ #category : #drawing }
SVGXJQuery >> drawSVGContentOn: svg [ 

	"Draw the explanatory text"
	self drawTextOn: svg.
	"Draw the ColorChanging Circle (#anchoredCircle)"
	self drawCircleOn: svg.
	"create the clickable circle. As we want to change attributes in the SVG Container we use svg jQuerySVG. This gives us a SVGCanvas to create SVG tags as answer. If we would like to change sthg. in HTML-context we have to use svg jQuery"
	svg circle
		onClick: (svg jQuerySVG ajax
			script: [ :s | s << (s jQuery id: #anchoredCircle) attributeAt: 'fill' put: self toggleColor]);
		center: 300@150;
		radius: 17.64;
		fill: Color red.
]

{ #category : #drawing }
SVGXJQuery >> drawTextOn: svg [ 

	svg textShape
		fontFamily: self fontFamily; 
		fontSize: 24;
		fill: Color red; 
		stroke: Color blue;
		position: 10@70;
		with: [ 
			svg text: 'Press red Button to change the color'.
		].

]

{ #category : #'as yet unclassified' }
SVGXJQuery >> renderContentOn: html [	
	
	html script
		url: (JQDeploymentLibrary urlOf: #jQueryJs).
	html script
		url: (JQDeploymentLibrary urlOf: #jquerysvgminJs).
	super renderContentOn: html.
]

{ #category : #accessing }
SVGXJQuery >> toggleColor [
	
	^ color = Color blue
		ifTrue: [ color := Color green ]
		ifFalse: [ color := Color blue ].
]
