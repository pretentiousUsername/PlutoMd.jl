using Markdown

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


funny1 = "# OHHHH MY! OHHH! DUDE THE THING THAT EVERYBODY---! ONION!---OH UH I
GOT AN ONION RING!"

funny2 = "#> chomp chomp chomp"

funny3 = "Brush your teeth if you want to not go to fucking jail kids."


#=jerma = [funny1, funny2, funny3]

for funny in jerma
    println(deleteComment(funny))
end=#

#=println( deleteComment.( frontmatterToStrings("../testing/son.jl")  ) )=#
