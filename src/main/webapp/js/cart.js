

// Richiama tramite ajax la funzione di aggiunta al carrello di un prodotto con l'id indicato in input
function addToCart(productId)
 {
	// Inizializzazione variabile per gestire richieste HTTP
    var xmlhttp = new XMLHttpRequest();

	//Definizione della funzione per gestire la risposta del server
    xmlhttp.onreadystatechange = function() 
    {
        if (xmlhttp.readyState == XMLHttpRequest.DONE)  // XMLHttpRequest.DONE == 4
        {
           if (xmlhttp.status == 200) 
           {
               alert("Prodotto aggiunto al carrello")
           }
           else if (xmlhttp.status == 400) 
           {
              alert('There was an error 400');
           }
           else 
           {
               alert('something else other than 200 was returned');
           }
        }
    };
    
    // Definizione parametri da inviare al server
	var payload = 
	{
	    productId: productId
	};
	
	// Conversione payload in una stringa JSON
	var jsonPayload = JSON.stringify(payload);

	// Impostazione parametri richiesta
    xmlhttp.open("POST", "http://localhost/Car-Zone/CarrelloServlet", true);
    
    // Imposta l'intestazione della richiesta per indicare che il payload è in formato JSON
	xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");	
	
	// Invia la richiesta con il payload JSON
	xmlhttp.send(jsonPayload);
}