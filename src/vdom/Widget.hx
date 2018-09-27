package vdom;

import js.html.Element;

class Widget {
  @:noCompletion 
  @:isVar 
  @:keep 
  @:native('type') public var virtualDomType(default, never):String = "Widget";
  
  @:keep public function init():Element {
    return throw 'abstract';
  }

  @:keep public function toElement():Element {
    return throw 'abstract';
  }

  @:keep public function update(prev:{}, elt:Element):Element {
    return throw 'abstract';
  }
  
  @:keep public function destroy():Void {
    
  }
  
}
