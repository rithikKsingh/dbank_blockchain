import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";
actor DBank{
  stable var startTime=Time.now();
  Debug.print(debug_show(startTime));
  stable var currentValue: Float=300; //gives the time in nano seconds
  // currentValue := 100;
  let id=12312; //let is a constant
  // Debug.print(debug_show(currentValue)); if you write Debug.print(currentValue), it will show error
  //because print expects a string

  // Debug.print(debug_show(id));

  public func topUp(amount:Float){ //by deault methods ar private,Nat is a natural num
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };

  // topUp();
  // Nat => natural number
  public func withdraw(amount:Float){
    let tempValue: Float=currentValue-amount;
    if(tempValue>=0){
      currentValue-=amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Amount too large, currentValue less than zero.");
    }
  };

// queries are fast compared to the update functions
  public query func checkBalance():async Float{
    return currentValue;
  };

  public func compound(){
    let currentTimeNS=Time.now();
    let timeElapsedNS=currentTimeNS-startTime;
    let timeElapsedS=timeElapsedNS/1000000000;
    //here we are using the formula of compud interest, taking 1% interest per second
    currentValue:=currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime:=currentTimeNS;
  }
}
