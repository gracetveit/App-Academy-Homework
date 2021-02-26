function titleize(names:Array<string>, callback:Function) {
    let new_arr = names.map( x => {
        let first_char = x.charAt(0).toUpperCase();
        let name = first_char + x.slice(1);
        return(`Mx. ${name} Jingleheimer Schmidt`)
    });
    new_arr.forEach(e => callback(e));
}

function printCallback(e:any) {
    console.log(e)
}

titleize(["Mary", "Brian", "Leo"], printCallback);