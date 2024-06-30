package Acme::CPANModules::SmartMatch;

use strict;
use warnings;
use Acme::CPANModulesUtil::Misc;

# AUTHORITY
# DATE
# DIST
# VERSION

my $text = <<'MARKDOWN';
**About smart match**

Smart matching, via the operator `~~`, was introduced in perl 5.10 (released
2007). It's inspired by Perl 6 (now called Raku)'s `given/when` and/or Ruby's
`case` and `===` operator that can "do the right/smart thing" in a `case`
statement. Smart matching was indeed introduced along the new `switch` in perl
5.10.

What can smart match do? A whole lot. It can do string equality like `eq` if
given a string on the left hand side and a string on the right hand side. Or it
can do numeric equality like `==` when both sides are numbers. It can do regex
matching like `=~` if the left hand side is a scalar and the right hand side is
a regexp.

But wait, there's (much) more. Interesting things begin when the left/right hand
side is an array/hash/code/object. `$str ~~ @ary`, probably the most common
use-case for smart matching, can do value-in-array checking, equivalent to `grep
{ $str eq $_ } @ary` but with short-circuiting capability. Then there's `$re ~~
@ary` which can perform regex matching over the elements of array. Now what
about when the right hand side is an arrayref or hashref? Or the left hand side?
What if the array is an array of regexes? Or a mix of other types?

You need a full-page table as a reference of what will happen in smart matching,
depending on the combination of operands. Things got complex real fast.
Behaviors were changed from release to release, starting from 5.10.1. Then
nobody was sure what smart matching should or should not do exactly.

In the end almost everyone agrees that smart matching is a bad fit for a weakly
typed language like Perl. The programmer needs to be explicit on what type of
operation should be done by specifying the appropriate /operator/ (e.g. `==` vs
`eq`) instead of the operator deducing what operation needs to be done depending
on the operand, because in Perl the operand's type is unclear. Mainly, a scalar
can be a string, or a number, or a bool, or all.


**The roadmap to removal**

In perl 5.18 (2013), 6 years after being introduced and used by programmers
without warning, smart match was declared as experimental, which is weird if you
think about it. You now have to add `use experimental "smartmatch"` to silence
the warning. What happens to the `switch` statement then? Since it's tied to
smart matching, it also gets the same fate: became experimental in 5.18.

In perl 5.38 (2023) smart match is deprecated. You can no longer silence the
warning with "use experimental 'smartmatch'" and must replace the use of smart
match with something else.

Perl 5.40 (2024) finally removes smart match, resulting in a syntax error if you
still use it.


**Modules**

However, if you still miss smart matching, some modules have been written to
give you somewhat similar feature.

<pm:match::smart> (by TOBYINK, first released 2013, pure-perl) gives you a
similar behaviour to perl's own `~~`. It can be used as the `|M|` operator or as
the `match()` function.

<pm:match::simple> (by TOBYINK which is also the author of `match::smart`, first
released in 2013, in the same distribution as `match::smart`, available in XS as
well as pure-perl) offers a simplified version of smart matching. Still it has 8
kinds of behaviors depending on the /right/ hand side.

Also see <pm:match::simple::sugar> which gives you `when`, `then`, and `numeric`
for use in a `for()` statement as a switch/use alternative.

<pm:Switch::Right> (by DCONWAY, first released in June 2024, pure-perl). Written
by one of the designers of Perl 6, Switch::Right offers a simplified (or
reimagined) `switch` and smartmatching by simplifying the rules from 23 to just
6, though the rules still depend on a mix of left and right operands. Since the
module is new and has no reverse dependencies on CPAN yet, we still need to wait
and see if the ruleset is a good and practical compromise.


**Other modules**

<pm:Smart::Match> (by LEONT, first released in 2011, pure-perl) offers a bunch
of functions related to matching. Probably too low-level to use if you just want
a smart match replacement.

MARKDOWN

our $LIST = {
    summary => 'List of modules to do smart matching',
    description => $text,
    tags => ['task'],
};

Acme::CPANModulesUtil::Misc::populate_entries_from_module_links_in_description;

1;
# ABSTRACT:

=head1 SEE ALSO

L<Bencher::ScenarioBundle::SmartMatch>
