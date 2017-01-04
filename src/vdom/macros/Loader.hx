package vdom.macros;

#if macro
import haxe.macro.*;
using haxe.io.Path;
using sys.io.File;
#end

class Loader {
  
  macro static public function embedInline() {        
    var dist = Context.getPosInfos((macro null).pos).file.directory().directory() + '/dist.js';
    return macro untyped __js__($v{'var vdom_VDom = '+dist.getContent()});
  }
}
