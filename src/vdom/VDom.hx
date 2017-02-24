package vdom;

#if !macro

import js.html.*;
import js.Browser;
import vdom.VNode.Children;
import vdom.Attr;

@:native('vdom_VDom')
extern class VDom {
  
  static function __init__():Void {
    vdom.macros.Loader.embedInline();
  }
  
  macro static public function hxx(e:haxe.macro.Expr):haxe.macro.Expr;
  
  static function patch(target:Element, patch:Patch):Element;
  static function create(node:VNode):Element;
  static function diff(old:VNode, nu:VNode):Patch;
  
  static inline function object(attr: {> Attr, type:String, data:String }, ?children:Children):VNode return h('object', attr, children);
    
  static inline function param(attr: {> Attr, name:String, value:String } ):VNode return h('param', attr);
    
  
  static function h(selector:String, attr:Dynamic, ?children:Children):VNode;
  
  static inline function div(attr:Attr, ?children:Children):VNode return h('div', attr, children);
  static inline function aside(attr:Attr, ?children:Children):VNode return h('aside', attr, children);
  static inline function section(attr:Attr, ?children:Children):VNode return h('section', attr, children);
  
  static inline function header(attr:Attr, ?children:Children):VNode return h('header', attr, children);
  static inline function footer(attr:Attr, ?children:Children):VNode return h('footer', attr, children);
  static inline function main(attr:Attr, ?children:Children):VNode return h('main', attr, children);
  
  static inline function h1(attr:Attr, ?children:Children):VNode return h('h1', attr, children);
  static inline function h2(attr:Attr, ?children:Children):VNode return h('h2', attr, children);
  static inline function h3(attr:Attr, ?children:Children):VNode return h('h3', attr, children);
  static inline function h4(attr:Attr, ?children:Children):VNode return h('h4', attr, children);
  static inline function h5(attr:Attr, ?children:Children):VNode return h('h5', attr, children);
  
  static inline function strong(attr:Attr, ?children:Children):VNode return h('strong', attr, children);
  static inline function em(attr:Attr, ?children:Children):VNode return h('em', attr, children);
  static inline function span(attr:Attr, ?children:Children):VNode return h('span', attr, children);
  static inline function a(attr:AnchorAttr, ?children:Children):VNode return h('a', attr, children);
  
  static inline function p(attr:Attr, ?children:Children):VNode return h('p', attr, children);
  static inline function i(attr:Attr, ?children:Children):VNode return h('i', attr, children);
  static inline function b(attr:Attr, ?children:Children):VNode return h('b', attr, children);
  static inline function menu(attr:Attr, ?children:Children):VNode return h('menu', attr, children);
  static inline function ul(attr:Attr, ?children:Children):VNode return h('ul', attr, children);
  static inline function ol(attr:Attr, ?children:Children):VNode return h('ol', attr, children);
  static inline function li(attr:Attr, ?children:Children):VNode return h('li', attr, children);
  static inline function label(attr:LabelAttr, ?children:Children):VNode return h('label', attr, children);
  static inline function button(attr:InputAttr, ?children:Children):VNode return h('button', attr, children);
  static inline function textarea(attr:AttrOf<TextAreaElement>, ?children:Children):VNode return h('textarea', attr, children);
  
  static inline function img(attr: ImgAttr ):VNode return h('img', attr);
  static inline function input(attr: InputAttr ):VNode return h('input', attr);
  static inline function form(attr: FormAttr, ?children:Children):VNode return h('form', attr, children);
  
  static inline function splat(nodes:Array<VNode>):VNode return cast nodes;
  
  static inline function raw(attr: RawAttr):VNode {	  
	  var spanElement = Browser.document.createSpanElement();
	  spanElement.innerHTML = attr.content;
	  var widget:Widget = new Foreign(spanElement);
	  return widget;
  }
  
}


typedef RawAttr = {
	var content:String;
}

typedef FormAttr = {>AttrOf<FormElement>,
  @:optional var method(default, null):String;
  @:optional var action(default, null):String;
}

typedef AnchorAttr = {> AttrOf<AnchorElement>,
  @:optional var href(default, null):String; 
}


typedef InputAttr = {> AttrOf<InputElement>, 
  @:optional var checked(default, null):Bool;
  @:optional var disabled(default, null):Bool;
  @:optional var value(default, null):String; 
  @:optional var type(default, null):String; 
  @:optional var name(default, null):String;
}

typedef ImgAttr = {> AttrOf<ImageElement>, 
  @:optional var src(default, null):String; 
}

typedef LabelAttr = {> AttrOf<LabelElement>, 
  @:optional var htmlFor(default, null):String;
}
 

extern class Patch { }

#else

import haxe.macro.Expr;

#if tink_hxx
import tink.hxx.Parser;
import tink.hxx.Generator;
#end

using haxe.macro.Context;
using tink.MacroApi;
using tink.CoreApi;

class VDom {
  #if tink_hxx
  static public var options(default, null):GeneratorOptions = { customAttributes: 'attributes', child: macro : vdom.VNode };
  #end
  static public function hxx(e:Expr) 
    return 
      #if tink_hxx
        Parser.parse(
          e, 
          options, 
          { defaultExtension: 'hxx', noControlStructures: false, defaultSwitchTarget: macro __data__ }
        );
      #else
        'You have to add -lib tink_hxx to use HXX syntax'.fatalError(Context.currentPos());
      #end
}

#end