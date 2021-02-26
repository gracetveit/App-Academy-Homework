export function isPrime(n:number) {
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