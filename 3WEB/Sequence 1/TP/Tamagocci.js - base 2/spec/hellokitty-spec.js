describe("HelloKitty", function() {

    var helloKitty
        , goodPicture = "hk_good.gif"
        , badPicture = "hk_bad.gif"
        , deadPicture = "hk_dead.png";

    beforeEach(function() {
        helloKitty = new HelloKitty();
    });

    it("must have a Tamagocci as Prototype", function() {
        // Then
        expect(helloKitty instanceof Tamagocci).toBe(true);
    });

    it("must return a happy picture after birth", function() {
        // Then
        expect(helloKitty.getPicture()).toBe(goodPicture);
    });

    it("must return a bad picture when weight is less than 3 units over min weight", function() {
        // When
        helloKitty.weight = helloKitty.minWeight + 2;

        // Then
        expect(helloKitty.getPicture()).toBe(badPicture);
    });

    it("must return a bad picture when weight is more than 3 units under max weight", function() {
        // When
        helloKitty.weight = helloKitty.maxWeight - 2;

        // Then
        expect(helloKitty.getPicture()).toBe(badPicture);
    });

    it("must return a bad picture when happiness is less than 3", function() {
        // When
        helloKitty.happiness = 2;

        // Then
        expect(helloKitty.getPicture()).toBe(badPicture);
    });

    it("must return a dead picture when is dead", function() {
        // When
        helloKitty.happiness = 0;

        // Then
        expect(helloKitty.getPicture()).toBe(deadPicture);
    });

});