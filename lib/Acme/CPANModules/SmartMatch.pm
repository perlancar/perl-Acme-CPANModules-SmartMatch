package Acme::CPANModules::SmartMatch;

use strict;
use warnings;
use Acme::CPANModulesUtil::Misc;

# AUTHORITY
# DATE
# DIST
# VERSION

my $text = <<'_';
**About smart match**

Smart matching, via the operator `~~`, was introduced in perl 5.10 (released
2007). It's probably inspired by Perl 6 (now called Raku)'s `given/when` and/or
Ruby's `case` and `===` operator that can "do the right/smart thing" in a `case`
statement. Smart matching was indeed introduced along the new `switch` in perl
5.10.

What can smart match do? A whole lot. It can do string equality like `eq` if
given a string on the left hand side and a string on the right hand side. Or it
can do numeri equality like `==` when both sides are numbers. It can do regex
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
on the operand, because in Perl the operand's type is unclear. Mainaly, a scalar
can be a string, or a number, or both.

In perl 5.18 (2013), 6 years after being introduced and used by programmers
without warning, smart match was declared as experimental, which is weird if you
think about it. You now have to add `use experimental "smartmatch"' to silence
the warning. Future perls after 5.36 will most probably deprecate and later
remove this feature. What happens to the `switch` statement then? Since it's
tied to smart matching, it also gets the same fate: became experimental since
5.18 and will probably be removed in future perls.

However, if you still miss smart matching, some modules have been written to
give you somewhat similar feature.


**Modules**

<pm:match::smart> (as `|M|` operator or as function `match`) gives you a
similar behaviour to perl's own `~~`.

<pm:match::simple>, also by the author of `match::smart`, offers a simplified
version of smart matching. Still it has 8 kinds of behavior depending on the
/right/ hand side.

Also see <pm:match::simple::sugar> which gives you `when`, `then`, and `numeric`
for use in a `for()` statement as a switch/use alternative.

<pm:Smart::Match> offers a bunch of functions related to matching. Probably too
low-level to use if you just want a smart match replacement.

_

our $LIST = {
    summary => 'List of modules to do smart matching',
    description => $text,
    tags => ['task'],
};

Acme::CPANModulesUtil::Misc::populate_entries_from_module_links_in_description;

1;
# ABSTRACT:
