import Array "mo:base/Array";
import Blob "mo:base/Blob";
import Buffer "mo:base/Buffer";
import Char "mo:base/Char";
import Debug "mo:base/Debug";
import Hash "mo:base/Hash";
import Iter "mo:base/Iter";
import Map "mo:base/HashMap";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";

actor day2 {
    //challenge 1
    public func nat_to_nat8 (number: Nat) : async Nat8 {
        if(number > 255) {
            return 0;
        };
        return Nat8.fromNat(number);
    };

    //challenge 2
    public func max_number_with_n_bits(bit_number: Nat) : async Nat {
        var count = bit_number;
        var max_number = 0;

        while(count > 0) {
            count -= 1;
            max_number += 2**(count);
        };

        return max_number;
    };

    //challenge 3
    public func decimal_to_bits(number: Nat): async Text {
        var m = number;
        var bits = Buffer.Buffer<Char>(0);
        while (m > 0) {
            let x = m % 2;
            m := m / 2;
            if (x == 1) {
                bits.add('1');
            }else {
               bits.add('0');
            };
        };

        let arr: [Char]= Array.reverse(bits.toArray());

        var bits_str = Text.fromIter(Iter.fromArray(arr));
        return bits_str;
    };

    //challenge 4
    public func capitalize_character(c: Char) : async Char {
        let unicode = Char.toNat32(c);
        if (unicode < 65 or unicode > 90){
            return c;
        }else if (unicode >= 65 and unicode <= 90) {
            return Char.fromNat32(unicode - 32);
        }else {
            return 'C';
        };
    };

    func _capitalize_character(char : Char) : Char {
        let unicode_value = Char.toNat32(char);
        if(unicode_value >= 97 and unicode_value <= 122){
            return(Char.fromNat32(unicode_value - 32))
        } else {
            return (Char.fromNat32(unicode_value));
        };
    };

    //challenge 5
    public func capitalize_text (str: Text) :async Text {
        var new_word = "";
        for (c in str.chars()) {
            new_word #= Char.toText(_capitalize_character(c));
        };

        return new_word;
    };

    //challenge 6
    public func is_inside(str: Text, c: Char) : async Bool {
        for (char in str.chars()) {
            if (Char.equal(char, c)) {
                return true;
            };
        };

        return false;
    };

    //challenge 7
    public func trim_whitespace(text: Text) : async Text {
        var new_text = "";
        for (char in text.chars()) {
            if (Char.notEqual(char, ' ')) {
                new_text #= Text.fromChar(char);
            };
        };
        return new_text;
    };

    //challenge 8
    public func duplicated_character(text: Text) : async Text {
        var map = Map.HashMap<Char, Nat>(0, Char.equal, func(k: Char) : Hash.Hash {return Text.hash(Text.fromChar(k))});

        for (t in text.chars()) {
            switch(map.get(t)){
                case null {
                    map.put(t, 1);
                };
                case (?v) {
                    let v_new = v + 1;
                    map.put(t, v_new);
                };
            };
        };

        for ((k, v) in map.entries()) {
            if (v > 1){
                return Text.fromChar(k);
            };
        };

        return text;
    };

    //challenge 9
    public func size_in_bytes(t: Text): async Nat{
        var utf_t = Text.encodeUtf8(t);
        var arr_blob = Blob.toArray(utf_t);
        return arr_blob.size();
    };

    //  // Challenge 10 
    // func swap(array : [Nat], i : Nat, j : Nat) : [Nat] {
    //     let mutable_array = Array.thaw<Nat>(array);
    //     let tmp = mutable_array[i];
    //     mutable_array[i] := mutable_array[j];
    //     mutable_array[j] := tmp;
    //     return(Array.freeze<Nat>(mutable_array))
    // };

    // public func bubble_sort(array : [Nat]) : async [Nat] {
    //     var sorted = array;
    //     let size = array.size();
    //     for(i in Iter.range(0, size - 1)){
    //         for (j in Iter.range(0, size - 1 - i)){
    //             if(sorted[i] > sorted[i + 1]){
    //                 sorted := _swap(sorted, i , j);
    //             };
    //         };
    //     };
    //     return (sorted)
    // };

    //challenge 11
    public func nat_opt_to_nat(n: ?Nat, m: Nat): async Nat {
        switch(n) {
            case (null) {
                return m;
            };
            case (?n){
                return n;
            };
        };
    };

    //challenge 12
    public func day_of_the_week(n: Nat) : async ?Text {
        do ? {
            switch (n) {
                case (1) { "Monday" };
                case (2) { "Tuesday" };
                case (3) { "Wednesday" };
                case (4) { "Thursday" };
                case (5) { "Friday" };
                case (6) { "Saturday" };
                case (7) { "Sunday" };
                case (_) { null! };
            };
        };
    };

    // challenge 13
    let f = func (x: ?Nat): ?Nat {
        switch(x) {
            case (null) {
                return ?0;
                };
            case (?x) {
                return ?x;
            };
        };
    };

    public func populate_array(arr: [?Nat]): async [Nat] {
        let new_arr = Array.mapFilter<?Nat, Nat> (arr, f);
        return new_arr;
    };

    //challenge 14
    public func sum_of_array(arr: [Nat]) : async Nat {
       let sum = Array.foldLeft<Nat, Nat>(arr, 0, func(a , b) {a + b});
       return sum;
    };

    //challenge 15
    public func squared_array(arr: [Nat]):async [Nat] {
        let new_arr = Array.map<Nat, Nat>(arr, func (x) {
            return x *x;
        });
        return new_arr;
    };

    //challenge 16
    public func increase_by_index(arr: [Nat]): async [Nat] {
        let new_arr = Array.mapEntries<Nat, Nat> (arr,func (x, index) {
            return x + index;
        });
        return new_arr;
    };

    //challenge 17
    public func contain(arr: [Nat], n: Nat): async Bool {

    }
}