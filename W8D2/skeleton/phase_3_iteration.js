Array.prototype.bubbleSort= function() {
    let done = false;
    while (!done) {
        done= true;
        for (let i=0; i< this.length-1; i++) {
            if (this[i]>this[i+1]) {
                let temp= this[i];
                this[i]= this[i+1];
                this[i+1]= temp;
                done= false;
            }
        }
    }
    return this;
}

// console.log([5, 3, 7, 1, 8].bubbleSort());

// String.prototype.substrings= function() {
//     let result=[];
//     for(let i=0; i<this.length; i++) {
//         for(let j= i+1; j<this.length+1; j++) {
//             result.push(this.slice(i,j))
//         }
//     }
//     return result;
// }

String.prototype.substrings = function () {
    let result = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = i; j < this.length; j++) {
            result.push(this.slice(i, j+1)) //not inclusive of j+1
        }
    }
    return result;
}

// console.log("string".substrings());

