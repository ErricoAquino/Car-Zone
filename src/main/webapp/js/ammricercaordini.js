
 
   
        function searchFunction(type) {
            var input, filter, table, tr, td, i, txtValue, startDate, endDate;
            if (type === 'users') {
                input = document.getElementById("searchBarUsers");
                filter = input.value.toUpperCase();
                table = document.getElementById("itemsTableUsers");
            } else if (type === 'orders') {
                input = document.getElementById("searchBarOrders");
                filter = input.value.toUpperCase();
                startDate = document.getElementById("startDateOrders").value;
                endDate = document.getElementById("endDateOrders").value;
                table = document.getElementById("itemsTableOrders");
            }
            tr = table.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                if (td.length > 0) {
                    var found = false;

                    // Check for orders table and filter by ID Account
                    if (type === 'orders') {
                        // Check if date range is applied
                        if ((startDate || endDate) && td[4]) {
                            var orderDate = new Date(td[4].textContent);
                            var start = startDate ? new Date(startDate) : null;
                            var end = endDate ? new Date(endDate) : null;

                            if ((start && orderDate < start) || (end && orderDate > end)) {
                                tr[i].style.display = "none";
                                continue;
                            }
                        }

                        // Only search in ID Account column (index 1)
                        txtValue = td[1].textContent || td[1].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            found = true;
                        }
                    } else if (type === 'users') {
                        // Search in all columns for users table
                        for (var j = 0; j < td.length; j++) {
                            if (td[j]) {
                                txtValue = td[j].textContent || td[j].innerText;
                                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                    found = true;
                                    break;
                                }
                            }
                        }
                    }

                    tr[i].style.display = found ? "" : "none";
                }
            }
        }
    
