
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>2D Game with Unit Content Display and Checkpoints</title>
    <style>
        canvas {
            background-color: #f0f0f0;
            display: block;
            margin: 20px auto;
            border: 2px solid #000;
        }
        #message {
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            color: black;
            margin-top: 20px;
        }
        #lessonContent {
            margin: 20px auto;
            width: 80%;
            font-size: 16px;
            font-family: Arial, sans-serif;
            background-color: #000; /* Black background */
            color: white; /* White text */
            padding: 20px;
            border-radius: 8px;
            border: 2px solid white; /* White border */
            box-shadow: 0px 4px 10px rgba(255, 255, 255, 0.2); /* Subtle white shadow */
            display: none; /* Hidden initially */
        }
        h3 {
            font-size: 22px;
            margin-bottom: 10px;
            color: white; /* Ensure headers are also white */
        }
        p {
            margin-bottom: 10px;
            line-height: 1.6;
        }
        ul {
            margin-bottom: 10px;
            padding-left: 20px;
        }
        li {
            margin-bottom: 5px;
        }
        pre {
            background-color: #333; /* Darker grey for code background */
            padding: 10px;
            border-left: 5px solid white; /* White border on code block */
            white-space: pre-wrap;
            word-wrap: break-word;
            margin-bottom: 10px;
            color: white; /* Ensure code text is white */
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid white;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #555;
        }
    </style>
</head>
<body>

<canvas id="gameCanvas" width="1000" height="600"></canvas>
<div id="message">You've reached an object!</div>
<div id="lessonContent"></div>

