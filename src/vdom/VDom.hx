package vdom;

#if !macro

import js.html.Element;
import js.html.Event;
import vdom.VNode.Children;

@:native('vdom_VDom')
extern class VDom {
  
  static function __init__():Void {
    //untyped __js__('var vdom_VDom') = 
    vdom.macros.Loader.embedInline();
  }
  
  macro static public function hxx(e:haxe.macro.Expr):haxe.macro.Expr;
  
  static function create(node:VNode):Element;
  static function diff(old:VNode, nu:VNode):Patch;
  
  static inline function object(?attr:{>Attr, type:String, data:String}, ?children:Children):VNode return h('object', attr, children);
  static inline function param(?attr:{>Attr, name:String, value:String}):VNode return h('param', attr);
  static public function patch(target:Element, patch:Patch):Element;
  
  static function h(selector:String, ?attr:Dynamic, ?children:Children):VNode;
  
  static inline function div(?attr:Attr, ?children:Children):VNode return h('div', attr, children);
  static inline function aside(?attr:Attr, ?children:Children):VNode return h('aside', attr, children);
  static inline function section(?attr:Attr, ?children:Children):VNode return h('section', attr, children);
  
  static inline function header(?attr:Attr, ?children:Children):VNode return h('header', attr, children);
  static inline function footer(?attr:Attr, ?children:Children):VNode return h('footer', attr, children);
  static inline function main(?attr:Attr, ?children:Children):VNode return h('main', attr, children);
  
  static inline function h1(?attr:Attr, ?children:Children):VNode return h('h1', attr, children);
  static inline function h2(?attr:Attr, ?children:Children):VNode return h('h2', attr, children);
  static inline function h3(?attr:Attr, ?children:Children):VNode return h('h3', attr, children);
  static inline function h4(?attr:Attr, ?children:Children):VNode return h('h4', attr, children);
  static inline function h5(?attr:Attr, ?children:Children):VNode return h('h5', attr, children);
  
  static inline function strong(?attr:Attr, ?children:Children):VNode return h('strong', attr, children);
  static inline function em(?attr:Attr, ?children:Children):VNode return h('em', attr, children);
  static inline function span(?attr:Attr, ?children:Children):VNode return h('span', attr, children);
  static inline function a(?attr:AnchorAttr, ?children:Children):VNode return h('a', attr, children);
  
  static inline function p(?attr:Attr, ?children:Children):VNode return h('p', attr, children);
  static inline function ul(?attr:Attr, ?children:Children):VNode return h('ul', attr, children);
  static inline function ol(?attr:Attr, ?children:Children):VNode return h('ol', attr, children);
  static inline function li(?attr:Attr, ?children:Children):VNode return h('li', attr, children);
  static inline function button(?attr:{>Attr, @:optional var disabled(default, null):Bool; }, ?children:Children):VNode return h('button', attr, children);
  static inline function textarea(?attr:Attr, ?children:Children):VNode return h('textarea', attr, children);
  
  static inline function img(?attr: ImgAttr ):VNode return h('img', attr);
  static inline function input(?attr: InputAttr ):VNode return h('input', attr);
  
  static inline function splat(nodes:Array<VNode>):VNode return cast nodes;
  
  
}

typedef AnchorAttr = {> Attr,
  @:optional var href(default, null):String; 
}


typedef InputAttr = {> Attr, 
  @:optional var value(default, null):String; 
}

typedef ImgAttr = {> Attr, 
  @:optional var src(default, null):String; 
}

extern class Patch { }

#else


import haxe.macro.Expr;
import tink.hxx.*;

using haxe.macro.Context;
using tink.MacroApi;
using tink.CoreApi;

class VDom {
  
  static public function hxx(e:Expr) 
    return 
      #if hxx
        Parser.parse(e, { customAttributes: 'attributes', child: macro : vdom.VNode });
      #else
        'You have to add -lib tink_hxx to use HXX syntax'.fatalError(Context.currentPos());
      #end
}

#end