package vdom;

import js.html.Event;

using tink.CoreApi;

typedef Style = Dynamic;

abstract Ext(String) from String to String {
  @:from static inline function ofBool(b:Bool):Ext
    return 
      if (b) '';
      else js.Lib.undefined;
}

typedef Attr = {
  @:optional var key(default, null):Any;
  @:optional var className(default, null):String;
	@:optional var id(default, null):String;
	@:optional var title(default, null):String;
	@:optional var lang(default, null):String;
	@:optional var dir(default, null):String;
	
  @:optional var attributes(default, null):Dynamic<Ext>;
  
	@:optional var hidden(default, null):Bool;
	@:optional var tabIndex(default, null):Int;
	@:optional var accessKey(default, null):String;
	@:optional var accessKeyLabel(default, null):String;
	@:optional var draggable(default, null):Bool;
	@:optional var contentEditable(default, null):Bool;
	@:optional var spellcheck(default, null):Bool;
	@:optional var style(default, null):Style;
  
	@:optional var onwheel(default, null):Callback<Event>;
	@:optional var oncopy(default, null):Callback<Event>;
	@:optional var oncut(default, null):Callback<Event>;
	@:optional var onpaste(default, null):Callback<Event>;
	@:optional var onabort(default, null):Callback<Event>;
	@:optional var onblur(default, null):Callback<Event>;
	@:optional var onfocus(default, null):Callback<Event>;
	@:optional var oncanplay(default, null):Callback<Event>;
	@:optional var oncanplaythrough(default, null):Callback<Event>;
	@:optional var onchange(default, null):Callback<Event>;
	@:optional var onclick(default, null):Callback<Event>;
	@:optional var oncontextmenu(default, null):Callback<Event>;
	@:optional var ondblclick(default, null):Callback<Event>;
	@:optional var ondrag(default, null):Callback<Event>;
	@:optional var ondragend(default, null):Callback<Event>;
	@:optional var ondragenter(default, null):Callback<Event>;
	@:optional var ondragleave(default, null):Callback<Event>;
	@:optional var ondragover(default, null):Callback<Event>;
	@:optional var ondragstart(default, null):Callback<Event>;
	@:optional var ondrop(default, null):Callback<Event>;
	@:optional var ondurationchange(default, null):Callback<Event>;
	@:optional var onemptied(default, null):Callback<Event>;
	@:optional var onended(default, null):Callback<Event>;
	@:optional var oninput(default, null):Callback<Event>;
	@:optional var oninvalid(default, null):Callback<Event>;
	@:optional var onkeydown(default, null):Callback<Event>;
	@:optional var onkeypress(default, null):Callback<Event>;
	@:optional var onkeyup(default, null):Callback<Event>;
	@:optional var onload(default, null):Callback<Event>;
	@:optional var onloadeddata(default, null):Callback<Event>;
	@:optional var onloadedmetadata(default, null):Callback<Event>;
	@:optional var onloadstart(default, null):Callback<Event>;
	@:optional var onmousedown(default, null):Callback<Event>;
	@:optional var onmouseenter(default, null):Callback<Event>;
	@:optional var onmouseleave(default, null):Callback<Event>;
	@:optional var onmousemove(default, null):Callback<Event>;
	@:optional var onmouseout(default, null):Callback<Event>;
	@:optional var onmouseover(default, null):Callback<Event>;
	@:optional var onmouseup(default, null):Callback<Event>;
	@:optional var onpause(default, null):Callback<Event>;
	@:optional var onplay(default, null):Callback<Event>;
	@:optional var onplaying(default, null):Callback<Event>;
	@:optional var onprogress(default, null):Callback<Event>;
	@:optional var onratechange(default, null):Callback<Event>;
	@:optional var onreset(default, null):Callback<Event>;
	@:optional var onresize(default, null):Callback<Event>;
	@:optional var onscroll(default, null):Callback<Event>;
	@:optional var onseeked(default, null):Callback<Event>;
	@:optional var onseeking(default, null):Callback<Event>;
	@:optional var onselect(default, null):Callback<Event>;
	@:optional var onshow(default, null):Callback<Event>;
	@:optional var onstalled(default, null):Callback<Event>;
	@:optional var onsubmit(default, null):Callback<Event>;
	@:optional var onsuspend(default, null):Callback<Event>;
	@:optional var ontimeupdate(default, null):Callback<Event>;
	@:optional var onvolumechange(default, null):Callback<Event>;
	@:optional var onwaiting(default, null):Callback<Event>;
	@:optional var onpointercancel(default, null):Callback<Event>;
	@:optional var onpointerdown(default, null):Callback<Event>;
	@:optional var onpointerup(default, null):Callback<Event>;
	@:optional var onpointermove(default, null):Callback<Event>;
	@:optional var onpointerout(default, null):Callback<Event>;
	@:optional var onpointerover(default, null):Callback<Event>;
	@:optional var onpointerenter(default, null):Callback<Event>;
	@:optional var onpointerleave(default, null):Callback<Event>;
	@:optional var ongotpointercapture(default, null):Callback<Event>;
	@:optional var onlostpointercapture(default, null):Callback<Event>;
	@:optional var onfullscreenchange(default, null):Callback<Event>;
	@:optional var onfullscreenerror(default, null):Callback<Event>;
	@:optional var onpointerlockchange(default, null):Callback<Event>;
	@:optional var onpointerlockerror(default, null):Callback<Event>;
	@:optional var onerror(default, null):Callback<Event>;
	@:optional var ontouchstart(default, null):Callback<Event>;
	@:optional var ontouchend(default, null):Callback<Event>;
	@:optional var ontouchmove(default, null):Callback<Event>;
	@:optional var ontouchcancel(default, null):Callback<Event>;
}