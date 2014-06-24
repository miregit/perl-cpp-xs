# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Osadmin.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;
use Data::Dumper;

use Test::More tests => 7;
BEGIN { use_ok('Osadmin') };

my $osa = Osadmin->new('proba  ', -5);

cmp_ok ($osa->get_length(), '==', 7, 'cpp get_length');

$osa->right_trim();

cmp_ok ($osa->get_length(),    '==', 5,    'cpp trim + get_length');
cmp_ok ($osa->test_perl_sub(), 'eq', 'ok', 'test perl code');
is_deeply ($osa->get_ar_x_s(2), ['proba', 'proba'], 'test array references with strings');
is_deeply ($osa->get_ar_x_n(3), [-5, -5, -5], 'test array references with numbers');

is_deeply ([$osa->get_a_x_n(2)], [-5, -5], 'test array with numbers via stack');


#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

