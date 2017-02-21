package vdom;

class Foreign extends Widget
{
  
  var element:js.html.Element;
  
  public function new(e)
    this.element = e;
    
  override public function init() 
    return this.element;
    
  override function update(_, _)
    return this.element;
}