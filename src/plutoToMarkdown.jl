using Markdown

md"""
---
title: plutoToMarkdown.jl
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


# Make metadata
The first thing I want to do is take care of generating a YAML metadata block.
This is the first challenge to take care of---you don't read many books that
don't have titles on the cover, unless you're reading some weird new Dadaist
book that's never been seen before.

The first thing to do is to read the file until it comes across the metadata
block. In order to do this, first the program skips down three lines, because
the first three lines in a Pluto notebook are always

```jl
### A Pluto.jl notebook ###
# v0.19.22

```

This means that for speed's sake, I don't really need to care about finding
the frontmatter---all the program needs to do is skip down a few lines, then
find the end of the front matter. In order to do that, the program just needs
to find the last line with a `#>`, and then skip down a line after that.
"""


function createMetadata(filename::String)
    commentLine = "#> "
    #titleBlock = "[frontmatter]"
    #fmBlock = commentLine * titleBlock # front matter block
    

    open(filename, "r") do file

        lines = readlines(file)
        metaStart = 5 # first metadata line without [frontmatter]

        titleArray::Array{String} = []

        # find the end of the frontmatter block
        for i in lines[metaStart:end]
            if isempty(i) == true
                break
            else
                j = string(i)
                #println(j)
                push!(titleArray, j)
            end
        end

        println(titleArray)
   
    end
end



    
    
    

md"""
The front matter usually looks something like this
```jl
#> [frontmatter]
#> title = bla bla bla
#> author = foo
```
"""

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

print(createMetadata("../testing/son.jl"))
