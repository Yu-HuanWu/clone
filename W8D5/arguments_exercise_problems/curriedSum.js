function curriedSum(numArgs) {
    const numbers= [];
    return function _curriedSum(num){
        numbers.push(num);
        // console.log(numbers.reduce((acc, el) => acc+ el));
        // return _curriedSum;

        if (numbers.length === numArgs) {
            let result = 0;
            for(let i=0; i<numbers.length; i++){
                result+=numbers[i];
            };
            console.log(result);
        } else {
            return _curriedSum;
        }
    };
}


const sum = curriedSum(4);
sum(5)(30); // => 56
sum(11);
sum(10)