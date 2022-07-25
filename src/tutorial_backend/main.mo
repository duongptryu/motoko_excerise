import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";

actor tutorial {
  var count = 0;

  //Challenge 1
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  //Challenge 2
  public func sum(m:Nat,n: Nat): async Nat {
    return m + n
  };
  //Challenge 3
  public func square(n: Nat): async Nat {
    return n * n
  };
  //Challenge 4
  public func days_to_second(_number_of_day: Nat) :async Nat {
    return _number_of_day * 24 * 60 *60
  };
  
  //Challenge 5
  public func increment_counter(): async Nat {
    count += 1;
    return count;
  };
  //Challenge 5
  public func clear_counter(): async Nat {
    count := 0;
    return count
  };

  //Challenge 6
  public func divide(a: Nat, b: Nat): async Bool {
    return a % b ==0;
  };

  //Challenge 7
  public func is_event(a: Nat) : async Bool {
    return a % 2 == 0;
  };

  //Challenge 8
  public func sum_of_array (arr: [Nat]): async Nat {
    var sum = 0;
    if (arr.size() == 0) {
      return 0
    };

    for (value in arr.vals()) {
      // Debug.print(debug_show(value));
      sum += value;
    };

    return sum;
  };

  //Challenge 9
  public func maximum (arr: [Nat]): async Nat {
    if (arr.size() == 0) {
      return 0;
    };

    var max = 0;
    for (value in arr.vals()) {
      if (value > max) {
        max := value;
      };
    };

    return max;
  };

  //Challenge 10
  public func remove_from_array(arr: [Nat], n: Nat) : async [Nat] {
    return Array.filter(arr, func (val: Nat): Bool { return val != n});
  };

  //Challenge 11
  public func selection_soft(arr: [Nat]) : async [Nat] {
    var mut_arr = Array.thaw<Nat>(arr);
    let len = mut_arr.size();

    for (i in Iter.range(0, len - 2)) {
      for (j in Iter.range(i + 1, len - 1)) {
        if (mut_arr[j] < mut_arr[i]) {
          var c = mut_arr[i];
          mut_arr[i] := mut_arr[j];
          mut_arr[j] := c;
        };
      };
    };

    return Array.freeze<Nat>(mut_arr);
  };
};
