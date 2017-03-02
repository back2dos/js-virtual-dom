# js-virtual-dom

Wrapper for MattEsch's [virtual-dom](https://github.com/Matt-Esch/virtual-dom) with a bit of Haxe awesomeness sprinkled around the edges.

## Adding VDom to the DOM

You can use `create`, `diff` and `patch` from `vdom.VDom` yourself, if you wish, or you can use a `VRoot` like so:

```haxe
import vdom.VDom.*;
import js.Browser.*;

class Main {
  static function main() {
    var root = new vdom.VRoot();

    document.body.appendChild(root);

    root.update(
      div({ className: 'test' }, ['hello world'])
    );

    root.update(
      div({ className: 'test' }, ['holla mundo'])
    );

    //And with tink_hxx
    root.update('
      <div class="test">Hi HXX!!!</div>
    ');
  }
}
```

When compiling with `-lib tink_hxx` the argument can either be a string constant or a `VNode`. If you call update with a string constant without `-lib tink_hxx` you will get a compiler warning, if it looks vaguely like HXX (i.e. the first non-whitespace character is `{` or `<`).

While a `VRoot` can be used as an `Element` it is not quite the same. For example if you were to call `root.update(span({ }))` then the `<div>` will be transparently replaced with a `<span>`. You can poll the current element with `root.currentElement()` but keep in mind that it *might* change over the life time of a `VRoot`.
