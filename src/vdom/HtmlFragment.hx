package vdom;

import js.html.*;
import vdom.Attr.ClassName;
import js.Browser.*;

class HtmlFragment extends Widget {
  var content:String;
  var tag:String;
  var element:Element;
  var className:ClassName;
  public function new(content, ?tag:String = 'span', ?className) {
    this.content = content;
    this.tag = tag;
    this.className = className;
  }

  override public function init() {
    if (this.element == null) {
      this.element = document.createElement(tag);
      this.element.innerHTML = this.content;
      if (this.className != null) this.element.className = this.className;
    }
    return this.element;
  }
    
  override function update(old:{}, e:Element) {
    return switch Std.instance(old, HtmlFragment) {
      case null: this.init();
      case v if (v.tag == this.tag): 
        
        this.element = e;

        if (this.className != v.className)
          this.element.className = this.className;

        if (this.content != v.content)
          this.element.innerHTML = this.content;

        e;
      default: this.init();
    }
  }
    
}