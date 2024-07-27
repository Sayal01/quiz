<?php
include "connection.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    if (isset($_POST['submit'])) {
        $email = $_POST['email'];
        $password = $_POST['password'];
        $userName = $_POST['userName'];

        // Server-side validation
        if (empty($email) || empty($password) || empty($userName)) {
            echo "<script>alert('All fields are required.');</script>";
        } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            echo "<script>alert('Invalid email format.');</script>";
        } elseif (strlen($password) < 6) {
            echo "<script>alert('Password must be at least 6 characters long.');</script>";
        } elseif ($_POST['password'] !== $_POST['rePassword']) {
            echo "<script>alert('Passwords do not match.');</script>";
        } else {
            $email = mysqli_real_escape_string($con, $email);
            $userName = mysqli_real_escape_string($con, $userName);
            $hashedPassword = password_hash($password, PASSWORD_DEFAULT); // Hash the password

            $checkQuery = "SELECT email FROM user WHERE email = '$email' OR username = '$userName'";
            $checkResult = mysqli_query($con, $checkQuery);

            if (mysqli_num_rows($checkResult) > 0) {
                echo "<script>alert('Sorry.. This email or username is already registered.');</script>";
            } else {
                $insertQuery = "INSERT INTO user (email, password, userName) VALUES ('$email', '$hashedPassword', '$userName')";
                if (mysqli_query($con, $insertQuery)) {
                    echo "<script>alert('Congrats.. You have successfully registered!');</script>";
                    header('Location: userLogin.php');
                    exit();
                } else {
                    echo "<script>alert('Error: " . mysqli_error($con) . "');
                    windwon
                    </script>";
                }
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link rel="stylesheet" href="css/register.css">
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {

            font-family: Arial, sans-serif;
            background-image: url('book.png');
            background-size: cover;
            background-repeat: no-repeat;

            background-color: rgba(227, 239, 255, 0.5);
        }

        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 10px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 14px;
            box-shadow: 0px 10px 20px 2px rgba(0, 25, 55, 0.7);
        }

        .container h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #C21E56;
        }

        .container hr {
            border: none;
            height: 1px;
            background-color: #ddd;
            margin-bottom: 30px;
        }

        .container form label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .container form input[type="text"],
        .container form input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .container form .password-toggle {
            position: relative;
        }


        .container form .password-toggle i {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #999;
        }

        .container form .password-toggle i:hover {
            color: #333;
        }

        .container form input[type="submit"] {
            background-color: #C21E56;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 14px;
        }

        .container form input[type="submit"]:hover {
            background-color: #45a049;
        }


        .container form p {
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
            color: #666;
        }

        .container form p a {
            color: #C21E56;
            text-decoration: none;
        }

        .container form p a:hover {
            text-decoration: underline;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
    <script>
        function validateForm() {
            var userNameInput = document.register.userName;
            var passwordInput = document.register.password;
            var rePasswordInput = document.register.rePassword;
            var emailInput = document.register.email;

            if (userNameInput.value === "") {
                alert("Username can't be blank");
                return false;
            } else if (userNameInput.value.length < 3) {
                alert("Username must be at least 3 characters long.");
                return false;
            }

            if (passwordInput.value.length < 6) {
                alert("Password must be at least 6 characters long.");
                return false;
            }

            if (rePasswordInput.value !== passwordInput.value) {
                alert("Passwords do not match.");
                return false;
            }

            if (emailInput.value === "") {
                alert("Email can't be blank");
                return false;
            } else if (!validateEmail(emailInput.value)) {
                alert("Invalid email format.");
                return false;
            }

            return true; 
        }

        function togglePasswordVisibility(inputId) {
            var passwordInput = document.getElementById(inputId);
            var toggleIcon = document.getElementById("toggle-" + inputId);

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                toggleIcon.classList.remove("fa-eye");
                toggleIcon.classList.add("fa-eye-slash");
            } else {
                passwordInput.type = "password";

                toggleIcon.classList.remove("fa-eye-slash");
                toggleIcon.classList.add("fa-eye");
            }
        }

        function validateEmail(email) {
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }
    </script>
</head>

<body>
    <header>

    </header>
    <div class="container">
        <form name="register" action="" method="post" onsubmit="return validateForm()">
            <h1>Registration</h1>
            <hr>
            <div>
                <label for="email">Email:</label>
                <input type="text" name="email" id="email">
            </div>
            <div>
                <label for="userName">Username:</label>
                <input type="text" name="userName" id="userName">
            </div>
            <div class="password-toggle">
                <label for="password">Password:</label>
                <input type="password" name="password" id="password">
                <i id="toggle-password" class="fas fa-eye" onclick="togglePasswordVisibility('password')"></i>
            </div>
            <div class="password-toggle">
                <label for="rePassword">Confirm Password:</label>
                <input type="password" name="rePassword" id="rePassword">
                <i id="toggle-rePassword" class="fas fa-eye" onclick="togglePasswordVisibility('rePassword')"></i>
            </div>
            <input type="submit" name="submit" value="Register">
            <p>Already have an account? <a href="userLogin.php">Sign in</a></p>
        </form>
    </div>
</body>

</html>