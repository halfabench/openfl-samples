package;



import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.Lib;
import openfl.display.FPS;
import openfl.Assets;
import tests.*;


/**
 * @author Joshua Granick
 * @author Iain Lobb
 * @author Philippe Elsass
 */
class BunnyMark extends Sprite {
	
	
	private var background:Background;
	private var fps:FPS;
	
	var active : Bool;
	
	public function new () {
		
		super ();
		
		Env.setup ();
		Lib.current.scaleX = Lib.current.scaleY = Env.screenDensity;
		
		background = new Background ();
		background.texture = Assets.getBitmapData ("assets/grass.png");
		background.cols = 8;
		background.rows = 12;
		background.x = -50;
		background.y = -50;
		background.setSize (Env.width + 100, Env.height + 100);
		addChild (background);
		
		addChild (new TilesheetTest ());
		//addChild (new DrawRectTest ()); // Does not support alpha or rotation
		//addChild (new BitmapTest ());
		//addChild (new DrawTrianglesTest ()); // Does not support rotation
		//addChild (new CopyPixelsTest ());
		//addChild (new NoBatchTilesheetTest ());
		
		fps = new FPS ();
		addChild (fps);
		
		fps.addEventListener (MouseEvent.CLICK, fps_onClick);
		stage.addEventListener (Event.RESIZE, stage_onResize);

		active = true;
        stage.addEventListener(MouseEvent.CLICK, onClick);
        stage.addEventListener(Event.ACTIVATE, onActivate);
        stage.addEventListener(Event.DEACTIVATE, onDeactivate);		
		
		
	}
	
	
	
	
	// Event Handlers
	
	
	

    function onActivate(e:Event){
		trace( "onActivate" );
    }

    function onDeactivate(e:Event){
		trace( "onDeactivate" );
    }


	function onClick( e ) {
		for( i in 0...5000 ) {
			active = !active;
			stage.__setActive( active );
		}
		trace( "active?=" + active );
	}
	
	
	
	private function fps_onClick (event:MouseEvent):Void {
		
		stage.frameRate = 90 - stage.frameRate;
		
	}
	
	
	private function stage_onResize (event:Event):Void {
		
		if (Env.width > Env.height) {
			
			background.cols = 12;
			background.rows = 8;
			
		} else {
			
			background.cols = 8;
			background.rows = 12;
			
		}
		
		background.setSize (Env.width + 100, Env.height + 100);
		
	}
	
	
}
