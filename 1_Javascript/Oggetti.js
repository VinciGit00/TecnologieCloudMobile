//Metodo 1
//Creazione di un oggetto
//Questo metodo va bene solo quando creo un solo
//oggetto e poi non lo uso altre volte
pers = new Object();
pers.nome = "Marco";
pers.age = 40;

console.log("Nome dell'oggetto: " + pers.nome);
console.log("età dell'oggetto: " + pers.age);

//Aggiungo un metodo all'oggetto
pers.run = function() {
    this.state = "running";
    this.speed = "4 m/s";
}
//Successivamente devo chiamare il metodo per aggiungre i campi
pers.run();
console.log(pers.speed)


//Metodo 2: clonazione
//Creo una classe, in questo modo l'oggetto è scalabile
function Person (pname, page) {
    this.name = pname;
    this.age  = page;
     
    //Definizione del metodo
    this.run = function () 
    {
     this.state = "running";
     this.speed = "4 m/s";
    }
}

//Creazione dell'oggetto
var pers = new Person("marco", 20);
pers.run();
console.log(pers.name)
console.log(pers.speed)

//Metodo 3
// ; sostituito con ,
// = sostituito con :
// non si usa il this.
persona2 = {
    name : "Marco",
    age : 40,
    run :  function() {
        this.state = "running";
        this.speed = "4 m/s"; 
    }
}

persona2.run();
console.log(persona2.state);







