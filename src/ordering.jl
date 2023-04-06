function findOrder(file::String)
    header = "# ╔═╡ Cell order:"
    order::Array{String} = []

    inputFile = eachline( open(file, "r") )
    println(inputFile)
    #deleteat!(inputFile, last)
    
    i = 0
    #println(i)

    for line in inputFile
        if contains(line, header)
            #break
            println("fizz")
        else
            println("buzz")
            #i+=1
        end
    end
    

end
