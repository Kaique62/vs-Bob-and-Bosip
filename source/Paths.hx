package;

import flixel.FlxG;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.display.BitmapData;
import openfl.display3D.textures.Texture;
import openfl.media.Sound;
import openfl.system.System;
import openfl.utils.AssetType;
import openfl.utils.Assets as OpenFlAssets;
import openfl.Lib;

class Paths
{
	inline public static var SOUND_EXT = #if web "mp3" #else "ogg" #end;

	static var currentLevel:String;

	public static var currentTrackedAssets:Map<String, FlxGraphic> = [];
	public static var currentTrackedTextures:Map<String, Texture> = [];
	public static var currentTrackedSounds:Map<String, Sound> = [];

	public static var localTrackedAssets:Array<String> = [];
	
	static public function setCurrentLevel(name:String)
	{
		currentLevel = name.toLowerCase();
	}

	static function getPath(file:String, type:AssetType, library:Null<String>)
	{
		if (library != null)
			return getLibraryPath(file, library);

		if (currentLevel != null)
		{
			var levelPath = getLibraryPathForce(file, currentLevel);
			if (OpenFlAssets.exists(levelPath, type))
				return levelPath;

			levelPath = getLibraryPathForce(file, "shared");
			if (OpenFlAssets.exists(levelPath, type))
				return levelPath;
		}

		return getPreloadPath(file);
	}

	static public function getLibraryPath(file:String, library = "preload")
	{
		return if (library == "preload" || library == "default") getPreloadPath(file); else getLibraryPathForce(file, library);
	}

	inline static function getLibraryPathForce(file:String, library:String)
	{
		return '$library:assets/$library/$file';
	}

	inline static function getPreloadPath(file:String)
	{
		return 'assets/$file';
	}

	inline static public function file(file:String, type:AssetType = TEXT, ?library:String)
	{
		return getPath(file, type, library);
	}

	inline static public function lua(key:String,?library:String)
	{
		return getPath('data/$key.lua', TEXT, library);
	}

	inline static public function luaImage(key:String, ?library:String)
	{
		return getPath('data/$key.png', IMAGE, library);
	}

	inline static public function txt(key:String, ?library:String)
	{
		return getPath('data/$key.txt', TEXT, library);
	}

	inline static public function xml(key:String, ?library:String)
	{
		return getPath('data/$key.xml', TEXT, library);
	}

	inline static public function json(key:String, ?library:String)
	{
		return getPath('data/$key.json', TEXT, library);
	}

	static public function sound(key:String, ?library:String)
	{
		return getPath('sounds/$key.$SOUND_EXT', SOUND, library);
	}

	inline static public function soundRandom(key:String, min:Int, max:Int, ?library:String)
	{
		return sound(key + FlxG.random.int(min, max), library);
	}

	inline static public function music(key:String, ?library:String)
	{
		return getPath('music/$key.$SOUND_EXT', MUSIC, library);
	}

	inline static public function voices(song:String)
	{
		var songLowercase = StringTools.replace(song, " ", "-").toLowerCase();
			switch (songLowercase) {
				case 'dad-battle': songLowercase = 'dadbattle';
				case 'philly-nice': songLowercase = 'philly';
			}
		return 'songs:assets/songs/${songLowercase}/Voices.$SOUND_EXT';
	}

	inline static public function voicesMenu(song:String, char:String)
	{
		var songLowercase = StringTools.replace(song, " ", "-").toLowerCase();
			switch (songLowercase) {
				case 'dad-battle': songLowercase = 'dadbattle';
				case 'philly-nice': songLowercase = 'philly';
			}
		return 'songs:assets/songs/${songLowercase}/menu/' + char + '.$SOUND_EXT';
	}

	inline static public function voicesEX(song:String)
	{
		var songLowercase = StringTools.replace(song, " ", "-").toLowerCase();
			switch (songLowercase) {
				case 'dad-battle': songLowercase = 'dadbattle';
				case 'philly-nice': songLowercase = 'philly';
			}
		return 'songs:assets/songs/${songLowercase}/VoicesEX.$SOUND_EXT';
	}

	inline static public function voicesEXMenu(song:String, char:String)
	{
		var songLowercase = StringTools.replace(song, " ", "-").toLowerCase();
			switch (songLowercase) {
				case 'dad-battle': songLowercase = 'dadbattle';
				case 'philly-nice': songLowercase = 'philly';
			}
		return 'songs:assets/songs/${songLowercase}/menuEX/' + char + '.$SOUND_EXT';
	}

