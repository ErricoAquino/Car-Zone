
    document.addEventListener('DOMContentLoaded', function() {
        var searchInput = document.getElementById('searchQuery');
        var searchButton = document.getElementById('searchButton');

        searchButton.addEventListener('click', function() {
            var filter = searchInput.value.toLowerCase();
            var productElements = document.querySelectorAll('.casella');

            productElements.forEach(function(element) {
                var productName = element.querySelector('.marca').innerText.toLowerCase();
                
                if (productName.includes(filter)) {
                    element.style.display = 'block'; // Mostra il prodotto se il nome corrisponde alla ricerca
                } else {
                    element.style.display = 'none'; // Nasconde il prodotto se non corrisponde alla ricerca
                }
            });
        });
    });
