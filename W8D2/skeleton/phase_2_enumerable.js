Array.prototype.myEach = function (callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    };
};

const double = function (num) {
    return num * 2;
};

let arr = [1, 2, 3, 4, 5]

// console.log(arr);

Array.prototype.myMap = function (callback) {
    let result = [];
    this.myEach(ele => {
        result.push(callback(ele));
    });
    return result;
};

// console.log(arr.myMap(double));

Array.prototype.myReduce = function(callback, initialValue) {
    let j = 0;
    let acc = initialValue;
    if (!initialValue) {
        acc = this[0];
        j = 1;
    };
    
    for (let i = j; i < this.length; i++) {
        acc = callback(acc, this[i]);
    };
    return acc;
};

let arr2 = [1, 2, 3];

console.log(arr2.myReduce(function(acc, el) {
    return acc + el;
})); // 6
  

console.log(arr2.myReduce(function(acc, el) {
    return acc + el;
}, 25)); // 31