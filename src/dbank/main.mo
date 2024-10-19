import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
actor DBank{
  stable var currentValue=300;
  // currentValue := 100;
  let id=12312; //let is a constant
  // Debug.print(debug_show(currentValue)); if you write Debug.print(currentValue), it will show error
  //because print expects a string

  // Debug.print(debug_show(id));

  public func topUp(amount:Nat){ //by deault methods ar private,Nat is a whole num
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };

  // topUp();
  // Nat => natural number
  public func withdraw(amount:Nat){
    let tempValue: Int=currentValue-amount;
    if(tempValue>=0){
      currentValue-=amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Amount too large, currentValue less than zero.");
    }
  };

// queries are fast compared to the update functions
  public query func checkBalance():async Nat{
    return currentValue;
  }
}
