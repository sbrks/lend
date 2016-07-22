# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



items = Item.create([
	[
	title: "Phantom 4 Quadcopter Drone",
	description: "The DJI Phantom 4 is the smartest flying camera DJI has ever created. Able to fly intelligently with a tap, automatically create seamless tracking shots, fly intelligently over or around obstacles and much more. Flying has never been this easy or as much fun. Auto takeoff and auto return home with GPS technology, makes controlling easy. App enables monitoring/camera operation easy Capture 4K ultra HD video at 30 fps, supported resolutions include: 12.0MP (4000x3000) photos. The f/2.8 lens with a broad field of view delivers crisp, clear images Gimbal stabilization technology, along with a hover function allows you to capture smooth, clean footage while the camera is in the air Use DJI director software with a built-in video editor to add music, text and more to your videos Sense And Avoid Obstacle sensors enable the Phantom 4 to sense and react to its environment.",
		image_url: "http://uncrate.com/p/2016/03/phantom-4.jpg"
	],
	[
	title: "Autel Robotics X-Star Premium Drone",
	description: "The X-Star Premium is a sophisticated yet amazingly easy-to-fly quadcopter designed for superb aerial imagery. The 4K camera and 3-axis gimbal can record crystal-clear, smooth Ultra HD videos or take 12-MP photos with HD Live View up to 1.2 miles away. This drone is ready to fly out of the box, and can be flown with or without the help of the free Starlink mobile app. Powered by an intelligent flight control system, dual GPS and GLONASS satellite navigation and aided by the Starpoint Positioning System, the drone stays safe and stable, even indoors or at low altitudes. Where other drones might become erratic or fly away when there is magnetic interference, the X-Star is equipped with our exclusive SecureFly technology to help your drone come back home safely.",
		image_url: "http://www.roboticgizmos.com/wp-content/uploads/2016/02/10/x-star-4k-drone.jpg"
	],
	[
	title: "Holy Stone X400C FPV RC Quadcopter Drone",
	description: "2.4g Technology Adopted for Anti-Interference, Even More Than One Quadcopter is Flying at The Same Time They Will Not Interfere With Each Other.",
		image_url: "http://www.onbestdeals.com/topratedquadcopters-com/wp-content/uploads/sites/34/2016/05/NEW-Holy-Stone-X400C-FPV-RC-Quadcopter-Drone-with-Wifi-Camera-Live-Video-One-Key-Return-Function-Headless-Mode-24GHz-4-Chanel-6-Axis-Gyro-RTF-Left-and-Right-Hand-Mode-Bundle-with-Goggles-0-0.jpg"
	], 
	[
		title: "Autel Robotics X-Star Premium Drone",
		description: "The X-Star Premium is a sophisticated yet amazingly easy-to-fly quadcopter designed for superb aerial imagery. The 4K camera and 3-axis gimbal can record crystal-clear, smooth Ultra HD videos or take 12-MP photos with HD Live View up to 1.2 miles away. This drone is ready to fly out of the box, and can be flown with or without the help of the free Starlink mobile app. Powered by an intelligent flight control system, dual GPS and GLONASS satellite navigation and aided by the Starpoint Positioning System, the drone stays safe and stable, even indoors or at low altitudes. Where other drones might become erratic or fly away when there is magnetic interference, the X-Star is equipped with our exclusive SecureFly technology to help your drone come back home safely.",
			image_url: ""
	], 
	[
		title: "Autel Robotics X-Star Premium Drone",
		description: "The X-Star Premium is a sophisticated yet amazingly easy-to-fly quadcopter designed for superb aerial imagery. The 4K camera and 3-axis gimbal can record crystal-clear, smooth Ultra HD videos or take 12-MP photos with HD Live View up to 1.2 miles away. This drone is ready to fly out of the box, and can be flown with or without the help of the free Starlink mobile app. Powered by an intelligent flight control system, dual GPS and GLONASS satellite navigation and aided by the Starpoint Positioning System, the drone stays safe and stable, even indoors or at low altitudes. Where other drones might become erratic or fly away when there is magnetic interference, the X-Star is equipped with our exclusive SecureFly technology to help your drone come back home safely.",
			image_url: ""
	],
	[
		title: "Autel Robotics X-Star Premium Drone",
		description: "The X-Star Premium is a sophisticated yet amazingly easy-to-fly quadcopter designed for superb aerial imagery. The 4K camera and 3-axis gimbal can record crystal-clear, smooth Ultra HD videos or take 12-MP photos with HD Live View up to 1.2 miles away. This drone is ready to fly out of the box, and can be flown with or without the help of the free Starlink mobile app. Powered by an intelligent flight control system, dual GPS and GLONASS satellite navigation and aided by the Starpoint Positioning System, the drone stays safe and stable, even indoors or at low altitudes. Where other drones might become erratic or fly away when there is magnetic interference, the X-Star is equipped with our exclusive SecureFly technology to help your drone come back home safely.",
			image_url: ""
		]
	])

users = User.create([
	[
		first_name: "Sam",
		last_name: "Brooks",
		username: "samiam",
		location:"San Francisco, CA"
	],
	[
		first_name: "Jill",
		last_name: "Dunne",
		username: "sodunne",
		location:"Oakland, CA"
	],
	[
		first_name: "Jack",
		last_name: "Classon",
		username: "keepingitclasson",
		location:"Brooklyn, NY"
	]
	])
