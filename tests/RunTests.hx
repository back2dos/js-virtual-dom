package ;

import vdom.VDom.*;
import vdom.VRoot;
import vdom.VNode;
import vdom.Attr;
import vdom.Style;
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
    
    var backgroundImageUrl = 'http://placehold.it/350x150';
    // var style = ;
    root.update('
      <div class="test" style=${'background-image: url("${backgroundImageUrl}")'}>
        Hello <strong>HXX</strong>!!!
      </div>
    ');
    return;
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
  
  function testStyle() {
    var root = new vdom.VRoot();
    document.body.appendChild(root);
    root.update(
      #if tink_hxx
      '<div style="height:32%; width:34%">style test</div>'
      #else
      div({ style: 'height:32%' }, ['style test'])
      #end
    );
    assertTrue(root.currentElement().style.height == '32%');
  }
  
  function testStyleOfString() {
    var style:Style = 'height:32%';
    assertTrue(style.height == '32%');
  }
  
  function testColspan() {
    var root = new vdom.VRoot();
    document.body.appendChild(root);
    root.update(
      #if tink_hxx
      '<td colspan=${1}>colspan test</td>'
      #else
      td({ colspan: 1 }, ['colspan test'])
      #end
    );
    assertTrue(root.currentElement().getAttribute('colspan') == '1');
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