package MyTypes::SvcTaxonName;
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

my %name_of :ATTR(:get<name>);
my %tsn_of :ATTR(:get<tsn>);

__PACKAGE__->_factory(
    [ qw(        name
        tsn

    ) ],
    {
        'name' => \%name_of,
        'tsn' => \%tsn_of,
    },
    {
        'name' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
        'tsn' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
    },
    {

        'name' => 'name',
        'tsn' => 'tsn',
    }
);

} # end BLOCK







1;


=pod

=head1 NAME

MyTypes::SvcTaxonName

=head1 DESCRIPTION

Perl data type class for the XML Schema defined complexType
SvcTaxonName from the namespace http://data.itis_service.itis.usgs.org/xsd.






=head2 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * name


=item * tsn




=back


=head1 METHODS

=head2 new

Constructor. The following data structure may be passed to new():

 { # MyTypes::SvcTaxonName
   name =>  $some_value, # string
   tsn =>  $some_value, # string
 },




=head1 AUTHOR

Generated by SOAP::WSDL

=cut
