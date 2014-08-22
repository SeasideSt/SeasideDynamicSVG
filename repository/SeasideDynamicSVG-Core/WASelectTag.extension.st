Extension { #name : #WASelectTag }

{ #category : #'*SeasideDynamicSVG-Core' }
WASelectTag >> beSubmitOnChange [
	self onChange: 'submit()'.
]
