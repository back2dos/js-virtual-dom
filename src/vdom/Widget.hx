package vdom;

import js.html.Element;

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