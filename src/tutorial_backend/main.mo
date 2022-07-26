import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Char "mo:base/Char";
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
        var map = Map.HashMap<Text, Nat>(0, Text.equal, Text.hash);

        for (t in text.vals()) {
            switch() {}
        }
    }
}