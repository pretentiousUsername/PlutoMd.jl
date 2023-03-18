---
title: metadata.jl
author: Ian Mitchell
purpose: Extract metadata from a pluto notebook and format it.
---

There is a fair amount of work that needs to be done in order to turn a Pluto
notebook into a pandoc markdown file, however, none of it is so hard that it's
impossible---this is difficult enough to be challenging, but not so much that
it's frustrating by programming standards.


# Delete comments and strings
Before we can move on to more fun document stuff, a fair amount of the legwork
will need to be done by deleting comments and strings.

## Delete comments

```jl
function deleteComment(line::String)
    line = split(line)

    commentNormal = "#"
    commentFrontmatter = "#>"
    
    if ( line[1] == commentNormal ) || ( line[1] == commentFrontmatter )
        line = join( deleteat!(line, 1), " " )
        return line
```

Rather than return an error, I figured it would be better to return the
original string back without any modifications---if this backfires, just swap
the comments between the following lines.

```jl
    else
        return join(line, " ")
        #error("line is not commented.")

    end
end
```

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

Now, let's get on with it.

First, we'll create a function that makes the metadata an array of strings.

```jl
function frontmatterToStrings(filename::String)
    open(filename, "r") do file

        lines = readlines(file)
        metaStart = 5

        titleArray::Array{String} = []

        # find the end of the frontmatter block
        for line in lines[metaStart:end]
            if isempty(line) == true
                break
            else
                lineString = string(line)
                push!(titleArray, lineString)
            end
        end

        return titleArray
   
    end
end
```


The front matter usually looks something like this
```jl
#> [frontmatter]
#> title = bla bla bla
#> author = foo
```

```jl
funny1 = "# OHHHH MY! OHHH! DUDE THE THING THAT EVERYBODY---! ONION!---OH UH I
GOT AN ONION RING!"

funny2 = "#> chomp chomp chomp"

funny3 = "Brush your teeth if you want to not go to fucking jail kids."


#=jerma = [funny1, funny2, funny3]

for funny in jerma
    println(deleteComment(funny))
end=#

#=println( deleteComment.( frontmatterToStrings("../testing/son.jl")  ) )=#
```
