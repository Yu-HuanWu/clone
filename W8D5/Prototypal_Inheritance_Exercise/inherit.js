Function.prototype.inherits = function(SuperClass){
    function Surrogate(){};
    Surrogate.prototype = SuperClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}

function MovingObject (canMove) {
    this.canMove = canMove;
}

MovingObject.prototype.status = function(){
    console.log("can this ship move:" + this.canMove)
}

function Ship (canMove) {
    MovingObject.call(this, canMove);
}
Ship.inherits(MovingObject);

Ship.prototype.sails = function(){
    console.log("This ship is sailing" + this.canMove)
}

function Asteroid () {}
Asteroid.inherits(MovingObject);

const test = new MovingObject(true)
test.status()

const boat = new Ship(false)
boat.status()

boat.sails()

test.sails()
