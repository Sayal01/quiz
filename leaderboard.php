<?php
session_start();
include 'connection.php';
if (!isset($_SESSION["username"])) {
    header("Location: userLogin.php");
    exit;
  }

// Retrieve the scores from the leaderboard table
$query = "SELECT u.username, l.score 
          FROM leaderboard l
          JOIN user u ON l.user_id = u.user_id
          ORDER BY l.score DESC";
$result = mysqli_query($con, $query);

$scores = array();
if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $username = $row['username'];
        $score = $row['score'];

        $scores[] = array(
            'username' => $username,
            'score' => $score
        );
    }
} else {
    echo "Error executing query: " . mysqli_error($con);
}

// Close the database connection
mysqli_close($con);
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leaderboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #9dced8;
            color: #000000;
        }

        h1 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        .navbar {
            background-color: #333;
            color: #fff;
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            /* Add this line to distribute items evenly */
        }

        .navbar h1 {
            font-size: 24px;
            margin: 0;
            padding: 0 20px;
        }

        .navbar ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
        }

        .navbar li {
            margin-right: 10px;
        }

        .navbar li:last-child {
            margin-right: 0;
        }

        .navbar li a {
            color: #fff;
            text-decoration: none;
        }

        .navbar li a:hover {
            background-color: #555;
            padding: 10px;
            background-color: chocolate;
            color: black;
        }

        .score-container p {
            margin: 0;
        }

        .logout-container {
            margin-left: 10px;

        }

        .logout-container a {
            display: inline-block;
            padding: 8px 16px;

            background-color: #555;
            color: #fff;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .logout-container a:hover {
            background-color: #000;
        }

        .ranking {
            display: flex;
            align-items: center;
        }

        .ranking-icon {
            margin-right: 10px;
        }

        .gold {
            color: gold;
        }

        .silver {
            color: silver;
        }

        .bronze {
            color: #cd7f32;
        }

        .ranking-icon i {
            font-size: 16px;
        }

        .profile-icon {
            position: relative;
            cursor: pointer;
            font-size: 24px;
        }

        .profile-info {
            display: none;
            position: absolute;
            margin-left: 10px;
            background-color: #fff;
            padding: 10px;
            border-radius: 4px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            top: 100%;
            right: 0;
            color: black;
            background-color: rgba(44, 130, 201);
            width: 200px;
        }

        .profile-icon:hover .profile-info {
            display: block;
        }
    </style>
</head>

<body>
<div class="navbar">
        <h1>Quizze</h1>
        <ul>
            <li><a href="homepage.php">Home</a></li>
            <li><a href="category.php">category</a></li>
            <li><a href="leaderboard.php">Leaderboard</a></li>

            <li class="profile-icon">
                <span>&#128100;</span>
                <div class="profile-info">
                    <p><?php echo "Hello, " . $_SESSION['username']; ?></p>
                    <p>Daily Score: <?php echo $_SESSION['daily_score']; ?></p>
                    <p><a href="userDashboard.php">setting</a></p>
                    <div class="logout-container">
                        <a href="logout.php">Logout</a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <div>

        <h1>Leaderboard</h1>
        
        <table>
        <tr>
            <th>Rank</th>
            <th>Username</th>
            <th>Score</th>
        </tr>
        <?php $rank = 1; ?>
        <?php foreach ($scores as $score) : ?>
            <tr>
                <td class="ranking">
                    <?php
                    $rankingClass = '';
                    if ($rank == 1) {
                        $rankingClass = 'gold';
                    } elseif ($rank == 2) {
                        $rankingClass = 'silver';
                    } elseif ($rank == 3) {
                        $rankingClass = 'bronze';
                    }
                    ?>
                    <span class="ranking-icon <?php echo $rankingClass; ?>">
                        <?php
                        if ($rankingClass == 'gold') {
                            echo '<i class="fas fa-trophy gold"></i>';
                        } elseif ($rankingClass == 'silver') {
                            echo '<i class="fas fa-trophy silver"></i>';
                        } elseif ($rankingClass == 'bronze') {
                            echo '<i class="fas fa-trophy bronze"></i>';
                        }
                        ?>
                    </span>
                    <?php echo $rank; ?>
                </td>
                <td>
                    <?php echo $score['username']; ?>
                </td>
                <td>
                    <?php echo $score['score']; ?>
                </td>
            </tr>
            <?php $rank++; ?>
            <?php endforeach; ?>
            
        </table>
    </div>
    </body>

</html>