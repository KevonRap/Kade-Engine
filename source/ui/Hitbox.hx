package ui;

import flixel.graphics.FlxGraphic;
import flixel.addons.ui.FlxButtonPlus;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets;
import flixel.util.FlxDestroyUtil;
import flixel.ui.FlxButton;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.frames.FlxFrame;
import flixel.ui.FlxVirtualPad;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

// copyed from flxvirtualpad
class Hitbox extends FlxSpriteGroup
{
    public var hitbox:FlxSpriteGroup;


    public var left:FlxButton;
    public var down:FlxButton;
    public var up:FlxButton;
    public var right:FlxButton;
    
    public function new(X:Int, Y:Int)
    {
        super(X, Y);
        //add graphic
        addui();
    }

    public function addui()
    {
        hitbox = new FlxSpriteGroup();
        hitbox.scrollFactor.set();

        var hitbox_hint:FlxSprite = new FlxSprite(0, 0).loadGraphic('assets/shared/images/hitbox/hitbox_hint.png');

        hitbox_hint.alpha = 0.3;

        add(hitbox_hint);


        hitbox.add(add(left = createhitbox(0, "left")));

        hitbox.add(add(down = createhitbox(320, "down")));

        hitbox.add(add(up = createhitbox(640, "up")));

        hitbox.add(add(right = createhitbox(960, "right")));

    }

    public function createhitbox(X:Float, framestring:String) {
        var button = new FlxButton(X, 0);
        var frames = FlxAtlasFrames.fromSparrow('assets/shared/images/hitbox/hitbox.png', 'assets/shared/images/hitbox/hitbox.xml');
        

        button.loadGraphic(FlxGraphic.fromFrame(frames.getByName(framestring)));

        button.alpha = 0;

    
        button.onDown.callback = function (){
            FlxTween.num(0, 0.75, .1, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        };

        button.onUp.callback = function (){
            FlxTween.num(0.75, 0, .2, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        }

        //button.onOver.callback = function (){}

        
        button.onOut.callback = function (){
            FlxTween.num(button.alpha, 0, .2, {ease: FlxEase.circInOut}, function (a:Float) { button.alpha = a; });
        }

        return button;
    }

    override public function destroy():Void
        {
            super.destroy();
    
            left = null;
            down = null;
            up = null;
            right = null;
        }
}