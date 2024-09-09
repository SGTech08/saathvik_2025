---
layout: page
title: About
permalink: /about/
---


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Me</title>
    <style>
        body {
            background-color: #1d1d1d;
            color: white;
            font-family: 'Arial', sans-serif;
            padding: 20px;
            line-height: 1.6;
        }
        h1, h2 {
            color: #f9f9f9;
        }
        .flags {
            display: flex;
            gap: 20px;
            align-items: center;
        }
        .flags img {
            width: 100px;
        }
        .places {
            margin-top: 20px;
        }
        ul {
            list-style-type: none;
        }
        .places li::before {
            content: "🛤️ ";
            margin-right: 5px;
        }
        .passions {
            margin-top: 20px;
        }
        .passions li::before {
            content: "💡 ";
            margin-right: 5px;
        }
        footer {
            margin-top: 40px;
            font-size: 14px;
            color: #888;
        }
        /* Slider Styles */
        .slider {
            position: relative;
            max-width: 600px;
            margin: 50px auto;
            border-radius: 10px;
            overflow: hidden;
        }
        .slides {
            display: flex;
            transition: transform 0.5s ease-in-out;
        }
        .slides img {
            width: 100%;
            border-radius: 10px;
        }
        .slider-buttons {
            position: absolute;
            top: 50%;
            width: 100%;
            display: flex;
            justify-content: space-between;
            transform: translateY(-50%);
        }
        .prev, .next {
            background-color: rgba(255, 255, 255, 0.7);
            border: none;
            padding: 10px;
            cursor: pointer;
            font-size: 18px;
            border-radius: 50%;
        }
        .prev:hover, .next:hover {
            background-color: rgba(255, 255, 255, 1);
        }
    </style>
</head>
<body>
    <h1>About</h1>
    <section>
        <h2>As a Conversation Starter</h2>
        <p>Here are some places I have lived:</p>
        <div class="flags">
            <div>
                <img src="https://upload.wikimedia.org/wikipedia/en/4/41/Flag_of_India.svg" alt="India Flag">
                <p>India - Born</p>
            </div>
            <div>
                <img src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Flag_of_Washington.svg" alt="Washington Flag">
                <p>Washington - Moved in 1st Grade</p>
            </div>
            <div>
                <img src="https://upload.wikimedia.org/wikipedia/commons/f/f7/Flag_of_Texas.svg" alt="Texas Flag">
                <p>Texas - Years lived</p>
            </div>
            <div>
                <img src="https://upload.wikimedia.org/wikipedia/commons/0/01/Flag_of_California.svg" alt="California Flag">
                <p>California - Currently Living</p>
            </div>
        </div>
    </section>
    
    <section class="places">
        <h2>Journey through Life</h2>
        <p>Here is what I did at those places:</p>
        <ul>
            <li>🏫 Attended Obul Reddy School in India</li>
            <li>🇺🇸 Moved to USA in 1st Grade, attended Mira Mesa Elementary in Washington</li>
            <li>📚 Attended Ericson Elementary, Stone Ranch, Oak Valley, and now Del Norte High School in California</li>
        </ul>
    </section>

    <section>
        <h2>Places Visited</h2>
        <ul>
            <li>🌏 Australia - Visited</li>
            <li>🇯🇵 Japan - Visited</li>
        </ul>
    </section>

    <section class="passions">
        <h2>My Passions and Goals</h2>
        <ul>
            <li>With a deep appreciation for education, I enjoy challenging myself academically, often taking on rigorous coursework to push my limits and expand my knowledge.</li>
            <li>Outside the classroom, I have a passion for collecting shoes, finding joy in the unique designs and cultural significance each pair holds.</li>
            <li>In my free time, I unwind by playing video games, with Fortnite being my favorite, as it combines strategy and creativity in a way that resonates with me.</li>
            <li>My ultimate goal is to become a software engineer, a career path that aligns with my love for problem-solving and technology.</li>
            <li>I’ve also achieved significant recognition in DECA, where I earned 1st Place at both the state and district levels in Southern California, and qualified for the International Career Development Conference (ICDC) in my first year of competition.</li>
        </ul>
    </section>

    <section>
        <h2>My Favorite Foods</h2>
        <div class="slider">
            <div class="slides">
                <img src="https://images.unsplash.com/photo-1625079187536-bdd18b9e4f26" alt="Biryani">
                <img src="https://images.unsplash.com/photo-1546069901-eacef0df6022" alt="Pasta">
                <img src="https://images.unsplash.com/photo-1567331215102-c40d3a221e68" alt="Ice Cream">
            </div>
            <div class="slider-buttons">
                <button class="prev" onclick="moveSlides(-1)">❮</button>
                <button class="next" onclick="moveSlides(1)">❯</button>
            </div>
        </div>
    </section>

    <footer>
        <p>Thank you for taking your time out of your day to view my website. I hope you enjoyed learning more about me and my interests. If you have any questions or would like to connect, feel free to reach out to me through my socials. I look forward to hearing from you!</p>
        <p>- Saathvik Gampa</p>
        <p>Flags are made using Wikipedia images.</p>
    </footer>

    <script>
        let currentSlide = 0;

        function showSlides(index) {
            const slides = document.querySelector('.slides');
            const totalSlides = document.querySelectorAll('.slides img').length;

            currentSlide += index;

            if (currentSlide >= totalSlides) {
                currentSlide = 0;
            }
            if (currentSlide < 0) {
                currentSlide = totalSlides - 1;
            }

            slides.style.transform = `translateX(${-currentSlide * 100}%)`;
        }

        function moveSlides(index) {
            showSlides(index);
        }
    </script>
</body>