	inline static public function voicesEXcharacter(song:String, char:String)
	{
		var songLowercase = StringTools.replace(song, " ", "-").toLowerCase();
			switch (songLowercase) {
				case 'dad-battle': songLowercase = 'dadbattle';
				case 'philly-nice': songLowercase = 'philly';
			}
		return 'songs:assets/songs/${songLowercase}/VoicesEX' + char + '.$SOUND_EXT';
	}

	inline static public function inst(song:String)
	{
		var songLowercase = StringTools.replace(song, " ", "-").toLowerCase();
			switch (songLowercase) {
				case 'dad-battle': songLowercase = 'dadbattle';
				case 'philly-nice': songLowercase = 'philly';
			}
		return 'songs:assets/songs/${songLowercase}/Inst.$SOUND_EXT';
	}

	inline static public function instEX(song:String)
	{
		var songLowercase = StringTools.replace(song, " ", "-").toLowerCase();
			switch (songLowercase) {
				case 'dad-battle': songLowercase = 'dadbattle';
				case 'philly-nice': songLowercase = 'philly';
			}
		return 'songs:assets/songs/${songLowercase}/InstEX.$SOUND_EXT';
	}

	inline static public function instEXcheck(song:String)
	{
		var songLowercase = StringTools.replace(song, " ", "-").toLowerCase();
			switch (songLowercase) {
				case 'dad-battle': songLowercase = 'dadbattle';
				case 'philly-nice': songLowercase = 'philly';
			}
		return 'assets/songs/${songLowercase}/InstEX.$SOUND_EXT';
	}

	inline static public function instcheck(song:String)
	{
		var songLowercase = StringTools.replace(song, " ", "-").toLowerCase();
			switch (songLowercase) {
				case 'dad-battle': songLowercase = 'dadbattle';
				case 'philly-nice': songLowercase = 'philly';
			}
		return 'assets/songs/${songLowercase}/Inst.$SOUND_EXT';
	}

	inline static public function image(key:String, ?library:String, ?gpurender:Bool = false):FlxGraphic
	{
		return returnGraphic(key, library, gpurender);
	}

	inline static public function imageFromCache(key:String, ?library:String):Dynamic
	{
		return ImageCache.get(getPath('images/$key.png', IMAGE, library));// getPath('images/$key.png', IMAGE, library);

	}

	inline static public function font(key:String)
	{
		return 'assets/fonts/$key';
	}

	inline static public function getSparrowAtlas(key:String, ?library:String)
	{
		return FlxAtlasFrames.fromSparrow(image(key, library, true), file('images/$key.xml', library));
	}
	
	inline static public function getSparrowAtlasFromCache(key:String, ?library:String)
	{
		return FlxAtlasFrames.fromSparrow(image(key, library, true), file('images/$key.xml', library));
	}
	inline static public function getPackerAtlas(key:String, ?library:String)
	{
		return FlxAtlasFrames.fromSpriteSheetPacker(image(key, library, true), file('images/$key.txt', library));
	}

	// credit to saw and sirox
	public static function returnGraphic(key:String, ?library:String, ?gpurender:Bool = false):FlxGraphic
		{
			var path:String = getPath('images/$key.png', IMAGE, library);
			if (OpenFlAssets.exists(path, IMAGE))
			{
				if (!currentTrackedAssets.exists(path))
				{
					var newGraphic:FlxGraphic = null;
					var bitmap:BitmapData = OpenFlAssets.getBitmapData(path);
	
					if (gpurender)
					{
						switch (FlxG.save.data.render)
						{
							case 1:
								var texture = FlxG.stage.context3D.createTexture(bitmap.width, bitmap.height, BGRA, true);
								texture.uploadFromBitmapData(bitmap);
								currentTrackedTextures.set(path, texture);
								bitmap.dispose();
								bitmap.disposeImage();
								bitmap = null;
								newGraphic = FlxGraphic.fromBitmapData(BitmapData.fromTexture(texture), false, path);
							case 2:
								var texture = Lib.current.stage.context3D.createTexture(bitmap.width, bitmap.height, BGRA, true);
								texture.uploadFromBitmapData(bitmap);
								currentTrackedTextures.set(path, texture);
								bitmap.dispose();
								bitmap.disposeImage();
								bitmap = null;
								newGraphic = FlxGraphic.fromBitmapData(BitmapData.fromTexture(texture), false, path);
							default:
								newGraphic = FlxGraphic.fromBitmapData(bitmap, false, path);
						}
					}
					else
						newGraphic = FlxGraphic.fromBitmapData(bitmap, false, path);
	
					newGraphic.persist = true;
					currentTrackedAssets.set(path, newGraphic);
				}
	
				localTrackedAssets.push(path);
				return currentTrackedAssets.get(path);
			}
	
			trace('oh no its returning null NOOOO');
			return null;
		}
}