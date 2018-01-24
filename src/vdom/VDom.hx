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

  static inline function iframe(attr: IframeAttr, ?children:Children):VNode return h('iframe', attr, children);

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
  static inline function td(attr:TableCellAttr, ?children:Children):VNode return h('td', attr, children);
  static inline function th(attr:TableCellAttr, ?children:Children):VNode return h('th', attr, children);

  static inline function h1(attr:EditableAttr, ?children:Children):VNode return h('h1', attr, children);
  static inline function h2(attr:EditableAttr, ?children:Children):VNode return h('h2', attr, children);
  static inline function h3(attr:EditableAttr, ?children:Children):VNode return h('h3', attr, children);
  static inline function h4(attr:EditableAttr, ?children:Children):VNode return h('h4', attr, children);
  static inline function h5(attr:EditableAttr, ?children:Children):VNode return h('h5', attr, children);

  static inline function strong(attr:EditableAttr, ?children:Children):VNode return h('strong', attr, children);
  static inline function em(attr:EditableAttr, ?children:Children):VNode return h('em', attr, children);
  static inline function span(attr:EditableAttr, ?children:Children):VNode return h('span', attr, children);
  static inline function a(attr:AnchorAttr, ?children:Children):VNode return h('a', attr, children);
  static inline function base(attr:BaseAttr):VNode return h('base', attr);

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
  static inline function textarea(attr:TextAreaAttr, ?children:Children):VNode return h('textarea', attr, children);
  
  static inline function pre(attr:EditableAttr, ?children:Children):VNode return h('pre', attr, children);

  static inline function hr(attr: Attr):VNode return h('hr', attr);
  static inline function br(attr: Attr):VNode return h('br', attr);
  static inline function wbr(attr: Attr):VNode return h('wbr', attr);

  static inline function canvas(attr: CanvasAttr ):VNode return h('canvas', attr);
  static inline function img(attr: ImgAttr ):VNode return h('img', attr);
  static inline function audio(attr: AudioAttr, ?children:Children ):VNode return h('audio', attr, children);
  static inline function video(attr: VideoAttr, ?children:Children ):VNode return h('video', attr, children);
  static inline function source(attr: SourceAttr ):VNode return h('source', attr);
  static inline function input(attr: InputAttr ):VNode return h('input', attr);
  static inline function form(attr: FormAttr, ?children:Children):VNode return h('form', attr, children);

  static inline function select(attr: SelectAttr, ?children:Children):VNode return h('select', attr, children);
  static inline function option(attr: OptionAttr, ?children:Children):VNode return h('option', attr, children);

  static inline function raw(attr: vdom.HtmlFragment.RawAttr):VNode 
    return vdom.HtmlFragment.create(attr);
}



typedef CanvasAttr = {>Attr,
  @:optional var width(default, never):String;
  @:optional var height(default, never):String;
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
  @:optional var target(default, never):String;
  @:optional var type(default, never):String;
}

typedef BaseAttr = {> AttrOf<BaseElement>,
  @:optional var href(default, never):String;
  @:optional var target(default, never):String;
}


typedef TableCellAttr = {> Attr,
  @:optional var abbr(default, never):String;
  @:optional var colSpan(default, never):Int;
  @:optional var headers(default, never):String;
  @:optional var rowSpan(default, never):Int;
  @:optional var scope(default, never):String;
  @:optional var sorted(default, never):String;
}


typedef InputAttr = {> AttrOf<InputElement>,
  @:optional var checked(default, never):Bool;
  @:optional var disabled(default, never):Bool;
  @:optional var required(default, never):Bool;
  @:optional var autofocus(default, never):Bool;
  @:optional var value(default, never):String;
  @:optional var type(default, never):String;
  @:optional var name(default, never):String;
  @:optional var placeholder(default, never):String;
  @:optional var max(default, never):String;
  @:optional var min(default, never):String;
  @:optional var step(default, never):String;
  @:optional var maxlength(default, never):Int;
}

typedef TextAreaAttr = {> AttrOf<TextAreaElement>,
  @:optional var autofocus(default, never):Bool;
  @:optional var cols(default, never):Int;
  @:optional var dirname(default, never):String;
  @:optional var disabled(default, never):Bool;
  @:optional var form(default, never):String;
  @:optional var maxlength(default, never):Int;
  @:optional var name(default, never):String;
  @:optional var placeholder(default, never):String;
  @:optional var readonly(default, never):Bool;
  @:optional var required(default, never):Bool;
  @:optional var rows(default, never):Int;
  @:optional var wrap(default, never):String;
}

typedef IframeAttr = {> AttrOf<IFrameElement>,
  @:optional var sandbox(default, never):String; 
  @:optional var width(default, never):Int; 
  @:optional var height(default, never):Int; 
  @:optional var src(default, never):String; 
  @:optional var srcdoc(default, never):String; 
  @:optional var allowFullscreen(default, never):Bool;
  @:deprecated @:optional var scrolling(default, never):IframeScrolling;
}

@:enum abstract IframeScrolling(String) {
  var Yes = "yes";
  var No = "no";
  var Auto = "auto";
}

typedef ImgAttr = {> AttrOf<ImageElement>,
  @:optional var src(default, never):String;
  @:optional var width(default, never):Int;
  @:optional var height(default, never):Int;
}

typedef AudioAttr = {> AttrOf<AudioElement>,
  @:optional var src(default, never):String;
  @:optional var autoplay(default, never):Bool;
  @:optional var controls(default, never):Bool;
  @:optional var loop(default, never):Bool;
  @:optional var muted(default, never):Bool;
  @:optional var preload(default, never):String;
}

typedef VideoAttr = {> AttrOf<VideoElement>,
  @:optional var src(default, never):String;
  @:optional var autoplay(default, never):Bool;
  @:optional var controls(default, never):Bool;
}

typedef SourceAttr = {> AttrOf<SourceElement>,
  @:optional var src(default, never):String;
  @:optional var srcset(default, never):String;
  @:optional var media(default, never):String;
  @:optional var sizes(default, never):String;
  @:optional var type(default, never):String;
}

typedef LabelAttr = {> AttrOf<LabelElement>,
  @:optional var htmlFor(default, never):String;
}

typedef SelectAttr = {> AttrOf<SelectElement>,
  @:optional var autofocus(default, never):Bool;
  @:optional var disabled(default, never):Bool;
  @:optional var form(default, never):FormElement;
  @:optional var multiple(default, never):Bool;
  @:optional var name(default, never):String;
  @:optional var required(default, never):Bool;
  @:optional var size(default, never):Int;
}

typedef OptionAttr = {> AttrOf<OptionElement>,
  @:optional var disabled:Bool;
  @:optional var form(default, never):FormElement;
  @:optional var label(default, never):String;
  @:optional var defaultSelected(default, never):Bool;
  @:optional var selected(default, never):Bool;
  @:optional var value(default, never):String;
  @:optional var text(default, never):String;
  @:optional var index(default, never):Int;
}


extern class Patch { }

#else

import haxe.macro.Expr;

#if tink_hxx
import tink.hxx.*;
#end

using haxe.macro.Context;
using tink.MacroApi;
using tink.CoreApi;

class VDom {
  #if tink_hxx
  static public var generator(default, never):Generator = 
    new Generator([function (name) return {
      value: 'vdom.VDom.${name.value}',
      pos: name.pos,
    }]);
  #end
  dynamic static public function hxx(e:Expr)
    return
      #if tink_hxx
        generator.root(Parser.parseRoot(e));
      #else
        'You have to add -lib tink_hxx to use HXX syntax'.fatalError(Context.currentPos());
      #end
}

#end
