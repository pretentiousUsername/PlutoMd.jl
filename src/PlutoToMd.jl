#module PlutoToMd

using Markdown

include("textHandling.jl")
#include("metadata.jl")
include("ordering.jl")

gloop = getOrder("../testing/simpleAs.jl")

determineIfConfigCell(gloop[end])

#println(getOrder("../testing/simpleAs.jl"))


#end # module
