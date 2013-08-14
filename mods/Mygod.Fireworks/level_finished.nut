/*
function setupPreFinish(particleSystem)
{
	local m = Model();
	
	local mutableFlags      = FLAG_NONE;
	local randomFlags       = FLAG_NONE;
	local interpolatedFlags = FLAG_TEXTURE_INDEX|FLAG_SIZE;
	local enabledFlags      = FLAG_ANGLE;
	m.construct(enabledFlags, mutableFlags, randomFlags, interpolatedFlags);
	
	m.setParam(PARAM_ANGLE, 0.785375);
	
	m.addEntryRange(PARAM_SIZE, 0.0, 5.0, 15.0);
	m.addEntry(     PARAM_SIZE, 1.0, 0.0);
	
	m.addEntry(PARAM_TEXTURE_INDEX, 0, 0);
	m.addEntry(PARAM_TEXTURE_INDEX, 0.033, 13);
	m.enableLooping(PARAM_TEXTURE_INDEX, true);
	

	m.setLifeTime(1.3, 1.6);
	
	local maxparticles = 50;
	
	// Emitter settings
	//local zone = Point();
	//zone.setPosition(0.0, 0.0, 0.0);
	local zone = AABox();
	zone.setPosition(0.0, 5.0, 0.0);
	zone.setDimension(35, 35, 35);
	
	local normalzone = Plane();
	normalzone.setNormal(0,1,0);
	
	local e = NormalEmitter();
	e.setTank(maxparticles);
	e.setFlow(maxparticles * 15);
	e.setZone(zone, false);
	e.setNormalZone(normalzone);
	e.setForce(0, 25);
	
	// Renderer
	local r = QuadRenderer();
	r.setScale(1, 1);
	r.setTexture("rainbowcube", "textures");
	r.setAtlasDimensions(13, 3);

	r.setOrientation(CAMERA_PLANE_ALIGNED);
	
	// Group settings
	local g = Group();
	g.construct(m, maxparticles);
	g.addEmitter(e);
	g.setRenderer(r);

	g.addModifier(Rotator());

	particleSystem.addGroup(g);
}
*/

function setupFinish(particleSystem)
{
	local m = Model();
	
	local mutableFlags      = FLAG_NONE;
	local randomFlags       = FLAG_SIZE;
	local interpolatedFlags = FLAG_TEXTURE_INDEX|FLAG_MASS;
	local enabledFlags      = FLAG_ANGLE;
	m.construct(enabledFlags, mutableFlags, randomFlags, interpolatedFlags);
	
	m.setParam(PARAM_ANGLE, 0.785375);
	
	//m.setParamRange(PARAM_TEXTURE_INDEX, 0, 12);
	m.setParamRange(PARAM_SIZE, 1.0, 10.0);
	
	//m.setType(PARAM_ROTATION_SPEED, INTERPOLATOR_VELOCITY, 0);
	m.addEntry(PARAM_TEXTURE_INDEX, 0, 0);
	m.addEntry(PARAM_TEXTURE_INDEX, 0.033, 13);
	//m.setOffsetXVariation(PARAM_TEXTURE_INDEX, 13);
	m.enableLooping(PARAM_TEXTURE_INDEX, true);
	/*
	m.addEntry(PARAM_MASS, 0,   1);
	m.addEntry(PARAM_MASS, 2.0, 0);
	*/
	m.setLifeTime(1.1, 4.3);
	
	local maxparticles = 100;
	
	// Emitter settings

	local zone = AABox();
	zone.setPosition(0.0, 0.0, 0.0);
	zone.setDimension(30, 15, 30);

	local e = StraightEmitter();
	e.setDirection(0.0, 1.0, 0.0);
	e.setTank(maxparticles);
	e.setFlow(60);
	e.setZone(zone, false);
	//e.setForce(100, 400);
	e.setForce(10, 40);
	
	// Renderer
	local r = QuadRenderer();
	r.setScale(1, 1);
	r.setTexture("rainbowcube", "textures");
	r.setAtlasDimensions(13, 3);
	r.setOrientation(CAMERA_PLANE_ALIGNED);//);DIRECTION_ALIGNED
	//r.setOrientationEx(LOOK_AXIS, UP_AXIS, LOCK_UP);
	//r.setUpVector(  0, 0, 1);
	//r.setLookVector(0, 1, 0);
	
	local force = LinearForce();
	force.setForce(0.0, 180.0, 0.0);
	
	local vortex = Vortex();
	vortex.setAttractionSpeed(0.0, true);
	vortex.setRotationSpeed(1.0, true);
	vortex.setLocalToSystem(true);
	
	// Group settings
	local g = Group();
	g.construct(m, maxparticles);
	g.addEmitter(e);
	g.setRenderer(r);
	
	g.addModifier(force);
	g.addModifier(vortex);
	g.addModifier(Rotator());
	//g.setFriction(10.0);

	particleSystem.addGroup(g);
}

