package vdom;

import js.html.Element;
import js.html.Event;
import vdom.VNode.Children;

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