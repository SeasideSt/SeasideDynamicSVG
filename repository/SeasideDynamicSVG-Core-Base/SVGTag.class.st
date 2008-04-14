Class {
	#name : #SVGTag,
	#superclass : #WATagBrush,
	#instVars : [
		'attributeSets',
		'transformList'
	],
	#category : #'SeasideDynamicSVG-Core-Base'
}

{ #category : #'convenience-referencing' }
SVGTag >> assignNextId [
	" an ID is required to reference this tag "
	
	self id isNil ifTrue: [ self id: canvas nextId ]
]

{ #category : #'accessing-attributes' }
SVGTag >> attributeAt: aKey ifAbsentPut: aBlock [ 
	^ super 
		attributeAt: aKey
		ifAbsentPut: [ aBlock value toSVGString ]
]

{ #category : #'accessing-attributes' }
SVGTag >> attributeAt: aKey put: aValue [ 
	^ super 
		attributeAt: aKey
		put: aValue toSVGString
]

{ #category : #private }
SVGTag >> attributeSetAt: attributeSetClass [ 

	" hkl: maybe this could be done with traits. however, this would have a serious impact on portability. "
	
	attributeSets isNil ifTrue: [ attributeSets := Dictionary new].
	^ attributeSets at: attributeSetClass ifAbsentPut: [ attributeSetClass brush: self ]
]

{ #category : #private }
SVGTag >> closeTag [
	"Close the receiving tag onto the document."

	| fullTag |
	self isClosed
		ifFalse: [
			fullTag := canvas context containsInlinedSVG
				ifTrue: [canvas context userAgentAdaptor fullTagForInlinedSVGTag: self tag]
				ifFalse: [self tag].
			self document closeTag: fullTag
		]
]

{ #category : #'convenience-referencing' }
SVGTag >> generateURL [
	" convenience method for referencing this tag "
	
	self id isNil ifTrue: [ self error: 'Cannot reference tag without id attribute' ].
	^ 'url(#', self id, ')'
]

{ #category : #'convenience-referencing' }
SVGTag >> needsId [
	" true if this tag should always have an ID.
	for instance, gradients can only be referenced, and referencing requires an id,
	so gradients always need an id "

	^ false
]

{ #category : #'accessing-attribute sets' }
SVGTag >> opacity [
	^ self attributeSetAt: SVGOpacityAttributeSet
]

{ #category : #'accessing-attribute sets' }
SVGTag >> opacity: aBlock [
	aBlock value: self opacity
]

{ #category : #public }
SVGTag >> openTag [

	| fullTag |
	fullTag := canvas context containsInlinedSVG
		ifTrue: [ canvas context userAgentAdaptor fullTagForInlinedSVGTag: self tag ]
		ifFalse: [ self tag ].
	self needsId ifTrue: [ self assignNextId ].
	self document openTag: fullTag attributes: attributes closed: self isClosed.
	
]

{ #category : #'accessing-attribute sets' }
SVGTag >> paint [
	^ self attributeSetAt: SVGPaintAttributeSet
]

{ #category : #'accessing-attribute sets' }
SVGTag >> paint: aBlock [
	aBlock value: self paint
]

{ #category : #convenience }
SVGTag >> setOpacity: aNumber [
	self opacity: [:o | o opacity: aNumber]
]

{ #category : #styles }
SVGTag >> style: aString value: value [
	
	self attributes addStyle: aString , ':' , value displayString
]

{ #category : #'convenience-referencing' }
SVGTag >> toSVGString [

	^ self generateURL
]

{ #category : #accessing }
SVGTag >> transform: aBlock [
	aBlock value: self transformList
]

{ #category : #accessing }
SVGTag >> transformList [
	transformList ifNil: [transformList := SVGTransformList new].
	^transformList
]

{ #category : #public }
SVGTag >> with: aBlock [ 
	transformList isNil
		ifFalse: [self attributes 
					at: 'transform'
					put: transformList toSVGString].
	super with: aBlock
]