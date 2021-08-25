const range = function (start, end) {
    let arr= [start];
    if (start === end) {
        return arr;
    }
    return arr.concat(range(start+1, end));
}

// console.log(range(11, 50))

// const sumRec = function (arr) {
//     if (arr.length === 0) {
//         return arr;
//     }
//     return Number(sumRec(arr.slice(0, arr.length-1)).toString()) + arr[arr.length-1]
// }

const sumRec = function (arr) {
    let sum = arr[arr.length-1];
    if (arr.length=== 1) {
        return sum
    }
    return sum+ sumRec(arr.slice(0, arr.length-1));
}

// console.log(sumRec([1, 2, 3, 4]));

const exponent = function (base, exp) {
    
    if (exp === 0) {
        return 1;
    }
    if (exp > 0) {
        return base * exponent(base, exp - 1);
    } else if (exp < 0) {
        return base * exponent(base, exp +1);
    }
    // still need fixing, but we are close!
    
}

console.log(exponent(8, -2));