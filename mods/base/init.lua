minetest.register_node("base:stone", {
  description = "Stone",
  tiles = {"stone.png"},
  is_ground_content = true,
  groups = {cracky = 3, stone=1}
})

minetest.register_node("base:grass", {
  description = "Grass",
  tiles = {"grass_top.png", "dirt.png",
           {name = "dirt.png^grass_side.png", tileable_vertical=false}},
  is_ground_content = true,
  groups = {crumbly = 1}
})

minetest.register_node("base:dirt", {
  description = "Dirt",
  tiles = {"dirt.png"},
  is_ground_content = true,
  groups = {crumbly = 1}
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

-- Resources
minetest.register_node("base:stone_resource", {
  drawtype = "nodebox",
  tiles = {"stone_resource.png"},
  paramtype = "light",
  node_box = {
	 type = "fixed",
	   fixed = {
		  {-0.5000, -0.5000, -0.5000, 0.5000, 0.000, 0.5000},
		  {-0.4375, 0.000, -0.4375, 0.4375, 0.2500, 0.4375},
		  {-0.3750, 0.2500, -0.3750, 0.3750, 0.3750, 0.3750},
		  {-0.3125, 0.3750, -0.3125, 0.3125, 0.5000, 0.3125}
	   }
    }
})

minetest.register_node("base:iron_resource", {
  drawtype = "nodebox",
  tiles = {"iron_resource.png"},
  paramtype = "light",
  node_box = {
	type = "fixed",
	  fixed = {
		 {-0.5000, -0.5000, -0.5000, 0.5000, 0.000, 0.5000},
		 {-0.4375, 0.000, -0.4375, 0.4375, 0.2500, 0.4375},
		 {-0.3750, 0.2500, -0.3750, 0.3750, 0.3750, 0.3750},
		 {-0.3125, 0.3750, -0.3125, 0.3125, 0.5000, 0.3125},
		 {-0.1875, 0.3125, -0.4375, -0.06250, 0.4375, -0.3125},
		 {-0.5000, 0.1875, -0.06250, -0.3750, 0.3125, 0.06250},
		 {0.3125, 0.2500, 0.1250, 0.4375, 0.3750, 0.2500},
		 {-0.1875, 0.1875, 0.3750, -0.06250, 0.3125, 0.5000}
	  }
  }
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
minetest.register_alias("mapgen_dirt", "base:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "base:grass")	

-- Add pickaxe to player inventory at start
minetest.register_on_newplayer(function(player)
  local inv = player:get_inventory()
  inv:add_item("main", "base:pickaxe")
  inv:add_item("main", "base:stone_resource")
  inv:add_item("main", "base:iron_resource")
  inv:add_item("main", "base:dirt")
  inv:add_item("main", "base:grass")
end)
