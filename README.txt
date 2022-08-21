
===============================================
=== Communication and Radar Channel Dataset ===
===============================================

This dataset provides both communication and radar channels from raytracing simulations in a V2I scenario.

In each scenario, there is a roadside unit (RSU) with a communication transmitter and a radar transmitter. There are 4 "active" vehicles, which are equipped with 4 communication receivers and 4 radar receivers. The designation between "transmitters" and "receivers" is only for ray-tracing optimization purposes, since channel reciprocity is assumed.

In the coordinate system, the x-axis travels along the roadway, the y-axis travels perpendicular to the roadway, and the z-axis travels vertically. Rotations are denoted in degrees relative to the x-axis, with positive rotations denoting counter-clockwise rotation when viewed from the top-down. Distances are in meters and rotations are in degrees.

On the RSU, the communication array is located at (120,-21,5) and the passive radar array is located at (120,-21,5.1). The lane centers lay at y={-8.75,-5.25,-1.75}. Vehicles are placed randomly along these lanes in accordance with 3GPP recommendations. 4 of the randomly placed vehicles are selected as the active vehicles. Relative to the vehicle centers, the coordinates of the communication arrays are:
	Front: (2.5,0,1.6) with azimuth rotation of 0
	Back: (-2.5,0,1.6) with azimuth rotation of 180
	Right: (0,-1,1.6) with azimuth rotation of 270
	Left: (0,1,1.6) with azimuth rotation of 90

The coordinates of the radar arrays are:
	FrontRight: (2.5,-1,0.5) with azimuth rotation of -80
	BackRight: (-2.5,-1,0.5) with azimuth rotation of -100
	BackLeft: (-2.5,1,0.5) with azimuth rotation of 100
	FrontLeft: (2.5,1,0.5) with azimuth rotation of 80

This dataset provides 3 files:
	comm.h5 - Data defining the communication channels
	rad.h5 - Data defining the radar channels
	gen_channel_ray_tracing_radcom.m - An example MATLAB script for generating channels using the data

The data is stored with dimensions: [N_params, N_receivers, N_ray_max, N_sim].
N_params=6, N_receivers=16, N_ray_max=25, and N_sim=4000

The params are: 
	[Gain(dB), TOA(s), AoD(deg), AoA(deg), LOS(bool), Phase(deg)]

The receivers for comm.h5 are:
	[Veh1_Front, Veh1_Back, Veh1_Right, Veh1_Left, Veh2_Front, Veh2_Back, Veh2_Right, Veh2_Left, ...]
The receivers for rad.h5 are:
	[Veh1_FrontRight, Veh1_BackRight, Veh1_BackLeft, Veh1_FrontLeft, Veh2_FrontRight, Veh2_BackRight, Veh2_BackLeft, ...]

The rays correspond to individual paths in the raytracing output. Up to 25 rays were simulated.

The simulation corresponds to each instance, i.e. random placement of vehicles in the environment.
