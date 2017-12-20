package vdom;

import js.html.Element;
import js.html.Event;

typedef Children = Array<VNode>;

@:native('window.virtualDom.VNode')
private extern class VNodeImpl {
  function new(tagName:String, ?properties:Attr, ?children:Children, ?key:String, ?namespace:String):Void;
}

@:coreType @:pure 
abstract VNode from VNodeImpl from Widget from String {
  
  @:to public function toElement() 
    return VDom.create(this);//TODO: handle array case
  
  @:to public function toChildList():Children
    return [this];

  public inline function new(tagName:String, ?properties:Attr, ?children:Children, ?key:String, ?namespace:String)
    this = new VNodeImpl(tagName, properties, children, key, namespace);

  @:from static inline function ofInt(i:Int):VNode 
    return Std.string(i);
}