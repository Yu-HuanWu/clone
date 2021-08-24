Array.prototype.uniq = function() {
    let result= [];
    this.forEach(num => {
        if (!result.includes(num)) {
            result.push(num);
        }
    })
    return result;
}

// console.log([1, 2, 2, 3, 3, 3].uniq())

Array.prototype.twoSum = function() {
    let result = [];
    for(let i=0; i<this.length; i++) {
        for(let j=i+1; j<this.length; j++) {
            if (this[i]+this[j]===0) {
                result.push([i,j]);
            }
        }
    }
    return result;
}

// console.log([1, 2, -1, 0, 5, 0].twoSum());

Array.prototype.transpose = function() {
    let result = [];
    for(let i=0; i<this.length; i++) {
        let subresult= [];
        for(let j=0; j<this[i].length; j++) {
            subresult.push(this[j][i])
        }
        result.push(subresult);
    }
    return result;
}

// console.log([[1,2,3],[4,5,6],[7,8,9]].transpose());