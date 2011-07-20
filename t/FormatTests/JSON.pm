package FormatTests::JSON;
use base 'FormatTests';

use strict;
use warnings;

use JSON::Any;


sub new {
   my $class = shift;
   return bless { j => JSON::Any->new() }, $class;
}


sub num_sales {
   my $self = shift;
   my $results = shift;
   return scalar @{ $results->{sale_summary} };
}

sub num_all_sales {
    my $self = shift;
    my $results = shift;
    return $results->{page_info}{total_entries};
}

sub get_col {
    my $self = shift;
    my $sale = shift;
    my $col = shift;

    my $column_value = $sale->{$col};
    if ($col eq 'recurring_declined' ) {
       if (!defined $column_value) {
          return '';
       }
    }

    return $column_value;
}

sub to_hash {
   my $self = shift;
   my $content = shift;
   my $hash = $self->{j}->decode($content);
   return $hash;
}

sub num_coupons {
    my $self = shift;
    my $results = shift;
    return scalar @{ $results->{coupon} };
}

sub num_payments {
    my $self = shift;
    my $results = shift;
    return scalar @{ $results->{payments} };
}

1
