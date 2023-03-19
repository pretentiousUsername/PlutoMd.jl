### A Pluto.jl notebook ###
# v0.19.22

#> [frontmatter]
#> title = "A *very* simple Pluto notebook"
#> abstract = "This notebook is very simple, and adds little of value to the world, other than, of course, a simple testing platform."
#> date = "2023-03-19"

using Markdown
using InteractiveUtils

# ╔═╡ 831399d1-f493-44a2-bff0-f01e121fe3ad
using FiniteDifferences

# ╔═╡ 644014dc-c673-11ed-2718-338302e7d11a
md"""
# A *very* simple Pluto notebook
This notebook right here---the one you're reading---is made to be very simple, and
very easy to parse and turn into a markdown file. It features code and text, but no
images and interactible elements---in short, this notebook is a *simple as possible*
case to show that `PlutoToMarkdown.jl` works as intended.

Now, in order to get some code in this document, I need to type some down. How about
a very simple function $f(x) = x^2$?
"""

# ╔═╡ 55f37518-5bc3-486a-937c-de2a0264a7bb
f(x) = x^2

# ╔═╡ 34197012-0c76-463f-b758-8aa962c0d3e3
md"""
Now, let's calculate the derivative of $f(x)$. In order to do this, we'll use a very
basic *finite difference method* calculation, such that
```math
\frac{df(x)}{dx} \approx \frac{f(x_i) - f(x_{i - 1})}{h} \,,
```
where $h = x_i - x_{i - 1}$.[^1]

Luckily, there is already a very nice library to do that.
"""

# ╔═╡ 36d9e509-2706-4722-bd29-9200b56f5984
md"""
Now let's use the `FiniteDifferences` library to get a decent derivative estimation.
Let's assume that we will want to use 8 gridpoints for each estimation, because that
could probably give us an accurate derivative---I don't *quite* get how this package
works.
"""

# ╔═╡ 386f6e57-5e1f-4849-8b70-859ba51bd3e6
const p = 8 # number of grid points to work with

# ╔═╡ 8e1c1196-e38d-469f-9329-09e917c6d8ba
const q = 1 # order of the derivative

# ╔═╡ beb2f9fe-78e5-4352-8c6a-efe97086e833
dfDx(f, x) = central_fdm(p, q)(f, x) # cursed notation

# ╔═╡ 005bcc58-f13b-4bcc-ac8c-a10c1a8607f8
x = -1:0.01:1

# ╔═╡ 3266b548-3ac2-4320-9456-0d3024fc51fa
md"""
Let's just show $f(x)$ works correctly:
"""

# ╔═╡ f45a5ec9-5f81-4d39-af44-f5bb51d71745
f.(x)

# ╔═╡ 8e81345b-c924-4158-89a5-8cedef4de82f
dfDx.(f, x)

# ╔═╡ 1987649e-070a-4815-b96e-aa7aaec8ec1e
md"""
So we can confirm math works. Hooray! Yippee!
"""

# ╔═╡ 630d0f96-2684-43d4-8525-0512bd81686f
md"""
[^1]: Of course, it's worth noting that this is only an *approximation* of an actual 
    derivative. For a realistic derivative, we take the limit where $h$ is going to 
    zero, like this:
    ```math
	\frac{d f(x)}{dx} = \lim_{h\rightarrow 0} \frac{f(x + h) - f(x)}{h}
	```
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
FiniteDifferences = "26cc04aa-876d-5657-8c51-4c34ba976000"

[compat]
FiniteDifferences = "~0.12.26"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.2"
manifest_format = "2.0"
project_hash = "55302db3ffea1b4210488bda91016e3bf95754c6"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "c6d890a52d2c4d55d326439580c3b8d0875a77d9"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.15.7"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "7a60c856b9fa189eb34f5f8a6f6b5529b7942957"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.6.1"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.FiniteDifferences]]
deps = ["ChainRulesCore", "LinearAlgebra", "Printf", "Random", "Richardson", "SparseArrays", "StaticArrays"]
git-tree-sha1 = "3f605dd6db5640c5278f2551afc9427656439f42"
uuid = "26cc04aa-876d-5657-8c51-4c34ba976000"
version = "0.12.26"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Richardson]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "e03ca566bec93f8a3aeb059c8ef102f268a38949"
uuid = "708f8203-808e-40c0-ba2d-98a6953ed40d"
version = "1.4.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "StaticArraysCore", "Statistics"]
git-tree-sha1 = "6aa098ef1012364f2ede6b17bf358c7f1fbe90d4"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.5.17"

[[deps.StaticArraysCore]]
git-tree-sha1 = "6b7ba252635a5eff6a0b0664a41ee140a1c9e72a"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.0"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"
"""

# ╔═╡ Cell order:
# ╟─644014dc-c673-11ed-2718-338302e7d11a
# ╠═55f37518-5bc3-486a-937c-de2a0264a7bb
# ╟─34197012-0c76-463f-b758-8aa962c0d3e3
# ╠═831399d1-f493-44a2-bff0-f01e121fe3ad
# ╟─36d9e509-2706-4722-bd29-9200b56f5984
# ╠═386f6e57-5e1f-4849-8b70-859ba51bd3e6
# ╠═8e1c1196-e38d-469f-9329-09e917c6d8ba
# ╠═beb2f9fe-78e5-4352-8c6a-efe97086e833
# ╠═005bcc58-f13b-4bcc-ac8c-a10c1a8607f8
# ╠═3266b548-3ac2-4320-9456-0d3024fc51fa
# ╠═f45a5ec9-5f81-4d39-af44-f5bb51d71745
# ╠═8e81345b-c924-4158-89a5-8cedef4de82f
# ╠═1987649e-070a-4815-b96e-aa7aaec8ec1e
# ╟─630d0f96-2684-43d4-8525-0512bd81686f
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
