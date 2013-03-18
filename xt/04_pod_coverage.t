use strict;
use Test::More;
eval "use Test::Pod::Coverage";
plan skip_all => "Test::Pod::Coverage required for testing POD coverage" if $@;


my %INNER_CLASSES = map { $_ => 1 } qw/
    Algorithm::HyperLogLog::PP
/;

for my $pkg (  grep { !exists $INNER_CLASSES{$_} } all_modules() )
{
    pod_coverage_ok($pkg);
}

done_testing;
