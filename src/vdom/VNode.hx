package vdom;

import js.html.Element;
import js.html.Event;

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