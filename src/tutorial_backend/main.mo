import Debug "mo:base/Debug";

actor tutorial {
  var count = 0;

  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  public func sum(m:Nat,n: Nat): async Nat {
    return m + n
  };

  public func square(n: Nat): async Nat {
    return n * n
  };

  public func days_to_second(_number_of_day: Nat) :async Nat {
    return _number_of_day * 24 * 60 *60
  };

  public func increment_counter(): async Nat {
    count += 1;
    return count;
  };

  public func clear_counter(): async Nat {
    count := 0;
    return count
  };

  public func divide(a: Nat, b: Nat): async Bool {
    return a % b ==0;
  };

  public func is_event(a: Nat) : async Bool {
    return a % 2 == 0;
  };

  public func sum_of_array (arr: [Nat]): async () {
    for (value in arr.vals()) {
      Debug.print(value);
    }
  } 
};
