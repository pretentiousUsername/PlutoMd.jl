md"""
---
title: plutoMd.jl
author: Ian Mitchell
purpose: Turn a Pluto notebook into a markdown file.
---

There is a fair amount of work that needs to be done in order to turn a Pluto
notebook into a pandoc markdown file, however, none of it is so hard that it's
impossible---this is difficult enough to be challenging, but not so much that
it's frustrating by programming standards.


# Open the file
The first thing to do is open the notebook you want to convert, and turn it into
text.
"""

function openFile(filename::String)
    open(filename, "r") do f
        l = 0

        while ! eof(f)
            s = readline(f)
            l += 1
            println("$line. $s")
        end
    end
end

md"""
# Make metadata
The first thing I want to do is take care of generating a YAML metadata block.
This is the first challenge to take care of---you don't read many books that
don't have titles on the cover, unless you're reading some weird new Dadaist
book that's never been seen before.
"""

function createMetadata(text) # I don't think this function needs many arguments
    titleBlock = "[frontmatter]"
    commentLine = "#> "
md"""
In order to find the beginning and end of the front matter, all you need to do is
find the first line, which always begins with "#> [frontmatter]", and the first
line after it without a comment at the beginning. For example

```jl
#> [frontmatter]
#> title = bla bla bla
#> author = foo
```
"""
    # this makes me miss Python's string handling a bit
    firstLine = commentLine * titleBlock
    lastLine = "\n"
end

md"""
# Put code into codeblocks
"""

md"""
# Remove md blocks
Remove the comments from md blocks so they act as regular markdown text.
"""

md"""
# Enforce automatic linewidth limit
Adds an break character after a line surpasses a set character limit. This of
course considers whether or not a word is near the line, and does *not* just
insert a linebreak willy-nilly.
"""
