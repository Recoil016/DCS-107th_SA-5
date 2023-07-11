declare_plugin("107thModdedSA5",
{
installed		= true,
displayName		= _("107th Modded SA-5"),
shortName		= "107thModdedSA5",
state			= "installed",
developerName	= "Recoil016 and Whiskey11",
developerLink	= "https://github.com/Recoil016",
version			= "1.0.0",
info			= _("Fixes ED's blind SA-5 by replacing Tin Shield with literally anything else"),
})

local function vehicle_file(f)
	if dofile(current_mod_path..f) then
		error("can't load file "..f)
		return
	end
	if(GT) then
		GT.shape_table_data =
		{
			{
				file  	    = GT.visual.shape;
				username    = GT.Name;
				desrt       = GT.visual.shape_dstr;
			    classname 	= "lLandVehicle";

				positioning = GT.positioning or "BYNORMAL";

				life		= GT.life or 6;
			},
			{
				name  = GT.visual.shape_dstr;
				file  = GT.visual.shape_dstr;
			},
		}
		GT.MaxSpeed = GT.chassis and GT.chassis.max_road_velocity and (GT.chassis.max_road_velocity * 3.6)
		add_surface_unit(GT)
		GT = nil;
	else
		error("GT empty in file "..f)
	end;
end

--SA-5 Fixed
vehicle_file("/Database/Vehicle/S-200 Square Pair tr.lua")
vehicle_file("/Database/Vehicle/S-200 Launcher.lua")


plugin_done()