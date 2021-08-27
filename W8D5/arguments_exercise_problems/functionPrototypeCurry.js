Function.prototype.curry = function(numArgs) {
    let numbers= [];
    let that= this;
    function _curriedSum(num) {
        numbers.push(num);
        console.log(this);
        if (numbers.length=== numArgs){
            return that(...numbers);
        } else {
            return _curriedSum;
        };
    };
    return _curriedSum;
};

function Add(...num) {
    let total=0;
    num.forEach(n=> {
        total+=n;
    });
    console.log(total);
}

let sum = Add.curry(2);
sum(5)(6);


