extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var noise = OpenSimplexNoise.new()
	noise.period = 200
	noise.octaves = 8
	
	var plane_mesh = PlaneMesh.new()
	plane_mesh.size = Vector2(35,50)
	plane_mesh.subdivide_depth = 400
	plane_mesh.subdivide_width = 300
	
	var surface_tool = SurfaceTool.new()
	surface_tool.create_from(plane_mesh,0)
	
	var array_plane = surface_tool.commit()
	
	var data_tool = MeshDataTool.new()
	
	data_tool.create_from_surface(array_plane,0)
	
	for i in range(data_tool.get_vertex_count()):
		var vertex = data_tool.get_vertex(i)
		vertex.y = noise.get_noise_3d(vertex.x, vertex.y, vertex.z) * 30
		
		data_tool.set_vertex(i, vertex)
		
	for i in range(array_plane.get_surface_count()):
		array_plane.surface_remove(i)
	
	data_tool.commit_to_surface(array_plane)
	surface_tool.begin(Mesh.PRIMITIVE_TRIANGLES)
	surface_tool.create_from(array_plane, 0)
	surface_tool.generate_normals()
	
	var mesh_instance = MeshInstance.new()
	mesh_instance.mesh = surface_tool.commit()
	mesh_instance.set_surface_material(0,load("res://Materials/terrain.material"))
	mesh_instance.create_trimesh_collision()
	add_child(mesh_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
