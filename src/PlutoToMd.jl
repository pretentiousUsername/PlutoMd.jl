#module PlutoToMd

using Markdown
#using TOML

include("textHandling.jl")
#include("metadata.jl")
include("ordering.jl")

println(findOrder("../testing/simpleAs.jl"))

#end # module --- !!! DO NOT DELETE !!!
