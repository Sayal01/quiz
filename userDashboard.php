<?php
session_start();
if (!isset($_SESSION["userid"])) {
    header("Location: userLogin.php");
    exit;
}

include 'connection.php';

$userID = $_SESSION['userid'];

$query = "SELECT * FROM user WHERE user_id = $userID";
$result = mysqli_query($con, $query);
$user = mysqli_fetch_assoc($result);

if (!$user) {
    echo "User not found!";
    exit;
}

$errors = array();
// Handle username change
if (isset($_POST['changeUsername'])) {
    $newUsername = mysqli_real_escape_string($con, $_POST['newUsername']);

    // Validate new username
    if (empty($newUsername)) {
        $errors['newUsername'] = "New username is required.";
    } else {
        // Check if the new username is already taken
        $checkUsernameQuery = "SELECT user_id FROM user WHERE username = '$newUsername' AND user_id != $userID";
        $checkUsernameResult = mysqli_query($con, $checkUsernameQuery);
        if (mysqli_num_rows($checkUsernameResult) > 0) {
            $errors['newUsername'] = "This username is already taken.";
        }
    }

    // Update new username in the database
    if (empty($errors)) {
        $updateUsernameQuery = "UPDATE user SET username = '$newUsername' WHERE user_id = $userID";
        if (mysqli_query($con, $updateUsernameQuery)) {
            $_SESSION['usernameChanged'] = true; // Set session variable
            header("Location: " . $_SERVER['PHP_SELF']); // Redirect back to the same page
            exit(); // Make sure to exit after redirection
        } else {
            echo "Error updating username: " . mysqli_error($con);
        }
    }
}


// Handle password change
if (isset($_POST['changePassword'])) {
    $currentPassword = mysqli_real_escape_string($con, $_POST['currentPassword']);
    $newPassword = mysqli_real_escape_string($con, $_POST['newPassword']);
    $confirmNewPassword = mysqli_real_escape_string($con, $_POST['confirmNewPassword']);

    // Validate current password
    $currentPasswordQuery = "SELECT password FROM user WHERE user_id = $userID";
    $currentPasswordResult = mysqli_query($con, $currentPasswordQuery);
    $hashedCurrentPassword = mysqli_fetch_assoc($currentPasswordResult)['password'];

    if (!password_verify($currentPassword, $hashedCurrentPassword)) {
        $errors['currentPassword'] = "Incorrect current password.";
    }

    // Validate and match new password and confirm password
    if (empty($newPassword)) {
        $errors['newPassword'] = "New password is required.";
    } elseif (strlen($newPassword) < 6) {
        $errors['newPassword'] = "Password must be at least 6 characters long.";
    } elseif ($newPassword !== $confirmNewPassword) {
        $errors['confirmNewPassword'] = "Passwords do not match.";
    }


    if (empty($errors)) {
        $hashedNewPassword = password_hash($newPassword, PASSWORD_DEFAULT);
        $updatePasswordQuery = "UPDATE user SET password = '$hashedNewPassword' WHERE user_id = $userID";
        if (mysqli_query($con, $updatePasswordQuery)) {
            $_SESSION['passwordChanged'] = true; 
            header("Location: " . $_SERVER['PHP_SELF']); 
            exit(); 
        }
    }
}


?>

<!DOCTYPE html>
<html>

<head>
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        /* Add your additional CSS styles here */
        h1,
        h2,
        h3 {
            text-align: center;
        }

        form {
            margin: 20px auto;
            max-width: 400px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        input[type="text"],
        input[type="password"] {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .error {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }

        button {
            background-color: #555;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #333;
        }
    </style>
</head>

<body>
    <h1>User Profile</h1>
    <h2>Welcome, <?php echo $user['username']; ?></h2>

    <h3>Change Username</h3>
    <form method="post">
        <input type="text" name="newUsername" placeholder="New Username" value="<?php echo isset($_POST['newUsername']) ? $_POST['newUsername'] : ''; ?>" required>
        <?php if (isset($errors['newUsername'])) : ?>
            <div class="error"><?php echo $errors['newUsername']; ?></div>
        <?php endif; ?>
        <button type="submit" name="changeUsername">Change Username</button>
    </form>

    <h3>Change Password</h3>

    <form method="post">
        <input type="password" name="currentPassword" placeholder="Current Password" required>
        <?php if (isset($errors['currentPassword'])) : ?>
            <div class="error"><?php echo $errors['currentPassword']; ?></div>
        <?php endif; ?>

        <input type="password" name="newPassword" placeholder="New Password" required>
        <?php if (isset($errors['newPassword'])) : ?>
            <div class="error"><?php echo $errors['newPassword']; ?></div>
        <?php endif; ?>

        <input type="password" name="confirmNewPassword" placeholder="Confirm New Password" required>
        <?php if (isset($errors['confirmNewPassword'])) : ?>
            <div class="error"><?php echo $errors['confirmNewPassword']; ?></div>
        <?php endif; ?>

        <button type="submit" name="changePassword">Change Password</button>
    </form>
    <div style="text-align: center;">
        <button><a href="homepage.php" style="color: white; text-decoration: none;">BACK</a></button>
    </div>
</body>

</html>
<?php if (isset($_SESSION['usernameChanged']) && $_SESSION['usernameChanged']) : ?>
    <script>
        alert('Username changed successfully.');
        <?php unset($_SESSION['usernameChanged']); ?>
    </script>
<?php endif; ?>

<?php if (isset($_SESSION['passwordChanged']) && $_SESSION['passwordChanged']) : ?>
    <script>
        alert('Password changed successfully.');
        <?php unset($_SESSION['passwordChanged']); ?> 
    </script>
<?php endif; ?>