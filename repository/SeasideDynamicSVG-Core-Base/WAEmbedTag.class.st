Class {
	#name : #WAEmbedTag,
	#superclass : #WATagBrush,
	#category : #'SeasideDynamicSVG-Core-Base'
}

{ #category : #'*SeasideDynamicSVG-Core-Base' }
WAEmbedTag >> embedSVGComponent: aComponent width: svgWidth height: svgHeight [

	canvas svgEmbedComponent: aComponent brush: self width: svgWidth height: svgHeight.

]

{ #category : #attributes }
WAEmbedTag >> height: anInteger [
	self attributeAt: 'height' put: anInteger
]

{ #category : #accessing }
WAEmbedTag >> tag [
	^ 'embed'
]

{ #category : #attributes }
WAEmbedTag >> type: aString [
	self attributeAt: 'type' put: aString
]

{ #category : #attributes }
WAEmbedTag >> url: aUrl [
	self attributeAt: 'src' put: aUrl
]

{ #category : #attributes }
WAEmbedTag >> width: anInteger [
	self attributeAt: 'width' put: anInteger
]
