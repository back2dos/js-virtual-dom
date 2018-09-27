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
  
  @:deprecated("Implicit cast to DOM is deprecated. Call .toElement() explicitly.")
  @:to function autoRender():Element
    return toElement();

  public function toElement():Element
    return 
      if (untyped __js__('typeof {0}.toElement === "function"', this)) (cast this).toElement();
      else VDom.create(this);//TODO: handle array case
  
  @:to public function toChildList():Children
    return [this];

  public inline function new(tagName:String, ?properties:Attr, ?children:Children, ?key:String, ?namespace:String)
    this = new VNodeImpl(tagName, properties, children, key, namespace);

  @:from static inline function ofInt(i:Int):VNode 
    return Std.string(i);
}