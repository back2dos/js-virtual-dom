package vdom;

import js.html.*;
import js.Browser.*;

class HtmlFragment extends Widget {
  var content:String;
  var tag:String;
  var element:Element;
  public function new(content, ?tag:String = 'span') {
    this.content = content;
    this.tag = tag;
  }

  override public function init() {
    if (this.element == null) {
      this.element = document.createElement(tag);
      this.element.innerHTML = this.content;
    }
    return this.element;
  }
    
  override function update(old:{}, e:Element) {
    return switch Std.instance(old, HtmlFragment) {
      case null: this.init();
      case v if (v.tag == this.tag && v.content == this.content): this.element = e;
      default: this.init();
    }
  }
    
}