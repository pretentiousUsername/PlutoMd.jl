# PlutoPanMd.jl

PlutoPanMd.jl is a tool that converts [Pluto][pluto] notebooks into a markdown
file.[^name] The main reason for this is quite personal—I like to typeset 
documents using my own [pandoc template][quetz], and I couldn't find any options
for doing that for Pluto.


[^name]: I know, I know—the name is super catchy.

[pluto]: https://github.com/fonsp/Pluto.jl

[quetz]: https://github.com/pretentiousUsername/quetzalcoatl


## To do
+ Make a way to turn a notebook's front matter into a
  [YAML metadata block][mdata].
+ Write a program that inverts the markdown and code segments (i.e. flips the
  code and markdown segments around).
+ Find a way to turn interactive elements into images. `Maybe this could be done
  by making them into a PDF or SVG?`


[mdata]: https://pandoc.org/MANUAL.html#metadata-blocks
