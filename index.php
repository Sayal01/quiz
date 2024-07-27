<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Quiz System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
         
            background-image: url('qz.jpg'); /* Background image */
            background-size: cover;
            background-position: center;
        }

        .container {
            max-width: 800px;
            margin: 182px auto;
    padding: 60px;
    box-shadow: -6px -4px 20px 14px rgb(13 13 13 / 70%);
            border-radius: 80px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .title {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 15px;
            color: rgba(231, 76, 60, 0.9);
        }

        .description {
            font-size: 20px;
            color: rgba(231, 76, 60, 0.9);;
            margin-bottom: 30px;
        }

        /* Button Styles */
        .start-button {
            display: inline-block;
            padding: 15px 40px;
            background-color: rgba(231, 76, 60, 0.9); /* Red color with transparency */
            color: #fff;
            font-size: 20px;
            font-weight: bold;
            text-decoration: none;
            border: none; /* Remove the border */
            border-radius: 8px;
            transition: background-color 0.3s ease-in-out;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Button Hover Effect */
        .start-button:hover {
            background-color: rgba(192, 57, 43, 0.9); /* Darker red color on hover with transparency */
        }

    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <h1 class="title">Welcome to the Online Quiz System</h1>
            <p class="description">Test your knowledge with our interactive quizzes!</p>
        </div>
        <a href="userLogin.php" class="start-button">Start Quiz</a>
    </div>
</body>

</html>
