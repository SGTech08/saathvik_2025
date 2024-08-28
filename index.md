---
layout: base
title: Student Home 
description: Home Page
hide: true
---

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #111;
            color: #f5f5f5;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
        }
        h1 {
            color: #00ff7f;
        }
        .section {
            margin: 20px 0;
        }
        .section h2 {
            border-bottom: 2px solid #00ff7f;
            padding-bottom: 10px;
            color: #ffd700;
        }
        .section p, .section ul {
            margin: 10px 0;
        }
        .games ul {
            list-style-type: none;
            padding: 0;
        }
        .games li {
            margin: 10px 0;
        }
        .games a {
            color: #1e90ff;
            text-decoration: none;
        }
        .games a:hover {
            text-decoration: underline;
        }
        .trivia form {
            margin-top: 15px;
        }
        .trivia label {
            display: block;
            margin: 10px 0;
        }
        .social-buttons {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
        .social-button {
            display: flex;
            align-items: center;
            background-color: #333;
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .social-button i {
            margin-right: 8px;
        }
        .social-button.github { background-color: #6e5494; }
        .social-button.twitter { background-color: #1da1f2; }
        .social-button.linkedin { background-color: #0077b5; }
        .social-button.instagram { background-color: #e1306c; }
        .social-button:hover {
            background-color: #555;
        }
        footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.9em;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Saathvik's CSA Portfolio 🌴</h1>
        <p>Welcome to my page! As you can see I am a aspiring computer engineer hoping to advance my skills with this portfolio project. Thank you for visiting and make sure to check out my socials so we can connect!</p>

        <div class="section games">
            <h2>🎮 Games</h2>
            <p>These are some simple games I made or experimented with:</p>
            <ul>
                <li><a href="#">Snake</a>: The classic snake game made by outside sources; I experimented with it last year to understand how it would work.</li>
                <li><a href="#">Dodging Game</a>: A dodging game I made with my partner last year, which involves event listeners and boundaries. ChatGPT helped us a lot with this game.</li>
            </ul>
        </div>

        <div class="section trivia">
            <h2>⭐ Trivia Quiz about Me</h2>
            <p>Take this quiz about me. Try to get all of them correct!</p>
            <form>
                <label>
                    What is my favorite color?
                    <input type="radio" name="color" value="blue"> Blue
                    <input type="radio" name="color" value="red"> Red
                    <input type="radio" name="color" value="green"> Green
                    <input type="radio" name="color" value="purple"> Purple
                </label>
                <label>
                    What is my favorite hobby?
                    <!-- Add more questions here as needed -->
                </label>
            </form>
        </div>

        <div class="section social">
            <h2>🌐 Connect with Me</h2>
            <p>Follow me on my social media platforms:</p>
            <div class="social-buttons">
                <a href="https://github.com/SGTech08" class="social-button github" target="_blank">
                    <i class="fab fa-github"></i> GitHub
                </a>
                <a href="https://twitter.com/" class="social-button twitter" target="_blank">
                    <i class="fab fa-twitter"></i> Twitter
                </a>
                <a href="https://www.linkedin.com/in/saathvik-gampa-622bbb2b9/" class="social-button linkedin" target="_blank">
                    <i class="fab fa-linkedin"></i> LinkedIn
                </a>
                <a href="https://instagram.com/saathvik.g08" class="social-button instagram" target="_blank">
                    <i class="fab fa-instagram"></i> Instagram
                </a>
            </div>
        </div>
    </div>

    <footer>
        &copy; 2024 [Saathvik]. All rights reserved.
    </footer>
</body>
</html>