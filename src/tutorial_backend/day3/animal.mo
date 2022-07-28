import Nat "mo:base/Nat";
module {
    public type Animal = {
        species : Text;
        energy : Nat;
    };

    //challenge 3
    public func animal_sleep(animal: Animal): Animal {
        var new_aminal: Animal = {
            species = animal.species;
            energy = Nat.add(animal.energy, 10);
        };
        return animal;
    }
};