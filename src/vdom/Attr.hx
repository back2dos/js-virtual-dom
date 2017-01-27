package vdom;

import js.html.*;

using tink.CoreApi;

typedef Style = Dynamic;

abstract Ext(String) from String to String {
  @:from static inline function ofBool(b:Bool):Ext
    return 
      if (b) '';
      else js.Lib.undefined;
}

abstract Key(Dynamic) from String from Int {
  static var keygen = 0;
  @:from static function ofAny<T>(v:T):Key {
	  if (v == null) return null;
    var o: { __vdomKey__:Key } = cast v;
    if (o.__vdomKey__ == null) o.__vdomKey__ = keygen++;
    return o.__vdomKey__;
  }
}

typedef Attr = AttrOf<Element>;

@:forward
abstract EventFrom<E:Event, T:Element>(E) from E to E {
  public var target(get, never):T;
    inline function get_target():T
      return cast this.target;
}

typedef AttrOf<Target:Element> = {
  @:optional var key(default, null):Key;
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
  
  @:optional var onwheel(default, null):Callback<EventFrom<WheelEvent, Target>>;
  
  @:optional var oncopy(default, null):Callback<EventFrom<ClipboardEvent, Target>>;
  @:optional var oncut(default, null):Callback<EventFrom<ClipboardEvent, Target>>;
  @:optional var onpaste(default, null):Callback<EventFrom<ClipboardEvent, Target>>;
  
  @:optional var onabort(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onblur(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onfocus(default, null):Callback<EventFrom<Event, Target>>;
  
  @:optional var oncanplay(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var oncanplaythrough(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onchange(default, null):Callback<EventFrom<Event, Target>>;
  
  @:optional var onclick(default, null):Callback<EventFrom<MouseEvent, Target>>;
  @:optional var oncontextmenu(default, null):Callback<EventFrom<MouseEvent, Target>>;
  @:optional var ondblclick(default, null):Callback<EventFrom<MouseEvent, Target>>;
  
  @:optional var ondrag(default, null):Callback<EventFrom<DragEvent, Target>>;
  @:optional var ondragend(default, null):Callback<EventFrom<DragEvent, Target>>;
  @:optional var ondragenter(default, null):Callback<EventFrom<DragEvent, Target>>;
  @:optional var ondragleave(default, null):Callback<EventFrom<DragEvent, Target>>;
  @:optional var ondragover(default, null):Callback<EventFrom<DragEvent, Target>>;
  @:optional var ondragstart(default, null):Callback<EventFrom<DragEvent, Target>>;
  @:optional var ondrop(default, null):Callback<EventFrom<DragEvent, Target>>;
  
  @:optional var ondurationchange(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onemptied(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onended(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var oninput(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var oninvalid(default, null):Callback<EventFrom<Event, Target>>;
  
  @:optional var onkeydown(default, null):Callback<EventFrom<KeyboardEvent, Target>>;
  @:optional var onkeypress(default, null):Callback<EventFrom<KeyboardEvent, Target>>;
  @:optional var onkeyup(default, null):Callback<EventFrom<KeyboardEvent, Target>>;
  
  @:optional var onload(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onloadeddata(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onloadedmetadata(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onloadstart(default, null):Callback<EventFrom<Event, Target>>;
  
  @:optional var onmousedown(default, null):Callback<EventFrom<MouseEvent, Target>>;
  @:optional var onmouseenter(default, null):Callback<EventFrom<MouseEvent, Target>>;
  @:optional var onmouseleave(default, null):Callback<EventFrom<MouseEvent, Target>>;
  @:optional var onmousemove(default, null):Callback<EventFrom<MouseEvent, Target>>;
  @:optional var onmouseout(default, null):Callback<EventFrom<MouseEvent, Target>>;
  @:optional var onmouseover(default, null):Callback<EventFrom<MouseEvent, Target>>;
  @:optional var onmouseup(default, null):Callback<EventFrom<MouseEvent, Target>>;
  
  @:optional var onpause(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onplay(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onplaying(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onprogress(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onratechange(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onreset(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onresize(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onscroll(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onseeked(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onseeking(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onselect(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onshow(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onstalled(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onsubmit(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onsuspend(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var ontimeupdate(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onvolumechange(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onwaiting(default, null):Callback<EventFrom<Event, Target>>;
  
  @:optional var onpointercancel(default, null):Callback<EventFrom<PointerEvent, Target>>;
  @:optional var onpointerdown(default, null):Callback<EventFrom<PointerEvent, Target>>;
  @:optional var onpointerup(default, null):Callback<EventFrom<PointerEvent, Target>>;
  @:optional var onpointermove(default, null):Callback<EventFrom<PointerEvent, Target>>;
  @:optional var onpointerout(default, null):Callback<EventFrom<PointerEvent, Target>>;
  @:optional var onpointerover(default, null):Callback<EventFrom<PointerEvent, Target>>;
  @:optional var onpointerenter(default, null):Callback<EventFrom<PointerEvent, Target>>;
  @:optional var onpointerleave(default, null):Callback<EventFrom<PointerEvent, Target>>;
  
  @:optional var ongotpointercapture(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onlostpointercapture(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onfullscreenchange(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onfullscreenerror(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onpointerlockchange(default, null):Callback<EventFrom<Event, Target>>;
  @:optional var onpointerlockerror(default, null):Callback<EventFrom<Event, Target>>;
  
  @:optional var onerror(default, null):Callback<EventFrom<ErrorEvent, Target>>;
  
  @:optional var ontouchstart(default, null):Callback<EventFrom<TouchEvent, Target>>;
  @:optional var ontouchend(default, null):Callback<EventFrom<TouchEvent, Target>>;
  @:optional var ontouchmove(default, null):Callback<EventFrom<TouchEvent, Target>>;
  @:optional var ontouchcancel(default, null):Callback<EventFrom<TouchEvent, Target>>;
}