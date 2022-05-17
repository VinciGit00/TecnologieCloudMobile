pers = {
  nome: "Marco",
  cognome: "Vinciguerra",

  //Creazione della funzione che aggiunge gli oggetti
  dati: function () {
    //Non posso usare la notazione di JSON
    this.nascita = "01/06/200";
  },
};

//Devo chiamare la funzione per attivare il contenuto
console.log("senza attivazione:");
console.log(pers.nascita);

//Devo chiamare la funzione per attivare il contenuto
console.log("con attivazione:");
pers.dati();
console.log(pers.nascita);
