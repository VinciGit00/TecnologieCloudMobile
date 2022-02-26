//Esempio basico di funzione
//Inserisco due numeri
k = somma(2,3);
console.log("Risultato della somma: "+k);

//Inserisco una stringa e un numero
var J = somma(2, "Pippo");
console.log("Risultato della somma: " + J);

function somma (X, Y) {
    return Z = X + Y;
}

//Funzioni senza nome -> assegno il nome ad una variabile
var fsomma = function (X, Y) {
    var r = X + Y;
    return r
}

//Ora chiamo la funzione 
var result = fsomma(2,3);
console.log("Funzione senza nome");
console.log(result);
