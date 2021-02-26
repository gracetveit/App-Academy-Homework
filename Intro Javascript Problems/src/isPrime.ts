function isPrime(n:number) {
    if ([1, 2].includes(n)) {
        return true;
    } else if (n === 0){
        return false;
    }
    
    for (let index = 2; index < n; index++) {
        if (n % index === 0) {
            return false;
        }
    }
    
    return true;
}

console.log(isPrime(2));
console.log(isPrime(0));
console.log(isPrime(10));
console.log(isPrime(15485863));
console.log(isPrime(3548563));