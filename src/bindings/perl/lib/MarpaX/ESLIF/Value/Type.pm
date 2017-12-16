use strict;
use warnings FATAL => 'all';

package MarpaX::ESLIF::Value::Type;

# ABSTRACT: ESLIF Value Types

# AUTHORITY

=head1 DESCRIPTION

ESLIF values are mapped to constants. This module is giving access to them, although they have no use in the perl interface.

=head1 SYNOPSIS

  use MarpaX::ESLIF;

  my $valueType;
  $valueType = MarpaX::ESLIF::Value::Type->MARPAESLIF_VALUE_TYPE_UNDEF;         #  0
  $valueType = MarpaX::ESLIF::Value::Type->MARPAESLIF_VALUE_TYPE_CHAR;          #  1
  $valueType = MarpaX::ESLIF::Value::Type->MARPAESLIF_VALUE_TYPE_SHORT;         #  2
  $valueType = MarpaX::ESLIF::Value::Type->MARPAESLIF_VALUE_TYPE_INT;           #  3
  $valueType = MarpaX::ESLIF::Value::Type->MARPAESLIF_VALUE_TYPE_LONG;          #  4
  $valueType = MarpaX::ESLIF::Value::Type->MARPAESLIF_VALUE_TYPE_FLOAT;         #  5
  $valueType = MarpaX::ESLIF::Value::Type->MARPAESLIF_VALUE_TYPE_DOUBLE;        #  6
  $valueType = MarpaX::ESLIF::Value::Type->MARPAESLIF_VALUE_TYPE_PTR;           #  7
  $valueType = MarpaX::ESLIF::Value::Type->MARPAESLIF_VALUE_TYPE_ARRAY;         #  8

=cut

use Carp qw/croak/;

# VERSION

=head1 CONSTANTS

=head2 MARPAESLIF_VALUE_TYPE_UNDEF

Undefined value.

=head2 MARPAESLIF_VALUE_TYPE_CHAR

I<C>'s C<char>.

=head2 MARPAESLIF_VALUE_TYPE_SHORT

I<C>'s C<short>.

=head2 MARPAESLIF_VALUE_TYPE_INT

I<C>'s C<int>.

=head2 MARPAESLIF_VALUE_TYPE_LONG

I<C>'s C<long>.

=head2 MARPAESLIF_VALUE_TYPE_FLOAT

I<C>'s C<float>.

=head2 MARPAESLIF_VALUE_TYPE_DOUBLE

I<C>'s C<double>.

=head2 MARPAESLIF_VALUE_TYPE_PTR

I<C>'s C<void *>.

=head2 MARPAESLIF_VALUE_TYPE_ARRAY

I<C>'s pointer to a C<{void *, size_t}> structure.

=cut

# This section should be replaced on-the-fly at build time
# AUTOLOAD

1;
