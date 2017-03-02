package vdom;

#if !macro
import js.html.*;
import vdom.VDom.*;

using tink.CoreApi;

abstract VRoot({ last:VNode, root: Element }) {
  static var INIT = vdom.VDom.div({});

  public inline function new()
    this = { last: INIT, root: INIT };
  
  @:to public inline function currentElement():Element
    return this.root;
  
  @:noCompletion public function replaceVDom(next:VNode) {
    if (Std.is(next, String))
      next = vdom.VDom.span({}, next);

    var delta = diff(this.last, next);
    this.last = next;
    this.root = patch(this.root, delta);
  }

  macro public function update(ethis, next);

}
#else
import haxe.macro.Expr;
import haxe.macro.Context;
abstract VRoot({}) {
  static public function update(ethis:Expr, next:Expr) {
    switch next.expr {
      case EConst(CString(s)):
        #if tink_hxx
          next = VDom.hxx(next);
        #else
          switch StringTools.ltrim(s).charAt(0) {
            case '<' | '{':
              Context.warning('The provided string constant looks like HXX but you are compiling without -lib hxx', next.pos);
            default:
          }
        #end
      default:
    }
    return macro @:pos(next.pos) $ethis.replaceVDom($next);
  }
}
#end