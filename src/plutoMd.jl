module PlutoMd

using Markdown
using TOML

md"""
---
title: plutoMd.jl
author: Ian Mitchell
purpose: Turn a Pluto notebook into a markdown file.
---

There is a fair amount of work that needs to be done in order to turn a Pluto
notebook into a pandoc markdown file, however, none of it is so hard that it's
impossible---this is difficult enough to be challenging, but not so much that
it's frustrating by programming standards.


# Metadata
The first thing I want to do is take care of generating a YAML metadata block.
This is the first challenge to take care of---you don't read many books that
don't have titles on the cover, unless you're reading some weird new Dadaist
book that's never been seen before.
"""

function createMetadata() # I don't think this function needs many arguments
    titleBlock = "[frontmatter]"
    commentLine = "#> "
end

end # module --- !!! DO NOT DELETE !!!
