import Cycel "mo:base/ExperimentalCycles";

actor Caller {
    public func withdraw_cycles(): async () {
        assert(Cycel.available() > 0);
        Cycel.accept(Cycel.available());
    }
}