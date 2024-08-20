using AnalyticsService as service from './analytics-service';


annotate service.Activities with @UI : { 
    DeleteHidden : true,
    CreateHidden : true,

    SelectionFields    : [
        name,
        description
    ],

   LineItem  : [
        {Value: name},
        {Value: description},
    ],

    HeaderInfo  : {
        TypeName      : '{i18n>activities_title_list}',
        TypeNamePlural: '{i18n>activities_title_list}',
        Title         : {
            $Type: 'UI.DataField',
            Value: name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: description
        },
    },

    Facets                        : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralInformation',
            Label : 'General Infomation',
            Target: '@UI.FieldGroup#GeneralInformation'
        },
        {$Type: 'UI.ReferenceFacet', Label: 'Translations', Target:  'texts/@UI.LineItem'},
    ],

    FieldGroup #GeneralInformation: {Data: [
            {Value: name},
            {Value: description}
    ]}
}; 

annotate service.Activities.texts with @(
	UI: {
		Identification: [{Value:title}],
		SelectionFields: [ locale, title ],
		LineItem: [
			{Value: locale, Label: 'Locale'},
			{Value: title, Label: 'Title'},
			{Value: description, Label: 'Description'},
		]
	}
);
