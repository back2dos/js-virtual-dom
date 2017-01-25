package vdom;

import js.html.Element;
import js.html.Event;

typedef Children = Array<VNode>;

@:native('window.virtualDom.VNode')
private extern class VNodeImpl {
	function new(tagName:String, ?properties:Attr, ?children:Children, ?key:String, ?namespace:String):Void;
}

@:coreType abstract VNode from VNodeImpl from Widget {
  
  @:to public function toElement() 
    return VDom.create(this);//TODO: handle array case
	
	public inline function new(tagName:String, ?properties:Attr, ?children:Children, ?key:String, ?namespace:String)
		this = new VNodeImpl(tagName, properties, children, key, namespace);
		
	@:from static inline function ofString(s:String):VNode 
		return cast s;
    
	@:from static inline function ofInt(i:Int):VNode 
    return ofString(Std.string(i));
  
  @:to function toChildren():Children {
    return cast this;
  }
  
  @:noCompletion @:from static public function flatten(c:Children):VNode
    return cast c;
}