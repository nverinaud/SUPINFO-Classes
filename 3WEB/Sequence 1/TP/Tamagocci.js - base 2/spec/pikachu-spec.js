describe("Pikachu", function() {

    var pikachu
        , goodPicture = "pk_good.gif"
        , badPicture = "pk_bad.gif"
        , deadPicture = "pk_dead.gif";

    beforeEach(function() {
        pikachu = new Pikachu();
    });

    it("must have a Tamagocci as Prototype", function() {
        // Then
        expect(pikachu instanceof Tamagocci).toBe(true);
    });

    it("must return a happy picture after birth", function() {
        // Then
        expect(pikachu.getPicture()).toBe(goodPicture);
    });

    it("must return a bad picture when weight is less than 3 units over min weight", function() {
        // When
        pikachu.weight = pikachu.minWeight + 2;

        // Then
        expect(pikachu.getPicture()).toBe(badPicture);
    });

    it("must return a bad picture when weight is more than 3 units under max weight", function() {
        // When
        pikachu.weight = pikachu.maxWeight - 2;

        // Then
        expect(pikachu.getPicture()).toBe(badPicture);
    });

    it("must return a bad picture when happiness is less than 3", function() {
        // When
        pikachu.happiness = 2;

        // Then
        expect(pikachu.getPicture()).toBe(badPicture);
    });

    it("must return a dead picture when is dead", function() {
        // When
        pikachu.happiness = 0;

        // Then
        expect(pikachu.getPicture()).toBe(deadPicture);
    });

});