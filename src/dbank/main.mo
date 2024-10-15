import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
actor DBank{
  var currentValue=300;
  currentValue := 100;
  let id=123123; //let is a constant
  // Debug.print(debug_show(currentValue)); if you write Debug.print(currentValue), it will show error
  //because print expects a string

  // Debug.print(debug_show(id));

  public func topUp(amount:Nat){ //by deault methods ar private,Nat is a whole num
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };

  // topUp();

  public func withdraw(amount:Nat){
    currentValue-=amount;
    Debug.print(debug_show(currentValue));
  }
}
