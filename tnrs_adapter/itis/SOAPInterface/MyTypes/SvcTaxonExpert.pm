package MyTypes::SvcTaxonExpert;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'http://data.itis_service.itis.usgs.org/xsd' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}

use Class::Std::Fast::Storable constructor => 'none';
use base qw(SOAP::WSDL::XSD::Typelib::ComplexType);

Class::Std::initialize();

{ # BLOCK to scope variables

my %comment_of :ATTR(:get<comment>);
my %expert_of :ATTR(:get<expert>);
my %referenceFor_of :ATTR(:get<referenceFor>);
my %updateDate_of :ATTR(:get<updateDate>);

__PACKAGE__->_factory(
    [ qw(        comment
        expert
        referenceFor
        updateDate

    ) ],
    {
        'comment' => \%comment_of,
        'expert' => \%expert_of,
        'referenceFor' => \%referenceFor_of,
        'updateDate' => \%updateDate_of,
    },
    {
        'comment' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'expert' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'referenceFor' => 'MyTypes::SvcReferenceForElement',
        'updateDate' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
    },
    {

        'comment' => 'comment',
        'expert' => 'expert',
        'referenceFor' => 'referenceFor',
        'updateDate' => 'updateDate',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

MyTypes::SvcTaxonExpert

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
SvcTaxonExpert from the namespace http://data.itis_service.itis.usgs.org/xsd.






=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * comment


=item * expert


=item * referenceFor


=item * updateDate




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():

 { # MyTypes::SvcTaxonExpert
   comment =>  $some_value, # string
   expert =>  $some_value, # string
   referenceFor =>  { # MyTypes::SvcReferenceForElement
     name =>  $some_value, # string
     refLanguage =>  $some_value, # string
     referredTsn =>  $some_value, # string
   },
   updateDate =>  $some_value, # string
 },




=head1 AUTHOR

Generated by SOAP::WSDL

=cut
