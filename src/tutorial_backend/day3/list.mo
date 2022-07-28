module {
    public type List<T> = ?(T, List<T>);
    
    //challenge 7
    public func is_null<T>(l: List<T>): Bool {
        switch(l) {
            case (null) {
                return false;
            };
            case (_) {
                return true;
            };
        };
    };

    //challenge 8
    public func last<T>(l: List<T>): ?T {
        switch(l) {
            case (null) return null;
            case (?(element, null)) return element;
            case (?(element, next_list)) return (l<T>(next_list));
        };
    };

    //challenge 9
    public func size<T>(l: List<T>): Nat {
         func _size<T>(list : List<T>, n : Nat) : Nat {
            switch(list){
                case(null) return n;
                case(?(_, next_list)) return (_size<T>(next_list, n + 1));
            };
        };
        _size(l, 0);
    };

    //challenge 10
    public func get<T>(list : List<T>, n : Nat) : ?T {
        switch(list, n){
            case(null, _) return null;
            case(?(element, next_list),0) return element;
            case(?(element, next_list), n) return get<T>(next_list, n - 1); 
        };
    };
};