<script>
    const canvas = document.getElementById('gameCanvas');
    const ctx = canvas.getContext('2d');

    // Player properties
    const player = {
        x: 50,
        y: 50,
        width: 40,
        height: 40,
        speed: 4.9 // 30% slower than before
    };

    // Load the player image using the provided URL
    const playerImage = new Image();
    playerImage.src = 'https://banner2.cleanpng.com/20180705/azf/kisspng-pixel-art-clip-art-video-game-pixel-art-5b3ee7b2e0dde2.0247987815308492029211.jpg'; 

    // Ensure the player image is loaded before starting the game loop
    playerImage.onload = function() {
        gameLoop(); // Start the game loop once the image has loaded
    };

    // Array of objects (blocks) with their associated lesson content
    const objects = [
        {
            x: 100, y: 100, width: 100, height: 100, color: 'lightcoral', name: 'Unit 1', content: `
                <h3>Unit 1: Boolean Expressions and If Statements</h3>
                <p>This unit covers how to use boolean logic to make decisions in code using <code>if</code>, <code>else if</code>, and <code>else</code> statements.</p>
                <ul>
                    <li>Boolean expressions evaluate to either <code>true</code> or <code>false</code>.</li>
                    <li>Common operators include <code>&&</code> (and), <code>||</code> (or), and <code>!</code> (not).</li>
                    <li>The <code>if</code> statement executes a block of code if the condition is <code>true</code>.</li>
                    <li><code>else if</code> allows multiple conditions to be checked in sequence.</li>
                    <li><code>else</code> runs if none of the preceding conditions are true.</li>
                </ul>
                <pre><code>int age = 18;
if (age >= 18) {
  System.out.println("You are an adult.");
} else {
  System.out.println("You are a minor.");
}
boolean isRaining = false;
boolean hasUmbrella = true;
if (isRaining && !hasUmbrella) {
  System.out.println("Stay inside!");
} else {
  System.out.println("You can go out!");</code></pre>
            `
        },
        {
            x: 300, y: 100, width: 100, height: 100, color: 'lightblue', name: 'Unit 2', content: `
                <h3>Unit 2: Iteration</h3>
                <p>Learn how to repeat tasks using loops. Covers <code>for</code>, <code>while</code>, and <code>do-while</code> loops.</p>
                <ul>
                    <li><code>for</code> loops are best when you know the number of iterations in advance.</li>
                    <li><code>while</code> loops continue to run as long as the condition is true.</li>
                    <li><code>do-while</code> loops always execute at least once, checking the condition afterward.</li>
                </ul>
                <pre><code>for (int i = 0; i < 5; i++) {
  System.out.println("Iteration: " + i);
}

int count = 1;
while (count <= 5) {
  System.out.println("Count: " + count);
  count++;
}

int n = 0;
do {
  System.out.println("Number: " + n);
  n++;
} while (n < 3);</code></pre>
            `
        },
        {
            x: 500, y: 100, width: 100, height: 100, color: 'lightgreen', name: 'Unit 3', content: `
                <h3>Unit 3: Arrays</h3>
                <p>Arrays are used to store multiple values in a single variable. This unit covers creating, accessing, and modifying arrays.</p>
                <ul>
                    <li>Arrays are zero-indexed, meaning the first element has index 0.</li>
                    <li>Array size is fixed when it is created.</li>
                    <li>Use loops to iterate through arrays efficiently.</li>
                    <li>Multi-dimensional arrays allow for grids or tables of data.</li>
                </ul>
                <pre><code>String[] colors = {"Red", "Green", "Blue"};
for (int i = 0; i < colors.length; i++) {
  System.out.println("Color: " + colors[i]);
}

int[] scores = new int[3];
scores[0] = 85;
scores[1] = 90;
scores[2] = 78;
System.out.println("Total: " + (scores[0] + scores[1] + scores[2]));</code></pre>
            `
        },
        {
            x: 100, y: 250, width: 100, height: 100, color: 'lightyellow', name: 'Unit 4', content: `
                <h3>Unit 4: ArrayLists</h3>
                <p>ArrayLists are dynamic arrays that can grow and shrink in size. They are part of Java’s <code>Collections</code> framework.</p>
                <ul>
                    <li>ArrayLists allow dynamic resizing, unlike regular arrays.</li>
                    <li>They can only hold objects, not primitive types (use <code>Integer</code> instead of <code>int</code>).</li>
                    <li>Common operations include adding, removing, and accessing elements using methods.</li>
                </ul>
                <pre><code>ArrayList&lt;Integer&gt; numbers = new ArrayList&lt;&gt;();
numbers.add(10);
numbers.add(20);
System.out.println("Sum: " + (numbers.get(0) + numbers.get(1)));

ArrayList&lt;String&gt; names = new ArrayList&lt;&gt;();
names.add("Alice");
names.add("Bob");
names.remove("Alice");
System.out.println("Remaining Names: " + names);</code></pre>
            `
        },
        {
            x: 300, y: 250, width: 100, height: 100, color: 'lightpink', name: 'Unit 5', content: `
                <h3>Unit 5: 2D Arrays</h3>
                <p>This unit extends the concept of arrays to two dimensions, like a table of rows and columns.</p>
                <ul>
                    <li>2D arrays are arrays of arrays, allowing for grids of data.</li>
                    <li>Elements in 2D arrays are accessed using two indices: row and column.</li>
                    <li>Useful for creating matrices, game boards, or any data that requires two dimensions.</li>
                </ul>
                <pre><code>int[][] grid = new int[2][2];
grid[0][0] = 1;
grid[0][1] = 2;
grid[1][0] = 3;
grid[1][1] = 4;
System.out.println("Grid Value: " + grid[1][1]);

String[][] board = {
  {"Rook", "Knight"},
  {"Bishop", "Queen"}
};
System.out.println("Piece at (1,0): " + board[1][0]);</code></pre>
            `
        },
        {
            x: 500, y: 250, width: 100, height: 100, color: 'lightseagreen', name: 'Unit 6', content: `
                <h3>Unit 6: Using Objects</h3>
                <p>This unit focuses on creating objects, using constructors, and calling methods in Java.</p>
                <ul>
                    <li>Objects are instances of classes that contain properties (attributes) and methods (functions).</li>
                    <li>Constructors initialize objects when they are created.</li>
                    <li>Methods allow objects to perform actions or return information.</li>
                </ul>
                <pre><code>// Object instantiation
Car myCar = new Car("Toyota", "Camry", 2020);
myCar.startEngine(); // Calling a method on the object

// Example with a constructor
Person student = new Person("John Doe", 21);
System.out.println(student.getName()); // Output: John Doe

// Updating object properties
student.setName("Jane Doe");
System.out.println(student.getName()); // Output: Jane Doe</code></pre>
            `
        },
        {
            x: 100, y: 400, width: 100, height: 100, color: 'lightsalmon', name: 'Unit 7', content: `
                <h3>Unit 7: Writing Classes</h3>
                <p>This unit covers how to create custom classes, define properties, and apply encapsulation using getters and setters.</p>
                <ul>
                    <li>Classes define the blueprint for objects.</li>
                    <li>Encapsulation means keeping some data private and only accessible through getters and setters.</li>
                    <li>Getters and setters allow controlled access to private class fields.</li>
                </ul>
                <pre><code>public class BankAccount {
    private double balance;
    public BankAccount(double initialBalance) {
        this.balance = initialBalance;
    }
    public double getBalance() {
        return balance;
    }
    public void deposit(double amount) {
        balance += amount;
    }
}

BankAccount myAccount = new BankAccount(1000);
myAccount.deposit(500);
System.out.println(myAccount.getBalance()); // Output: 1500</code></pre>
            `
        },
        {
            x: 300, y: 400, width: 100, height: 100, color: 'lightsteelblue', name: 'Unit 8', content: `
                <h3>Unit 8: Inheritance</h3>
                <p>Inheritance allows a class to inherit properties and behaviors from another class.</p>
                <ul>
                    <li>Inheritance helps create hierarchies by allowing subclasses to reuse code from a superclass.</li>
                    <li>Subclasses can override methods from the superclass to change their behavior.</li>
                    <li>Use <code>extends</code> to define inheritance relationships between classes.</li>
                </ul>
                <pre><code>class Animal {
    public void eat() {
        System.out.println("Eating...");
    }

class Dog extends Animal {
    public void bark() {
        System.out.println("Barking...");
    }</code></pre>
            `
        },
        {
            x: 500, y: 400, width: 100, height: 100, color: 'lightgoldenrodyellow', name: 'Unit 9', content: `
                <h3>Unit 9: Inheritance</h3>
                <p>This unit explains how to use inheritance in Java.</p>
                <ul>
                    <li>Inheritance allows code reuse by extending the functionality of a parent class.</li>
                    <li>Child classes inherit all public and protected fields and methods from the parent class.</li>
                    <li>Subclass constructors must call the superclass constructor if the superclass has a parameterized constructor.</li>
                </ul>
                <pre><code>class Animal {
    public void eat() {
        System.out.println("Eating...");
    }

class Dog extends Animal {
    public void bark() {
        System.out.println("Barking...");
    }</code></pre>
            `
        },
        {
    x: 850, y: 250, width: 100, height: 100, color: 'lightgrey', name: 'Checkpoints', content: `
        <h3>Checkpoints</h3>
        <table>
            <tr>
                <th>Assignment</th>
                <th>Points</th>
                <th>Grade</th>
                <th>Evidence</th>
            </tr>
            <tr>
                <td>Pull Request (Integration)</td>
                <td>2</td>
                <td>1.1 (Will get Fixed)</td>
                <td><a href="https://github.com/user-attachments/assets/20eca46f-2276-4d02-bcfd-4273bfcae78f" target="_blank">Evidence</a></td>
            </tr>
            <tr>
                <td>Relevancy Checklist (Peer)</td>
                <td>2</td>
                <td>1.755</td>
                <td><a href="https://aidanlau10.github.io/sprint2/csa/unit7-p1/unit7-7" target="_blank">Evidence</a></td>
            </tr>
            <tr>
                <td>Lesson (Group)</td>
                <td>1</td>
                <td>0.91</td>
                <td><a href="https://github.com/user-attachments/assets/55813912-eeb5-429a-933a-4a458ec17500" target="_blank">Evidence</a></td>
            </tr>
            <tr>
                <td>Homework, Popcorn Hacks</td>
                <td>1 x 8</td>
                <td>0.93+0.9+0.9+0.9+0.9+0.91 (2 not graded)</td>
                <td><a href="https://docs.google.com/spreadsheets/d/1sGQtZm9GI2Rze5F7Eh_P1CMNO8Fyag4bCtOT0ddARmc/edit?gid=0#gid=0" target="_blank">Proof</a></td>
            </tr>
            <tr>
                <td>Individual Contribution</td>
                <td>1</td>
                <td>0.89</td>
                <td><a href="https://github.com/user-attachments/assets/64cd2f5d-afe6-4da6-8d57-4bf8add6fe92" target="_blank">Evidence of Commits</a></td>
            </tr>
            <tr>
                <td>Personal Notebooks / Blogs</td>
                <td>1</td>
                <td>0.9</td>
                <td><a href="https://sgtech08.github.io/saathvik_2025/blogs/" target="_blank">Blogs</a></td>
            </tr>
            <tr>
                <th>Total</th>
                <th>12</th>
                <th>10.9/12</th>
                <th>90.83%</th>
            </tr>
        </table>
        <br/>
        <table>
            <tr>
                <th>Skill</th>
                <th>Points</th>
                <th>Grade</th>
                <th>Evidence</th>
            </tr>
            <tr>
                <td>Work Habits (Analytics)</td>
                <td>1</td>
                <td>0.9</td>
                <td><a href="https://github.com/sgtech08/saathvik_2025/graphs/contributors" target="_blank">Analytics</a></td>
            </tr>
            <tr>
                <td>Team Planning (Issue)</td>
                <td>1</td>
                <td>0.9</td>
                <td><a href="https://github.com/users/AidanLau10/projects/5?pane=issue&itemId=80308162&issue=AidanLau10%7Caidan_2025%7C6" target="_blank">Issue</a></td>
            </tr>
            <tr>
                <td>Presentation Memories</td>
                <td>1</td>
                <td>0.89</td>
                <td>We had a lot of memes in our team teach although not funny people laughed at them. We incorporated a card sort program to show how different sorting methods work.</td>
            </tr>
            <tr>
                <td>Grading and Feedback</td>
                <td>1</td>
                <td>0.91</td>
                <td><a href="https://github.com/user-attachments/assets/dc5517ab-f41b-4648-92d1-b7d3e068a642" target="_blank">Evidence</a></td>
            </tr>
            <tr>
                <td>Beyond Perfunctory</td>
                <td>1</td>
                <td>0.89</td>
                <td><a href="https://github.com/user-attachments/assets/bb3f5b58-dded-4965-81bc-ece4303daec6" target="_blank">Image</a></td>
            </tr>
            <tr>
                <th>Total</th>
                <th>5</th>
                <th>4.49/5</th>
                <th>89.8%</th>
            </tr>
        </table>
    `
}
    ];

    // Movement flags
    let keys = {};

    // Set up keydown and keyup events for movement
    window.addEventListener('keydown', (e) => {
        keys[e.key] = true;
    });

    window.addEventListener('keyup', (e) => {
        keys[e.key] = false;
    });

    // Game loop
    function gameLoop() {
    // Clear the canvas
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // Handle player movement
    if (keys['ArrowUp'] || keys['w']) player.y -= player.speed;
    if (keys['ArrowDown'] || keys['s']) player.y += player.speed;
    if (keys['ArrowLeft'] || keys['a']) player.x -= player.speed;
    if (keys['ArrowRight'] || keys['d']) player.x += player.speed;

    // Prevent player from moving out of bounds
    if (player.x < 0) player.x = 0;
    if (player.x + player.width > canvas.width) player.x = canvas.width - player.width;
    if (player.y < 0) player.y = 0;
    if (player.y + player.height > canvas.height) player.y = canvas.height - player.height;

    // Draw each object with its label and handle collision detection
    for (let i = 0; i < objects.length; i++) {
        const obj = objects[i];
        
        // Draw the block (unit)
        ctx.fillStyle = obj.color;
        ctx.fillRect(obj.x, obj.y, obj.width, obj.height);

        // Draw the label (Unit 1, Checkpoints, etc.)
        ctx.fillStyle = 'black';
        ctx.font = '16px Arial';
        ctx.fillText(obj.name, obj.x + 10, obj.y + 60); // Draw the text centered inside the block

        // Check for collision with the object
        if (isColliding(player, obj)) {
            // Display the message and lesson content
            document.getElementById('message').style.display = 'block';
            document.getElementById('lessonContent').innerHTML = obj.content;
            document.getElementById('lessonContent').style.display = 'block';
        }
    }

    // Draw the player using the image AFTER drawing the blocks
    ctx.drawImage(playerImage, player.x, player.y, player.width, player.height);

    // Repeat the game loop
    requestAnimationFrame(gameLoop);
}

// Simple collision detection function
function isColliding(rect1, rect2) {
    return rect1.x < rect2.x + rect2.width &&
           rect1.x + rect1.width > rect2.x &&
           rect1.y < rect2.y + rect2.height &&
           rect1.y + rect1.height > rect2.y;
}

    // Start the game loop only after the image is loaded
    gameLoop();
</script>

</body>