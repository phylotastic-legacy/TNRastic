
package MyElements::getTSNFromLSID;
use strict;
use warnings;

{ # BLOCK to scope variables

sub get_xmlns { 'http://itis_service.itis.usgs.org' }

__PACKAGE__->__set_name('getTSNFromLSID');
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

my %lsid_of :ATTR(:get<lsid>);

__PACKAGE__->_factory(
    [ qw(        lsid

    ) ],
    {
        'lsid' => \%lsid_of,
    },
    {
        'lsid' => 'SOAP::WSDL::XSD::Typelib::Builtin::string',
    },
    {

        'lsid' => 'lsid',
    }
);

} # end BLOCK






} # end of BLOCK



1;


=pod

=head1 NAME

MyElements::getTSNFromLSID

=head1 DESCRIPTION

Perl data type class for the XML Schema defined element
getTSNFromLSID from the namespace http://itis_service.itis.usgs.org.







=head1 PROPERTIES

The following properties may be accessed using get_PROPERTY / set_PROPERTY
methods:

=over

=item * lsid

 $element->set_lsid($data);
 $element->get_lsid();





=back


=head1 METHODS

=head2 new

 my $element = MyElements::getTSNFromLSID->new($data);

Constructor. The following data structure may be passed to new():

 {
   lsid =>  $some_value, # string
 },

=head1 AUTHOR

Generated by SOAP::WSDL

=cut

