minetest.register_node("base:stone", {
  description = "stone",
  tiles = {"stone.png"},
  diggable = true
})

minetest.register_node("base:water", {
  description = "water",
  tiles = {"water.png"},
})

minetest.register_node("base:metal_ore", {
  description = "metal_ore",
  tiles = {"metal_ore.png"},
  diggable = true,
  on_dig = function (pos, node, digger) 
	minetest.set_node(pos, "base:stone")
	return true
  end
})

minetest.register_ore({
  ore_type = "scatter",
  ore = "base:metal_ore",
  wherein = "base:stone",
  clust_scarcity = 10*10*10,
  clust_num_ores = 2,
  clust_size = 3,
  y_min = -31000,
  y_max = 500,
  noise_threshold = 0,

})


-- Worldgen aliases
minetest.register_alias("mapgen_stone", "base:stone")
minetest.register_alias("mapgen_water_source", "base:water")

