import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var currentValue:Float = 200;
  // currentValue:=300;
  stable var startTime=Time.now();
  // startTime:=Time.now();

   public query func checkBalance(): async Float{
     return currentValue;
  };

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float){
    let tempValue:Float =currentValue-amount;
    if(tempValue>=0){
    currentValue-=amount;
    Debug.print(debug_show(currentValue));
    }else{
    Debug.print("Insufficient Balance");
    }
  };

  public func compound(){
    let currentTime=Time.now();
    var timeElapsed=currentTime-startTime;
    timeElapsed:= timeElapsed/1000000000;
    currentValue:=currentValue*(1.01**Float.fromInt(timeElapsed));
    startTime:=currentTime;
  };

}
