import Debug "mo:base/Debug";
actor DBank{
  var currentValue=300;
  currentValue := 100;
  let id=123123; //let is a constant
  // Debug.print(debug_show(currentValue)); if you write Debug.print(currentValue), it will show error
  //because print expects a string

  // Debug.print(debug_show(id));

  public func topUp(){ //by deault methods ar private
    currentValue+=1;
    Debug.print(debug_show(currentValue));
  };

  // topUp();
}
