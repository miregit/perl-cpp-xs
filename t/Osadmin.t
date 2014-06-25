# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Osadmin.t'

#########################

use strict;
use warnings;

use Test::More tests => 9;

BEGIN { use_ok('Osadmin') };

my $osa = Osadmin->new('proba  ', -5);

cmp_ok ($osa->get_length(), '==', 7, 'cpp get_length');

$osa->right_trim();

cmp_ok ($osa->get_length(),    '==', 5,    'cpp trim + get_length');
cmp_ok ($osa->test_perl_sub(), 'eq', 'ok', 'test perl code');
is_deeply ($osa->get_ar_x_s(2), ['proba', 'proba'], 'test array references with strings');
is_deeply ($osa->get_ar_x_n(3), [-5, -5, -5], 'test array references with numbers');

is_deeply ([$osa->get_a_x_n(2)], [-5, -5], 'test array with numbers via stack');

is_deeply ($osa->get_hr_data(), {'s' => 'proba', 'n' => -5}, 'test hash ref with data');


is_deeply ($osa->get_x_ar_hr_data(2), [{'s' => 'proba', 'n' => -5}, {'s' => 'proba', 'n' => -5}], 'test array reference with 2 hash references of data');

