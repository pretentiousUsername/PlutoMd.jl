function findOrder(file::String)
    header = "# ╔═╡ Cell order:"
    order::Array{String} = []

    inputFile = eachline( open(file, "r") )

    for line in inputFile[1:end]
        println(line)
    end
    
    #=i = 1

    for line in inputFile
        if contains(header, line)
            println("fizz")
        else
            println("buzz")
            i+=1
        end
    end
    
    println(i)=#

end

function findCells(file::String)
    cellHeader = header = "# ╔═╡"
    inputFile = eachline(file)
    #println(inputFile)
    
    cellLocations::Array{Int64} = []
    i::Int64 = 1

    for line in inputFile
        if contains(cellHeader, line)
            i+=1
            push!(cellLocations, i)
        else
            i+=1
        end
    end
    println(cellLocations)
end
