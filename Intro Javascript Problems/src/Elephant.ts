class Elephant {
    name: string;
    height: number;
    tricks: Array<string>;
    
    constructor(name:string, height:number, tricks:Array<string>) {
        this.name = name;
        this.height = height;
        this.tricks = tricks;
    }

    trumpet(){
        console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
    }
    
    grow(){
        this.height += 12;
    }
    
    addTrick(trick:string){
        this.tricks.push(trick);
    }

    play(){
        console.log(`${this.name} is ${this.tricks[this.randomTrick()]}`)
    }

    private randomTrick() {
        return Math.floor(Math.random() * Math.floor(this.tricks.length));
    }
}