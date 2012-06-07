package MyTypes::SvcTaxonRankInfo;
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
my %kingdomId_of :ATTR(:get<kingdomId>);
my %kingdomName_of :ATTR(:get<kingdomName>);
my %rankId_of :ATTR(:get<rankId>);
my %rankName_of :ATTR(:get<rankName>);

__PACKAGE__->_factory(
    [ qw(        tsn
        kingdomId
        kingdomName
        rankId
        rankName

    ) ],
    {
        'tsn' => \%tsn_of,
        'kingdomId' => \%kingdomId_of,
        'kingdomName' => \%kingdomName_of,
        'rankId' => \%rankId_of,
        'rankName' => \%rankName_of,
    },
    {
        'tsn' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'kingdomId' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'kingdomName' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'rankId' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'rankName' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
    },
    {

        'tsn' => 'tsn',
        'kingdomId' => 'kingdomId',
        'kingdomName' => 'kingdomName',
        'rankId' => 'rankId',
        'rankName' => 'rankName',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

MyTypes::SvcTaxonRankInfo

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
SvcTaxonRankInfo from the namespace http://data.itis_service.itis.usgs.org/xsd.






=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * kingdomId


=item * kingdomName


=item * rankId


=item * rankName




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():

 { # MyTypes::SvcTaxonRankInfo
   kingdomId =>  $some_value, # string
   kingdomName =>  $some_value, # string
   rankId =>  $some_value, # string
   rankName =>  $some_value, # string
 },




=head1 AUTHOR

Generated by SOAP::WSDL

=cut
