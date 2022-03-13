    // Variabili globali per i 4 elenchi
    var elencoSomma;
    var elencoSottr;
    var elencoMolt;
    var elencoDiv;

    // CLASSE ELENCO 
    function MioElenco(id_result){
        this.id_result = id_result;
        this.contatore = 0;
        this.Elenco = new Array(1);
        
        this.addToElenco = function( elemento ){
            this.Elenco[this.contatore] = elemento;
            this.contatore ++;
        }

        this.showElenco = function(){
            var nodo = document.getElementById(this.id_result);
            var i;
            for (i=0; i < this.contatore; i++){
                if( i==0)
                    nodo.innerHTML = this.Elenco[i];
                else
                    nodo.innerHTML += "<br/>" + this.Elenco[i];
            }
        }
        
        this.Svuota = function(){
            var nodo = document.getElementById(this.id_result);
            // rimetto il testo iniziale dentro l'elemento
            nodo.innerHTML = "Qui il risultato:";
            this.contatore = 0;
        }
    }

    // OPERAZIONI 
    var fsomma=function (v1, v2){
        var r = v1 + v2;
        var testo = "" + v1 + "+" + v2 + "=" + r;
        return testo;   
    }

    var fdifferenza=function (v1, v2){
        var r = v1 - v2;
        var testo = "" + v1 + "-" + v2 + "=" + r;
        return testo;   
    }

    var fprodotto=function (v1, v2){
        var r = v1 * v2;
        var testo = "" + v1 + "*" + v2 + "=" + r;
        return testo;   
    }

    var fdivisione=function (v1, v2){
        var r = v1 / v2;
        var testo = "" + v1 + "/" + v2 + "=";
        if (v2 != 0){
            r = v1 / v2;
            testo += r;
            } else {
                testo += "impossibile";
                }
        return testo;   
    }

    // Gli fornisco qui il nome dell'elenco dove operare
    function Calcola(operazione, elenco) {
        var v1=parseInt(document.forms.myForm.op1.value);
        var v2=parseInt(document.forms.myForm.op2.value);
        if (isNaN(v1))
            v1 = 0;
        if (isNaN(v2))
            v2 = 0;
        var testo = operazione(v1,v2);
        elenco.addToElenco(testo);
        elenco.showElenco();
    }

    function Svuota(){
        elencoSomma.Svuota();
        elencoSottr.Svuota();
        elencoDiv.Svuota();
        elencoMolt.Svuota();
    }

    function Inizializza(){
        //Inizializzo gli elenchi qui
        elencoSomma = new MioElenco("risultati_somme");
        elencoSottr = new MioElenco("risultati_differenze");
        elencoDiv = new MioElenco("risultati_divisioni");
        elencoMolt= new MioElenco("risultati_prodotti");
        Svuota();
    }
