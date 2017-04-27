package ;

import vdom.VDom.*;
import vdom.VRoot;
import vdom.VNode;
import vdom.Attr;
import vdom.Widget;

import js.Browser.*;
using StringTools;

class RunTests extends haxe.unit.TestCase {
  
  function testUpdate() {
    var root = new vdom.VRoot();
    document.body.appendChild(root);

    function check(expected:String, ?pos:haxe.PosInfos)
      assertEquals(expected, root.currentElement().innerHTML.trim(), pos);

    root.update(
      div({ className: 'test' }, ['hello world'])
    );
    check('hello world');
    root.update(
      div({ className: 'test' }, ['hola mundo'])
    );   
    check('hola mundo');
    root.update('
      <div class="test">
        Hello <strong>HXX</strong>!!!
      </div>
    ');
    check(
      #if tink_hxx
      'Hello <strong>HXX</strong>!!!'
      #else
      '<div class="test">
        Hello <strong>HXX</strong>!!!
      </div>'.htmlEscape()
      #end
    );

    #if tink_hxx
      var html = root.currentElement().innerHTML;
      root.update('<raw content={html} />');
      var strong = root.currentElement().querySelector('strong');
      assertTrue(strong != null);
      root.update('<raw content={html} />');
      assertEquals(strong, root.currentElement().querySelector('strong'));
    #end
  }

  static function main() {
    var runner = new haxe.unit.TestRunner();
    runner.add(new RunTests());
    travix.Logger.exit(
      if (runner.run()) 0
      else 500
    );
  }
  
}