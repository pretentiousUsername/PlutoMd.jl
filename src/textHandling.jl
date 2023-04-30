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

"""
Because Pluto uses some weird characters, I had to get a little weird with it
for this function.
"""
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

"""
The final cells in a Pluto notebook---usually the TOML files---have a format
a bit like this: 00000000-0000-0000-0000-00000000000n. So I just need to split
them up, and if the sum of all of the numbers is 0, then it can be safely
discarded from the list. The maximum number of integers here is 12, so I'll
assume each number is a sixteen bit integer.
"""
function determineIfConfigCell(cellTitle::String)
    cellTitle = split(cellTitle, "-")

    sums = [begin # sorry if this is a bit terse
            numbers = [parse(Int16, number) for number in substring]
            sum(numbers)
            end for substring in cellTitle]
end
