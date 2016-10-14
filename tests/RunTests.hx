package ;

import vdom.VDom;
import vdom.VNode;
import vdom.Attr;
import vdom.Widget;

class RunTests {

  static function main() {
    trace('it works');
    travix.Logger.exit(0); // make sure we exit properly, which is necessary on some targets, e.g. flash & (phantom)js
  }
  
}