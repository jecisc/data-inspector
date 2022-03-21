"
Provides actions applied to the inspected data frame. Actions currently implemented are mostly derived from the NewTools playground toolbar.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	toolbar:		<SpToolbarPresenter>


    Implementation Points
"
Class {
	#name : #AISpDataFrameEvaluatorToolbarPresenter,
	#superclass : #AISpDataFrameAbstractPresenter,
	#instVars : [
		'toolbar'
	],
	#category : #'AI-DataFrameInspector'
}

{ #category : #layout }
AISpDataFrameEvaluatorToolbarPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		add: toolbar;
		yourself
]

{ #category : #actions }
AISpDataFrameEvaluatorToolbarPresenter >> doEvaluateAllAndGo [

	self owner doEvaluateAllAndGo
]

{ #category : #initialization }
AISpDataFrameEvaluatorToolbarPresenter >> initializePresenters [ 

	self initializeToolbar.
]

{ #category : #initialization }
AISpDataFrameEvaluatorToolbarPresenter >> initializeToolbar [

	toolbar := self newToolbar
		displayMode: StPharoSettings toolbarDisplayMode;
		addStyle: 'stToolbar';
		fillWith: self toolbarActions;
		yourself
]

{ #category : #actions }
AISpDataFrameEvaluatorToolbarPresenter >> loadPage: aFileReference [

	self owner evalPresenterText: (StPlaygroundPage fromReference: aFileReference) contents.
]

{ #category : #accessing }
AISpDataFrameEvaluatorToolbarPresenter >> toolbarActions [

	^ CmCommandGroup forSpec
		register: (StPlaygroundDoItCommand forSpecContext: self);
		register: (StPlaygroundPublishCommand forSpecContext: self);
		register: (StPlaygroundBindingsCommand forSpecContext: self owner);
		register: (StPlaygroundPagesCommand forSpecContext: self);
		yourself
]