function setupFireworks(particleSystem, x, y, z)
{
    local m = Model();
	
	local mutableFlags      = FLAG_NONE;
	local randomFlags       = FLAG_NONE;
	local interpolatedFlags = FLAG_TEXTURE_INDEX|FLAG_MASS|FLAG_SIZE;
	local enabledFlags      = FLAG_ANGLE;
	m.construct(enabledFlags, mutableFlags, randomFlags, interpolatedFlags);
	
	m.setParam(PARAM_ANGLE, 0.785375);
	
	//m.setParamRange(PARAM_SIZE, 1.0, 10.0);
	m.addEntryRange(PARAM_SIZE, 0.0, 2, 0.5);//5.0, 15.0);
	m.addEntry(     PARAM_SIZE, 1.0, 0.0);
	
	m.addEntry(PARAM_TEXTURE_INDEX, 0, 0);
	m.addEntry(PARAM_TEXTURE_INDEX, 0.033, 13);
	m.enableLooping(PARAM_TEXTURE_INDEX, true);
	
	/**/
	m.addEntry(PARAM_MASS, 0,     1);
	m.addEntry(PARAM_MASS, 1.0, 0.1);
	/**/
	m.setLifeTime(15, 15);//0.1, 0.3);
	
	local maxparticles = 1024;//128;
	
	// Emitter settings
	/** /
	local zone = AABox();
	zone.setPosition(0.0, 0.0, 0.0);
	zone.setDimension(31, 31, 31);
	/** /
	local zone = Plane();
	planezone.setPosition(0.0, 0.0, 0.0);
	planezone.setNormal(0, 1, 0);
	/**/
	local zone = Point();
	zone.setPosition(x, y, z);
	
	local e = NormalEmitter();
	e.setTank(maxparticles);
	e.setFlow(maxparticles * 15);
	e.setZone(zone, false);
	e.setNormalZone(zone);
	e.setForce(100, 800);
	
	// Renderer
	local r = QuadRenderer();
	r.setScale(1, 1);
	r.setTexture("rainbowcube", "textures");
	r.setAtlasDimensions(13, 3);
	//r.setOrientation(FIXED_ORIENTATION);
	r.setOrientation(CAMERA_PLANE_ALIGNED);
    
    // Modifier
    local force = LinearForce();
	force.setForce(0.0, -200.0, 0.0);
	
	// Group settings
	local g = Group();
	g.construct(m, maxparticles);
	g.addEmitter(e);
    g.addModifier(force);
	g.setRenderer(r);
	g.setFriction(2);//7.0);
	
	/** /
	local stopzone = Sphere()
	stopzone.setRadius(30);
	/** /
	local stopzone = AABox()
	stopzone.setDimension(40,40,40);
	/** /
	local collision = Obstacle();
	collision.setBouncingRatio(-100000);
	//collision.setFriction(100);
	collision.setTrigger(OUTSIDE_ZONE);//);INTERSECT_ZONE
	collision.setZone(stopzone);
	collision.setLocalToSystem(true);
	g.addModifier(collision);
	/**/
	g.addModifier(Rotator());
	
	//g.enableSorting(true);

	particleSystem.addGroup(g);
}

function setup(particleSystem)
{
	//setupPreFinish(particleSystem);
	setupFinish(particleSystem);
    setupFireworks(particleSystem, 100, 0, 0);
    setupFireworks(particleSystem, -100, 0, 0);
    setupFireworks(particleSystem, 0, 0, -100);
    setupFireworks(particleSystem, 0, 0, 100);
}

/*
all flags and enums:

FLAG_NONE
FLAG_RED
FLAG_GREEN
FLAG_BLUE
FLAG_ALPHA
FLAG_SIZE
FLAG_MASS
FLAG_ANGLE
FLAG_TEXTURE_INDEX
FLAG_ROTATION_SPEED

PARAM_RED
PARAM_GREEN
PARAM_BLUE
PARAM_ALPHA
PARAM_SIZE
PARAM_MASS
PARAM_ANGLE
PARAM_TEXTURE_INDEX
PARAM_ROTATION_SPEED

INTERPOLATOR_LIFETIME
INTERPOLATOR_AGE
INTERPOLATOR_PARAM
INTERPOLATOR_VELOCITY  

BLENDING_NONE
BLENDING_ADD
BLENDING_ALPHA 
BLENDING_MULTIPLY

*/