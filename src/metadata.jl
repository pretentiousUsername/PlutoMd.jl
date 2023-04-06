"""
---
title: metadata.jl
author: Ian Mitchell
license: BSD-3
purpose: Extract metadata from a Pluto.jl notebook.
---
"""

#="""
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
end=#


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

function preformatMetadata(text)
    text = deleteComment(text)
    text = newLine(text)
    return text
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

function makeTomlMetadata(titleArray::Array{String})
    blockCharacters = "+++" # see pandoc's documentation
    titleArray = preformatMetadata(titleArray)
    return encloseInBlock(titleArray, blockCharacters)
end

# For some reason this function strips the '\n' characters.
function tomlToYaml(text::String)
    text = split(text)
    space = " "

    if text[2] == "="
        text[1] = text[1] * ':'
        deleteat!(text, 2)
    else
        nothing
    end

    text = newLine( join(text, space) )
    return text
end

function makeYamlMetadata(titleArray::Array{String})
    blockCharacters = "---"
    titleArray = preformatMetadata.(titleArray)
    titleArray = tomlToYaml.(titleArray)
    return encloseInBlock(titleArray, blockCharacters)
end
