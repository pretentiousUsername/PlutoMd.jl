function findCells(file::String)
    cellHeader = "# ╔═╡"
    inputFile = eachline(file)
    cellLocations::Array{Int64} = []
    i::Int64 = 1

    for line in inputFile
        i+=1
        if contains(cellHeader, line)
            push!(cellLocations, i)
        else
            nothing
        end
    end
    
    return cellLocations
end


function findOrderList(file::String)
    header = "# ╔═╡ Cell order:"
    inputFile = eachline(file)
    titleLine = 1

    for line in inputFile # find cell order block
        titleLine+=1
        if line == header
            break
        else
            nothing
        end
    end
    
    return titleLine
end

function getOrder(file::String)
    orderLine = findOrderList(file)
    inputFile = readlines(file)

   order = [deleteCommentOrder(line) for line in inputFile[orderLine:end]]

    return order
end
