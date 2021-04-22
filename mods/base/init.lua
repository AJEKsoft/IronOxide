minetest.register_node("base:stone", {
  description = "Stone",
  tiles = {"stone.png"},
  is_ground_content = true,
  groups = {cracky = 3, stone=1}
})

minetest.register_node("base:water", {
  description = "Water",
  drawtype = "liquid",
  waving = 3,
  walkable = false,
  pointable = false,
  diggable = false,
  is_ground_content = false,
  drowning = 1,
  liquid_viscosity = 1,
  use_texture_alpha = "blend",
  tiles = {"water.png"},
})

-- Some basic tools
minetest.register_tool("base:pickaxe", {
  description = "Pickaxe",
  inventory_image = "pickaxe.png",
  tool_capabilities = {
    full_punch_interval = 3,
	 max_drop_level = 1,
	 groupcaps = {
	   cracky = {
		  maxlevel = 3,
		  uses = 100,
		  times = { [1]=1.60, [2]=1.20, [3]=0.80 }
      }
    }
  }
})

-- Worldgen aliases
minetest.register_alias("mapgen_stone", "base:stone")
minetest.register_alias("mapgen_water_source", "base:water")

-- Add pickaxe to player inventory at start
minetest.register_on_newplayer(function(player)
  local inv = player:get_inventory()
  inv:add_item("main", "base:pickaxe")
end)
