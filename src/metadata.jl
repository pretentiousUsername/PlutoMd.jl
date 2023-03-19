"""
---
title: metadata.jl
author: Ian Mitchell
license: BSD-3
purpose: Extract metadata from a Pluto.jl notebook.
---
"""

"""
    deleteComment(line)

Deletes the comments from an input string.
"""
function deleteComment(line::String)
    line = split(line)

    commentNormal = "#"
    commentFrontmatter = "#>"
    
    if ( line[1] == commentNormal ) || ( line[1] == commentFrontmatter )
        line = join( deleteat!(line, 1), " " )
        return line

    else # if this backfires, just swap the commented lines below
        return join(line, " ")
        #error("line is not commented.")

    end
end


"""
I'm a bit iffy on this. I think I want to try opening and closing files as little
as possible for vague aesthetic reasons. Maybe there's some added security in
there?---do I care about security?
"""


"""
    getFrontmatter(filename)

Extract the frontmatter from a Pluto noteboke.
"""
function getFrontmatter(filename::String)
    open(filename, "r") do file

        lines = readlines(file)
        start = 5

        titleArray::Array{String} = []

        # find the end of the frontmatter block
        for line in lines[start:end]
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

function newLine(text::String)
    return text * "\n"
end

"""
    encloseInBlock(text, block)

Enclose a metadata header within a block of characters.
"""
function encloseInBlock(text::Array{String}, block::String)
    endOfText = length(text) + 2 # the +2 is because endOfText updates after the
    segments = [1, endOfText]    # first for-loop iteration.
    
    for segment in segments
        block *= '\n'
        text = insert!(text, segment, block)
    end

    return text
end

# I prefer YAML, but TOML is easier to make from the start. I'll do YAML later.
function makeTomlMetadata(titleArray::Array{String})
    blockCharacters = "+++" # see pandoc's documentation

    titleArray = deleteComment.(titleArray)
    titleArray = newLine.(titleArray)
    return encloseInBlock(titleArray, blockCharacters)
end


#=funny1 = "# OHHHH MY! OHHH! DUDE THE THING THAT EVERYBODY---! ONION!---OH UH I
GOT AN ONION RING!"

funny2 = "#> chomp chomp chomp"

funny3 = "Brush your teeth if you want to not go to fucking jail kids."


jerma = [funny1, funny2, funny3]

for funny in jerma
    println(deleteComment(funny))
end=#

titleBlock = getFrontmatter("../testing/son.jl")
titleBlock = makeTomlMetadata(titleBlock)

println( join(titleBlock) )
