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

  static inline function div(attr:EditableAttr, ?children:Children):VNode return h('div', attr, children);
  static inline function aside(attr:EditableAttr, ?children:Children):VNode return h('aside', attr, children);
  static inline function section(attr:EditableAttr, ?children:Children):VNode return h('section', attr, children);

  static inline function header(attr:EditableAttr, ?children:Children):VNode return h('header', attr, children);
  static inline function footer(attr:EditableAttr, ?children:Children):VNode return h('footer', attr, children);
  static inline function main(attr:EditableAttr, ?children:Children):VNode return h('main', attr, children);
  static inline function nav(attr:EditableAttr, ?children:Children):VNode return h('nav', attr, children);

  static inline function table(attr:EditableAttr, ?children:Children):VNode return h('table', attr, children);
  static inline function thead(attr:EditableAttr, ?children:Children):VNode return h('thead', attr, children);
  static inline function tbody(attr:EditableAttr, ?children:Children):VNode return h('tbody', attr, children);
  static inline function tfoot(attr:EditableAttr, ?children:Children):VNode return h('tfoot', attr, children);
  static inline function tr(attr:EditableAttr, ?children:Children):VNode return h('tr', attr, children);
  static inline function td(attr:EditableAttr, ?children:Children):VNode return h('td', attr, children);
  static inline function th(attr:EditableAttr, ?children:Children):VNode return h('th', attr, children);

  static inline function h1(attr:EditableAttr, ?children:Children):VNode return h('h1', attr, children);
  static inline function h2(attr:EditableAttr, ?children:Children):VNode return h('h2', attr, children);
  static inline function h3(attr:EditableAttr, ?children:Children):VNode return h('h3', attr, children);
  static inline function h4(attr:EditableAttr, ?children:Children):VNode return h('h4', attr, children);
  static inline function h5(attr:EditableAttr, ?children:Children):VNode return h('h5', attr, children);

  static inline function strong(attr:EditableAttr, ?children:Children):VNode return h('strong', attr, children);
  static inline function em(attr:EditableAttr, ?children:Children):VNode return h('em', attr, children);
  static inline function span(attr:EditableAttr, ?children:Children):VNode return h('span', attr, children);
  static inline function a(attr:AnchorAttr, ?children:Children):VNode return h('a', attr, children);

  static inline function p(attr:EditableAttr, ?children:Children):VNode return h('p', attr, children);
  static inline function i(attr:EditableAttr, ?children:Children):VNode return h('i', attr, children);
  static inline function b(attr:EditableAttr, ?children:Children):VNode return h('b', attr, children);
  static inline function small(attr:EditableAttr, ?children:Children):VNode return h('small', attr, children);
  static inline function menu(attr:EditableAttr, ?children:Children):VNode return h('menu', attr, children);
  static inline function ul(attr:EditableAttr, ?children:Children):VNode return h('ul', attr, children);
  static inline function ol(attr:EditableAttr, ?children:Children):VNode return h('ol', attr, children);
  static inline function li(attr:EditableAttr, ?children:Children):VNode return h('li', attr, children);
  static inline function label(attr:LabelAttr, ?children:Children):VNode return h('label', attr, children);
  static inline function button(attr:InputAttr, ?children:Children):VNode return h('button', attr, children);
  static inline function textarea(attr:AttrOf<TextAreaElement>, ?children:Children):VNode return h('textarea', attr, children);

  static inline function hr(attr: Attr):VNode return h('hr', attr);
  static inline function br(attr: Attr):VNode return h('br', attr);
  static inline function wbr(attr: Attr):VNode return h('wbr', attr);

  static inline function img(attr: ImgAttr ):VNode return h('img', attr);
  static inline function video(attr: VideoAttr ):VNode return h('video', attr);
  static inline function input(attr: InputAttr ):VNode return h('input', attr);
  static inline function form(attr: FormAttr, ?children:Children):VNode return h('form', attr, children);

  static inline function splat(nodes:Array<VNode>):VNode return cast nodes;

  static inline function raw(attr: RawAttr):VNode 
    return new HtmlFragment(attr.content, attr.tag);  

}


typedef RawAttr = {
	var content:String;
  @:optional var tag:String;
}

typedef EditableAttr = {>Attr,
  @:optional var contentEditable(default, never):Bool;
}

typedef FormAttr = {>AttrOf<FormElement>,
  @:optional var method(default, never):String;
  @:optional var action(default, never):String;
}

typedef AnchorAttr = {> AttrOf<AnchorElement>,
  @:optional var href(default, never):String;
}


typedef InputAttr = {> AttrOf<InputElement>,
  @:optional var checked(default, never):Bool;
  @:optional var disabled(default, never):Bool;
  @:optional var required(default, never):Bool;
  @:optional var value(default, never):String;
  @:optional var type(default, never):String;
  @:optional var name(default, never):String;
  @:optional var placeholder(default, never):String;
  @:optional var max(default, never):String;
  @:optional var min(default, never):String;
  @:optional var step(default, never):String;
}

typedef ImgAttr = {> AttrOf<ImageElement>,
  @:optional var src(default, never):String;
  @:optional var width(default, never):Int;
  @:optional var height(default, never):Int;
}

typedef VideoAttr = {> AttrOf<VideoElement>,
  @:optional var src(default, never):String;
  @:optional var autoplay(default, never):Bool;
}

typedef LabelAttr = {> AttrOf<LabelElement>,
  @:optional var htmlFor(default, never):String;
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
  static public var options(default, never):GeneratorOptions = { customAttributes: 'attributes', child: macro : vdom.VNode };
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
