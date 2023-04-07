"""
---
title: textHandling.jl
author: Ian Mitchell
purpose: Work with text in a pluto notebook.
---
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
        line = join( deleteat!(line, 1), space )
        return line

    else # if this backfires, just swap the commented lines below
        return join(line, space)
        #error("line is not commented.")

    end
end

function deleteCellLine(line::String)
    line = split(line)
    space = " "

    cellLine = "# ╔═╡"
    
    if line[1] == cellLine
        line = join( deleteat!(line, 1), space )
        return line

    else
        return join(line, space)

    end
end


function deleteOrderBar(line::String)
    line = deleteComment(line)
    
    cellBar1 = "╟─"
    cellBar2 = "╠═"

    if line[1:4] == cellBar1
        line = split(line, cellBar1)
        line = deleteat!(line, 1)
        line = join(line)
        return line
    elseif line[1:4] == cellBar2
        line = split(line, cellBar2)
        line = deleteat!(line, 1)
        line = join(line)
        return line
    else
        return line

    end
end

function deleteCommentOrder(line::String)
    return deleteComment( deleteOrderBar(line) )
end
