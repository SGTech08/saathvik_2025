---
layout: base
title: Student Home 
description: Home Page
hide: true
---


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
            opacity: 0;
            transform: translateY(20px);
            animation: fadeIn 1s forwards ease-in-out;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h1 {
            color: #00ff7f;
            text-align: center;
        }

        .section {
            margin: 20px 0;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 1s forwards ease-in-out;
        }

        .section:nth-child(1) {
            animation-delay: 0.2s;
        }
        .section:nth-child(2) {
            animation-delay: 0.4s;
        }
        .section:nth-child(3) {
            animation-delay: 0.6s;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .section h2 {
            border-bottom: 2px solid #00ff7f;
            padding-bottom: 10px;
            color: #ffd700;
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
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .games a:hover {
            text-decoration: underline;
            color: #00ff7f;
            transform: scale(1.05);
        }

        .trivia form {
            margin-top: 15px;
        }

        .trivia label {
            display: block;
            margin: 10px 0;
        }

        .trivia button {
            background-color: #00ff7f;
            color: #111;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.2s ease, background-color 0.3s ease;
        }

        .trivia button:hover {
            background-color: #00cc66;
        }

        .trivia button:active {
            transform: scale(0.95);
        }

        .social-buttons {
            display: flex;
            gap: 10px;
            margin-top: 10px;
            justify-content: center;
        }

        .social-button {
            display: flex;
            align-items: center;
            background-color: #333;
            color: #fff;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            transition: transform 0.3s ease, background-color 0.3s ease;
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
            transform: scale(1.1);
        }

        footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.9em;
            color: #888;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 1s forwards ease-in-out;
            animation-delay: 0.8s;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Saathvik's CSA Portfolio 🌴</h1>
        <p>Welcome to my page! As you can see I am an aspiring computer engineer hoping to advance my skills with this portfolio project. Thank you for visiting and make sure to check out my socials so we can connect!</p>

        <div class="section games">
            <h2>🎮 Games and Mini Projects</h2>
            <p>These are some simple Projects I developed to further advance my skills:</p>
            <ul>
                <li><a href="https://sgtech08.github.io/student//2023/08/30/snake-game.html">Snake</a>: The classic snake game made by outside sources; I experimented with it last year to understand how it would work.</li>
                <li><a href="https://sgtech08.github.io/student//5.a/c4.1/2023/09/05/Pong-game_IPYNB_2_.html">Pong Game</a>: A Pong game I made with my partner last year, which involves event listeners and boundaries. ChatGPT helped us a lot with this game.</li>
                <li><a href="https://sgtech08.github.io/student//5.a/c4.1/2023/09/05/movie-searchapi.html">Movie Searcher</a>: First time using an API to fetch movies based on the search request made by the user. Funcitonality involves seasons and/or movies.</li>
                <li><a href="https://sgtech08.github.io/student//5.a/c4.1/2023/09/03/wikipedia-search.html">Wikipedia Search Bar</a>:Simple API request to wikipedia based on a term requested by a user. Program only shows the summary of the given term to eliminate redundancy.</li>
            </ul>
        </div>

