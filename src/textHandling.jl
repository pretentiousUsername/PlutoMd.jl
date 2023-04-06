"""
---
title: textHandling.jl
author: Ian Mitchell
purpose: Work with text in a pluto notebook.
"""

"""
    deleteComment(line)

Deletes the comments from an input string.
"""
function deleteComment(line::String) # I think this could be edited a bit
    line = split(line)
    space = " "

    commentNormal = "#"
    commentFrontmatter = "#>"
    
    if ( line[1] == commentNormal ) || ( line[1] == commentFrontmatter )
        line = join( deleteat!(line, 1), " " )
        return line

    else # if this backfires, just swap the commented lines below
        return join(line, space)
        #error("line is not commented.")

    end
end
