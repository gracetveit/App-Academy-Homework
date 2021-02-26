function dinerBreakfast() {
    let orders:Array<string> = ["cheesy scrambled eggs"];
    console.log("I'd like " + orders[0] + " please.");
    
    return (order:string) => {
        orders.push(order);
        let repeated_order = "I'd like"
        orders.forEach(o => {repeated_order += ` ${o} and `});
        console.log(repeated_order.slice(0, -4) + "please.");
    }
}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");