<!DOCTYPE html>
<html lang="en">    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MunozPhamBooks</title>
    <link rel="stylesheet" href="./style.css">
</head>
<body>
    <header>
        <h1>MunozPhamBooks</h1>
        <p>Your regular online bookstore for all your reading needs</p>
    </header>
    <nav class="navbar">
        <ul>
            <li><a href="index.php">Home</a></li>
            <li><a href="all_books.php">Books</a></li>
            <li class="dropdown-author">
                <a href="#">Authors ▼</a>
                <ul class="author-list-dropdown">
                    <!-- Author list will also be dynamically be loaded here -->
                </ul>
            </li>
            <li class="dropdown-genre">
                <a href="#">Genres ▼</a>
                <ul class="genre-list-dropdown">
                    <!-- Genre list will also be dynamically be loaded here -->
                </ul>
            </li>
            <li><a href="account_login.php">Account</a></li>
            <li><a href="contact_form.php">Contact Us</a></li>
        </ul>
    </nav>
    <main>
        <!-- The form to log in to the website -->
        <h2 class="section-title">Create an account</h2>
        <div class="account-container">
            <form id="register-form" method="POST" action="queries/registerUser.php">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                <br>
                <label for="email">E-mail address:</label>
                <input type="email" id="email" name="email" required>
                <br>
                <label for="phone">Phone number:</label>
                <input type="text" id="phone" name="phone" required>
                <br>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <br>
                <button type="submit">Create Account</button>
                <a href="account_login.php">Already have an account? Click here</a>
            </form>
        </div>
    </main>
    <footer>
        <p>&copy; 2026 MunozPhamBooks</p>
        <p>1 Rue Tralaland, 75000 Paris, France</p>
        <p>OPEN 6AM-7PM, only on Tuesday sometimes</p>
        <div id="date-and-clock"> 
            <!-- time will be displayed here -->
        </div>
    </footer>
    <script src="./app.js"></script>
</body>
</html>