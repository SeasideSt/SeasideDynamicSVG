Class {
	#name : #SVGLineExample,
	#superclass : #SVGExample,
	#instVars : [
		'lineExample'
	],
	#category : #'SeasideDynamicSVG-Examples'
}

{ #category : #'instance creation' }
SVGLineExample class >> path [
	
	^'SVG/lines'
]

{ #category : #accessing }
SVGLineExample >> children [
	
	^Array with: lineExample
]

{ #category : #'initialize-release' }
SVGLineExample >> initialize [
	
	super initialize.
	lineExample := SVGLineTest new
]

{ #category : #rendering }
SVGLineExample >> renderContentOn: html [ 

	html
		div: [html heading: 'SVG line example'].
	html render: lineExample.
	
	"IE annoying click and activate workaround"
	"it must be an external js file, just put the file on your apache root!"
	html html: '<script type="text/javascript" src="/iefix.js"></script>'
]