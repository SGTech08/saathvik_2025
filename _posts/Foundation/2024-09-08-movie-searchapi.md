---
layout: post
title: JS API Movie and TV Series Search Box
description: This search box uses JavaScript API so extract details from The Movie Database using an API created at that website. It then formats it to produce 8 major details, the name, the movie/series's poster, overview, rating, release date, genre, Mpaa rating aswell as using the input from the dynamic script and using it to search for trailers about the movie across youtube. Most of the code was done using the air of helpful tools such as my family, friends and chat, but I've done the code of the CSS formatting, genre and Mpaa maping. 
toc: True
comments: True
type: hacks
---
<html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie/TV Series Search</title>
     <style>
        /* CSS styles for the search bar */
        #searchInput {
            width: 300px; 
            height: 40px; 
            font-size: 16px; 
            border-radius: 20px; 
            padding: 5px 10px; 
        }
    </style>

</head>
<body>
    <div class="container">
        <h1>Movie/TV Series Search</h1>
        <input type="text" id="searchInput" placeholder="Enter a movie or TV series name">
        <button id="searchButton">Search</button>
        <div id="result"></div>
    </div>

    <script>
        const searchInput = document.getElementById('searchInput');
        const searchButton = document.getElementById('searchButton');
        const resultDiv = document.getElementById('result');

        // TMDb API key (replace with your own)
        const apiKey = '8b9514e6242bb1620afcbec32775e783';

        // Genre mapping
        const genreMap = {
            28: "Action",
            12: "Adventure",
            16: "Animation",
            35: "Comedy",
            80: "Crime",
            99: "Documentary",
            18: "Drama",
            10751: "Family",
            14: "Fantasy",
            36: "History",
            27: "Horror",
            10402: "Music",
            9648: "Mystery",
            10749: "Romance",
            878: "Science Fiction",
            10770: "TV Movie",
            53: "Thriller",
            10752: "War",
            37: "Western",
            // Add more genre mappings as needed
        };


        // MPAA rating mapping
        const mpaaRatingMap = {
            "G": "General Audiences",
            "PG": "Parental Guidance Suggested",
            "PG-13": "Parents Strongly Cautioned",
            "TV-14": "For TV Shows above 14",
            "R": "Restricted",
            "NC-17": "Adults Only",
            "NR": "Not Rated",
            "Unrated": "Unrated",
            // Add more MPAA rating mappings as needed
        };
        

        // Language mapping
        const languageMap = {
            "en": "English",
            "es": "Spanish",
            "fr": "French",
            "de": "German",
            "el": "Greek",
            "ga": "Irish",
            "hi": "Hindi",
            "ru": "Russian",
            "ta": "Tamil",
            "zh": "Chinese",
            "ko": "Korean",
            // Add more language mappings as needed
        };

        // Event listener for the search button
        searchButton.addEventListener('click', () => {
            const searchTerm = searchInput.value.trim();

            if (searchTerm) {
                // Clear previous results
                resultDiv.innerHTML = '';

                // Call the function to fetch and display movie/TV series data
                fetchMovieData(searchTerm);
            }
        });

        // Function to fetch and display movie/TV series data
        function fetchMovieData(searchTerm) {
            // Construct the TMDb API URL for searching movies/TV series
            const apiUrl = `https://api.themoviedb.org/3/search/multi?api_key=${apiKey}&query=${encodeURIComponent(searchTerm)}`;

            // Make the API request
            fetch(apiUrl)
                .then((response) => response.json())
                .then((data) => {
                    if (data.results && data.results.length > 0) {
                        // Get the first result (most relevant)
                        const result = data.results[0];

                        // Extract relevant information
                        const title = result.title || result.name || "Title: N/A";
                        const overview = result.overview || "Overview: N/A";
                        const ratings = result.vote_average
                            ? `Ratings: ${result.vote_average} / 10`
                            : "Ratings: N/A";
                        const releaseDate = result.release_date || result.first_air_date || "Release Date: N/A";
                        const formattedReleaseDate = formatDate(releaseDate);
                        const genre = result.genre_ids
                            ? `Genre: ${getGenre(result.genre_ids)}`
                            : "Genre: N/A";
                        const mpaaRating = result.content_ratings
                            ? `MPAA Rating: ${getMPAARating(result.content_ratings)}`
                            : "MPAA Rating: N/A";
                        const originalLanguage = result.original_language
                            ? `Original Language: ${getOriginalLanguage(result.original_language)}`
                            : "Original Language: N/A";
                        const posterPath = result.poster_path
                            ? `https://image.tmdb.org/t/p/w300${result.poster_path}`
                            : "https://via.placeholder.com/300x450"; // Placeholder image if no poster available;
                        const youtubeTrailerLink = getYouTubeTrailerLink(searchTerm);

                        // Update the summary with selected information
                        const updatedSummary = `
                            <h2>${title}</h2>
                            <img src="${posterPath}" alt="${title} Poster" style="max-width: 300px; height: auto;">
                            <p>${overview}</p>
                            <p>${ratings}</p>
                            <p>${formattedReleaseDate}</p>
                            <p>${genre}</p>
                            <p>${mpaaRating}</p>
                            <p>${originalLanguage}</p>
                            <p><a href="${youtubeTrailerLink}" target="_blank">Watch Trailer on YouTube</a></p>
                        `;

                        resultDiv.innerHTML = updatedSummary;
                    } else {
                        resultDiv.innerHTML = '<p>No results found.</p>';
                    }
                })
                .catch((error) => {
                    console.error('Error fetching data from TMDb:', error);
                });
        }

        // Function to get the genre names based on genre IDs
        function getGenre(genreIds) {
            const genres = genreIds.map((id) => genreMap[id] || "Unknown");
            return genres.join(', ');
        }

        // Function to get the MPAA rating
        function getMPAARating(contentRatings) {
            if (contentRatings && contentRatings.length > 0) {
                const rating = contentRatings[0].rating;
                return mpaaRatingMap[rating] || rating;
            } else {
                return "N/A";
            }
        }

        // Function to get the full language name
        function getOriginalLanguage(languageCode) {
            return languageMap[languageCode] || "N/A";
        }

        // Function to format the date as month/day/year
        function formatDate(dateString) {
            if (!dateString) return "Release Date: N/A";

            const date = new Date(dateString);
            const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
            return "Release Date: " + date.toLocaleDateString('en-US', options);
        }

        // Function to construct a YouTube trailer link based on the search term
        function getYouTubeTrailerLink(searchTerm) {
            // Replace spaces with plus signs and add "trailer" for a more specific search
            const youtubeSearchQuery = encodeURIComponent(`${searchTerm} trailer`);
            return `https://www.youtube.com/results?search_query=${youtubeSearchQuery}`;
        }
    </script>
</body>
</html>







<br><br><br><br><br><br><br>

<h4>Different functions used in the code<h4>
<br>
1. 



<h4> Attribution </h4>

<center>
<img src = "_site/images/hellowe.png" alt= "The TMDb logo" width= "200" height= "200">
</center>
This product uses the TMDB API but is not endorsed or certified by TMDB