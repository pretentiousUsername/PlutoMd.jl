#module PlutoToMd

using Markdown

include("textHandling.jl")
#include("metadata.jl")
include("ordering.jl")

println(getOrder("../testing/simpleAs.jl"))


#end # module --- !!! DO NOT DELETE !!!
