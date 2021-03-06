package MyTypes::SvcItisTerm;
use strict;
use warnings;


__PACKAGE__->_set_element_form_qualified(1);

sub get_xmlns { 'http://data.itis_service.itis.usgs.org/xsd' };

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}


use base qw(MyTypes::SvcTaxonomicBase);
# Variety: sequence
use Class::Std::Fast::Storable constructor => 'none';
use base qw(SOAP::WSDL::XSD::Typelib::ComplexType);

Class::Std::initialize();

{ # BLOCK to scope variables

my %tsn_of :ATTR(:get<tsn>);
my %commonNames_of :ATTR(:get<commonNames>);
my %nameUsage_of :ATTR(:get<nameUsage>);
my %scientificName_of :ATTR(:get<scientificName>);

__PACKAGE__->_factory(
    [ qw(        tsn
        commonNames
        nameUsage
        scientificName

    ) ],
    {
        'tsn' => \%tsn_of,
        'commonNames' => \%commonNames_of,
        'nameUsage' => \%nameUsage_of,
        'scientificName' => \%scientificName_of,
    },
    {
        'tsn' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'commonNames' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'nameUsage' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'scientificName' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
    },
    {

        'tsn' => 'tsn',
        'commonNames' => 'commonNames',
        'nameUsage' => 'nameUsage',
        'scientificName' => 'scientificName',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

MyTypes::SvcItisTerm

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
SvcItisTerm from the namespace http://data.itis_service.itis.usgs.org/xsd.






=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * commonNames


=item * nameUsage


=item * scientificName




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():

 { # MyTypes::SvcItisTerm
   commonNames =>  $some_value, # string
   nameUsage =>  $some_value, # string
   scientificName =>  $some_value, # string
 },




=head1 AUTHOR

Generated by SOAP::WSDL

=cut

