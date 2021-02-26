import {isPrime} from "./isPrime";

function sumOfNPrimes(n:number) {
    let sum:number = 0;
    let prime:number = 2;
    for (let index = 0; index < n; index++) {
        sum += prime;
        ++prime;
        while (!isPrime(prime)) {
            ++prime;
        }
    }
    return(sum);
}