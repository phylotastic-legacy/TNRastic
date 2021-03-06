
package MyElements::getScientificNameFromTSN;
use strict;
use warnings;

{ # BLOCK to scope variables

sub get_xmlns { 'http://itis_service.itis.usgs.org' }

__PACKAGE__->__set_name('getScientificNameFromTSN');
__PACKAGE__->__set_nillable();
__PACKAGE__->__set_minOccurs();
__PACKAGE__->__set_maxOccurs();
__PACKAGE__->__set_ref();

use base qw(
    SOAP::WSDL::XSD::Typelib::Element
    SOAP::WSDL::XSD::Typelib::ComplexType
);

our $XML_ATTRIBUTE_CLASS;
undef $XML_ATTRIBUTE_CLASS;

sub __get_attr_class {
    return $XML_ATTRIBUTE_CLASS;
}

use Class::Std::Fast::Storable constructor => 'none';
use base qw(SOAP::WSDL::XSD::Typelib::ComplexType);

Class::Std::initialize();

{ # BLOCK to scope variables

my %tsn_of :ATTR(:get<tsn>);

__PACKAGE__->_factory(
    [ qw(        tsn

    ) ],
    {
        'tsn' => \%tsn_of,
    },
    {
        'tsn' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
    },
    {

        'tsn' => 'tsn',
    }
);

} # end BLOCK






} # end of BLOCK



1;


=pod

=head1 NAME

MyElements::getScientificNameFromTSN

=head1 DESCRIPTION

Perl data type class for the XML Schema defined element
getScientificNameFromTSN from the namespace http://itis_service.itis.usgs.org.







=head1 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * tsn

 $element->set_tsn($data);
 $element->get_tsn();





=back


=head1 METHODS

=head2 new

 my $element = MyElements::getScientificNameFromTSN->new($data);

Constructor. The following data structure may be passed to new():

 {
   tsn =>  $some_value, # string
 },

=head1 AUTHOR

Generated by SOAP::WSDL

=cut

