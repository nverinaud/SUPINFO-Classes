describe("Tamagocci", function() {

    var tamagocci
        , initialWeight = 5
        , initialHappiness = 5
        , initialAge = 0
        , initialMinWeight = 1
        , initialMaxWeight = 10
        , goodPicture = "pk_good.gif"
        , badPicture = "pk_bad.gif"
        , deadPicture = "pk_dead.gif";

    beforeEach(function() {
        tamagocci = new Tamagocci();
    });

    it("at birth, weight must be 5, minWeight 1, maxWeight 10, age 0 and happiness 5", function() {
        // Then
        expect(tamagocci.weight).toBe(initialWeight);
        expect(tamagocci.happiness).toBe(initialHappiness);
        expect(tamagocci.age).toBe(initialAge);
        expect(tamagocci.minWeight).toBe(initialMinWeight);
        expect(tamagocci.maxWeight).toBe(initialMaxWeight);
    });

    it("when eat, weight must increase by 2", function() {
        // When
        tamagocci.eat();

        // Then
        expect(tamagocci.weight).toBe(initialWeight + 2);
    });

    it("when play, weight must decrease by 1 and happiness increase by 1", function() {
        // When
        tamagocci.play();

        // Then
        expect(tamagocci.weight).toBe(initialWeight - 1);
        expect(tamagocci.happiness).toBe(initialWeight + 1);
    });

    it("when become older, age, min weight and max height must increase by 1 and happiness must decrease by 1", function() {
        // When
        tamagocci.becomeOlder();

        // Then
        expect(tamagocci.age).toBe(initialAge + 1);
        expect(tamagocci.minWeight).toBe(initialMinWeight + 1);
        expect(tamagocci.maxWeight).toBe(initialMaxWeight + 1);
        expect(tamagocci.happiness).toBe(initialHappiness - 1);
    });

    it("must die when weight get lower than min weight", function() {
        // When
        tamagocci.weight = tamagocci.minWeight - 1;

        // Then
        expect(tamagocci.isDead()).toBe(true);
    });

    it("must die when weight get greater than max weight", function() {
        // When
        tamagocci.weight = tamagocci.maxWeight + 1;

        // Then
        expect(tamagocci.isDead()).toBe(true);
    });

    it("must die when happiness fall to zero", function() {
        // When
        tamagocci.happiness = 0;

        // Then
        expect(tamagocci.isDead()).toBe(true);
    });

    it("must not be dead when born", function() {
        // Then
        expect(tamagocci.isDead()).toBe(false);
    });

    it("must not die when happiness equals 1", function() {
        // When
        tamagocci.happiness = 1;

        // Then
        expect(tamagocci.isDead()).toBe(false);
    });

    it("must not die when weight equals max weight", function() {
        // When
        tamagocci.weight = tamagocci.maxWeight;

        // Then
        expect(tamagocci.isDead()).toBe(false);
    });

    it("must not die when weight equals min weight", function() {
        // When
        tamagocci.weight = tamagocci.minWeight;

        // Then
        expect(tamagocci.isDead()).toBe(false);
    });

    it("must return a happy picture after birth", function() {
        // Then
        expect(tamagocci.getPicture()).toBe(goodPicture);
    });

    it("must return a bad picture when weight is less than 3 units after min weight", function() {
        // When
        tamagocci.weight = tamagocci.minWeight + 2;

        // Then
        expect(tamagocci.getPicture()).toBe(badPicture);
    });

    it("must return a bad picture when weight is more than 3 units before max weight", function() {
        // When
        tamagocci.weight = tamagocci.maxWeight - 2;

        // Then
        expect(tamagocci.getPicture()).toBe(badPicture);
    });

    it("must return a bad picture when happiness is lesser than 3", function() {
        // When
        tamagocci.happiness = 2;

        // Then
        expect(tamagocci.getPicture()).toBe(badPicture);
    });

    it("must return a dead picture when is dead", function() {
        // When
        tamagocci.happiness = 0;

        // Then
        expect(tamagocci.getPicture()).toBe(deadPicture);
    });

});