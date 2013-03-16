
Foundation CMS Tools for Emacs
==============================

This is a package of tools for interacting with the back-end of the Foundation
CMS via emacs. It will not be useful to you unless you have access to the
plumbing underneath Foundation, which in practice means that you are sitting in
the DesertNet office.

I wrote it because it helped me get work done at DesertNet. One of the things
that I liked most about DesertNet was that I had a significant level of
autonomy --- which is why I was able to say "screw it! I've been burned enough
times by this legacy Perl codebase!" and write myself an emacs-lisp API over
that codebase. This does not solve the problems with the codebase, but it does
let me get things done.

I am very grateful for this autonomy, because it meant that over my time at
DesertNet, theoretically a Perl shop, I got a *lot* better at Lisp (and not at
lot better at Perl, unless you count "more willing to start cussing loudly when
dealing with references/contexts/sigils" as "better"). The other bright side is
that this project ended up growing and growing and accumulating more "hey I
might need to re-use that, better whip up a defun" stuff until it was a
substantial-ish project. It also serves as a way of demonstrating that I've
gotten to a pretty comfortable place with elisp.

I found excuses to use pattern-matching (`pcase.el`), currying (hooray for
`apply-partially`!), lots of `map`, lots of the `loop` macro, and a crop of
emacs' text-manipulation functions.

This repo exists so that I can have a public record of my work at DesertNet, as
well as to force me to put more of that code into presentable shape --- pull
out company/client-specific data, expand the documentation a little (I am
pretty good at writing docstrings, but full-length prose documentation I need
practice at), and to gin up some unit tests because oy. So it'll be growing
with time, and commit number one is this explanation of what's going on. :)
