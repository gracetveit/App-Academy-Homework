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

    // paradeHelper() {
    //     console.log(`${this.name} is trotting by!`)
    // }

    private randomTrick() {
        return Math.floor(Math.random() * Math.floor(this.tricks.length));
    }
}

function paradeHelper(elephant:Elephant) {
    console.log(`${elephant.name} is trotting by!`)
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

herd.forEach(paradeHelper);