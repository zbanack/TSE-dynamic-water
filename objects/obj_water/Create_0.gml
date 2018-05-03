/*
 * Sunburst Effect
 * @author Zack Banack, The Step Event
 * https://zackbanack.com
 * http://TheStepEvent.com
 * May 2, 2018
 *
 * Associated YouTube video: https://youtu.be/LG3wocqjC-0
 *
 * Huge credit to Michael Hoffman for his original C# & XNA tutorial on this:
 * https://gamedevelopment.tutsplus.com/tutorials/make-a-splash-with-dynamic-2d-water-effects--gamedev-236
 */
 
bodyX = x;				// top-left x-pos
bodyY = y;				// top-right y-pos
bodyWidth = 800;		// hor span of body
bodyHeight = 250;		// vert span of body

columns = 10;			// springs
columnWidth = (bodyWidth / columns);

// define columns (springs), indexes in misc arrays
for(var i = 0; i < columns; i++) {
	// height will eventually settle at targetHeight, speed is acceleration
	// https://www.youtube.com/watch?v=vewwP8Od_7s 
	Height[i] = bodyHeight;
	TargetHeight[i] = bodyHeight;
	Speed[i] = 0;
	
	leftDelta[i] = 0;	// difference between i and (i - 1) spring's height
	rightDelta[i] = 0;	// difference between i and (i + 1) spring's height
}

Dampening = 0.025;		// lower = longer spring oscillation
Tension = 0.025;		// higher = more "stiff", lower = looser and more "springy"
Spread = 0.1;			// higher = waves spread fast & more "jello"-like

passes = 4;				// pulls on neighbors per game step