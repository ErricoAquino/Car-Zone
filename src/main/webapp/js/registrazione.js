
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var errorElement = document.getElementById("passwordError");

            if (password !== confirmPassword) {
                errorElement.textContent = "Le password non corrispondono!";
                return false;
            } else {
                errorElement.textContent = "";
            }
            return true;
        }
    