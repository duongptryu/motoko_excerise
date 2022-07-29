import Cycel "mo:base/ExperimentalCycles";
import HashMapModule "mo:base/HashMap";
import ListModule "mo:base/List";
import Nat "mo:base/Nat";
import Option "mo:base/Option";
import Principal "mo:base/Principal";

import AnimalModule "day3/animal";
import Custom "day3/custom";

actor day3 {
    public type Person = Custom.Person;
    public type Animal = AnimalModule.Animal;
    //challenge 1
    let duong: Person = {
        name = "Duong";
        age = 20;
        sex = true;
    };

    public func fun(): async Person {
        return duong;
    };

    //challenge 2
    let dog: Animal = {
        species = "gau gau";
        energy = 100;
    };

    //challenge 3 in file anmimal.mo
    //challenge 4
    public func create_animal_then_takes_a_break(specie: Text, energy: Nat): async Animal {
        var animal: Animal = {
            species = specie;
            energy = energy;
        };

        animal := AnimalModule.animal_sleep(animal);
        return animal;
    };

    //challenge 5
    var animals: ListModule.List<Animal> = null;

    //challenge 6
    public func push_animal(animal: Animal) {
        animals := ListModule.push<Animal>(animal, animals);
    };

    public func get_animals() : async [Animal] {
        return(ListModule.toArray<Animal>(animals));
    };

    //challenge 11
    public shared(msg) func is_anonymous() : async Bool {
        let principal = msg.caller;
        return Principal.isAnonymous(principal);
    };

    //challenge 12
    let favoriteNumber = HashMapModule.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

    //challenge 13,14
    public shared(msg) func add_favorite_number(number: Nat): async Text {
        let principal = msg.caller;
        if (Option.isSome(favoriteNumber.get(principal))) {
            return "You've already registered your number";
        }else {
            favoriteNumber.put(principal, number);
            return "You've successfully registered your number"
        }
    };

    public shared(msg) func show_favorite_number(): async ?Nat {
        let principal = msg.caller;
        return favoriteNumber.get(principal);
    };

    //challenge 15
    public shared(msg) func update_favorite_number (number: Nat) : async () {
        let principal = msg.caller;
        favoriteNumber.put(principal, number);
    };

    public shared(msg) func delete_favorite_number(): async () {
        let principal = msg.caller;
        var value = favoriteNumber.remove(principal);
    };

    //challenge 16
    public func deposit_cycles() : async Nat {
        var amount = Cycel.available();
        if (amount == 0) {
            return 0;
        };

        let accepted = Cycel.accept(amount);
        return accepted;
    };

    //challenge 17
    //from caller
    public func deposit_cycles_caller(): async () {
        assert(Cycel.available() > 0);
        var value = Cycel.accept(Cycel.available());
    };

    public shared(msg) func withdraw_cycles(n: Nat) : async () {
        assert(Cycel.balance() > n);
        var principal = msg.caller;
        Cycel.add(n);
        await deposit_cycles_caller();
    };

    //challenge 18
    stable var count = 0;
    stable var versionNumber = 0;

    public func increment_counter(): async Nat {
        count += 1;
        return count;
    };

    public func clear_counter(): async Nat {
        count := 0;
        return count
    };

    public func get_version(): async Nat {
        return versionNumber;
    };

    system func preupgrade(){
        versionNumber += 1;
    };
}