package vdom.macros;

import haxe.macro.*;
using haxe.io.Path;
using sys.io.File;

class Loader {
  static function embed() 
    if (Context.defined('js'))
      Context.onAfterGenerate(function () {
        var out = Compiler.getOutput();
        var dist = Context.getPosInfos((macro null).pos).file.directory().directory() + '/dist.js';
        out.saveContent(dist.getContent() + '\n' + out.getContent());
      });
}