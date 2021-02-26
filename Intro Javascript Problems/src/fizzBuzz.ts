const fizzBuzz = function(arr:Array<number>) {
    let new_arr:Array<number> = [];
    for (let i = 0; i < arr.length; i++){
        let el = arr[i];
        
        if (el % 3 != 0 && el % 5 != 0){
            continue;
        } else if (el % 3 === 0 && el % 5 === 0){
            continue;
        } else {
            new_arr.push(el);
        }
    }
    return(new_arr);
};