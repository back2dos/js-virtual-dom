package vdom;

import js.html.Element;
import js.html.Event;

using tink.CoreApi;

typedef Style = Dynamic;

typedef Attr = {
  @:optional var className(default, null):String;
	@:optional var id(default, null):String;
	@:optional var title(default, null):String;
	@:optional var lang(default, null):String;
	@:optional var dir(default, null):String;
	
  @:optional var attributes(default, null):Dynamic<String>;
  
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
@:native('virtualDom')
extern class VDom {
	
	static function create(node:VNode):Element;
	static function diff(old:VNode, nu:VNode):Patch;
	
	static public function patch(target:Element, patch:Patch):Element;
	
	static function h(selector:String, ?attr:Attr, ?children:Children):VNode;
	
	static inline function div(?attr:Attr, ?children:Children):VNode return h('div', attr, children);
	static inline function section(?attr:Attr, ?children:Children):VNode return h('section', attr, children);
  
	static inline function h1(?attr:Attr, ?children:Children):VNode return h('h1', attr, children);
	static inline function h2(?attr:Attr, ?children:Children):VNode return h('h2', attr, children);
	static inline function h3(?attr:Attr, ?children:Children):VNode return h('h3', attr, children);
	static inline function h4(?attr:Attr, ?children:Children):VNode return h('h4', attr, children);
	static inline function h5(?attr:Attr, ?children:Children):VNode return h('h5', attr, children);
	
  static inline function a(?attr:Attr, ?children:Children):VNode return h('a', attr, children);
	static inline function p(?attr:Attr, ?children:Children):VNode return h('p', attr, children);
	static inline function ul(?attr:Attr, ?children:Children):VNode return h('ul', attr, children);
	static inline function ol(?attr:Attr, ?children:Children):VNode return h('ol', attr, children);
	static inline function li(?attr:Attr, ?children:Children):VNode return h('li', attr, children);
	static inline function button(?attr:Attr, ?children:Children):VNode return h('button', attr, children);
  static inline function textarea(?attr:Attr, ?children:Children):VNode return h('textarea', attr, children);
  
	static inline function img(?attr: {> Attr, @:optional var src(default, null):String; } ):VNode return h('img', attr);
	static inline function input(?attr: {> Attr, @:optional var value(default, null):String; } ):VNode return h('input', attr);
  
  static function __init__():Void {
    haxe.macro.Compiler.includeFile('vdom/dist.js');
  }
}

extern class Patch {}

class Widget {
  @:noCompletion 
  @:isVar public var type(never, never):String = "Widget";
  
  public function init():Element {
    return throw 'abstract';
  }
  
  public function update(prev:{}, elt:Element):Element {
    return throw 'abstract';
  }
  public function destroy():Void {
    
  }
  
}

typedef Children = Array<VNode>;

@:native('virtualDom.VNode')
private extern class VNodeImpl {
	function new(tagName:String, ?properties:Attr, ?children:Children, ?key:String, ?namespace:String):Void;
}

@:coreType abstract VNode from VNodeImpl from Widget {
  
  @:to public function toElement()
    return VDom.create(this);
	
	public inline function new(tagName:String, ?properties:Attr, ?children:Children, ?key:String, ?namespace:String)
		this = new VNodeImpl(tagName, properties, children, key, namespace);
		
	@:from static inline function ofString(s:String):VNode 
		return cast s;
    
  @:from static inline function ofWidget(w:Widget):VNode 
    return cast w;
  
  static public inline function splat(nodes:Array<VNode>):VNode
    return cast nodes;
}