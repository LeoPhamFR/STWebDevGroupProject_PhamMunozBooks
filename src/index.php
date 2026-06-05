<?php
    session_start();
    if (isset($_SESSION['user_id'])) {
        $logged_in = true;
        $username = $_SESSION['username'];
    } else {
        $logged_in = false;
    }
?>
<script>
    const loggedIn = <?php echo json_encode($logged_in); ?>;
    window.loggedIn = loggedIn; // checks accessible in app.js
</script>
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
            <?php if ($logged_in): ?>
                <li class="dropdown-account">
                    <a href="#">Account ▼</a>
                    <ul class="account-menu-dropdown">
                        <li><a href="account_menu.php">Account: (<?php echo htmlspecialchars($username); ?>)</a></li>
                        <li><a href="account_logout.php">Logout</a></li>
                    </ul>
                </li>
            <?php else: ?>
                <li><a href="account_login.php">Account</a></li>
            <?php endif; ?>
            <?php if ($logged_in): ?>
                <li><a href="cart.php">Cart</a></li>
            <?php endif; ?>
            <li><a href="contact_form.php">Contact Us</a></li>
        </ul>
    </nav>
    <main>
        <div class="search-bar">
            <input type="text" id="main-search-input" placeholder="Search for books, authors, genres...">
            <button id="main-search-btn">Search</button>
        </div>
        <div class="featured-books-section">
            <h2 class="book-grid-title">Featured Books</h2>
            <div class="book-grid">
                <div id="books-container">
                    <!-- Books will be dynamically loaded here,thanks to AJAX (js) -->
                </div>
            </div>
        </div>

        <section id="events-grid">
            <!-- Placehoder, as it is not the main focus of the project -->
            <h2>Bookstore News & Events</h2>
            
            <article class="blog-post">
                <h3>Sample event</h3>
                <p class="date">October 15, 2026</p>
                <p class="description">Placeholder announcement for an upcoming event.</p>
            </article>

            <article class="blog-post">
                <h3>Another Sample event</h3>
                <p class="date">October 19, 2026</p>
                <p class="description">Placeholder for announcement 2 for an upcoming event.</p>
            </article>

            <article class="blog-post">
                <h3>Another Sample event 2: Electric Boogaloo</h3>
                <p class="date">October 19, 2026</p>
                <p class="description">Placeholder for announcement 3 for an upcoming event.<br>
                We're no strangers to love<br>
                You know the rules and so do I<br>
                A full commitment's what I'm thinkin' of<br>
                You wouldn't get this from any other guy<br>
                <br>
                I just wanna tell you how I'm feeling<br>
                Gotta make you understand<br>
                <br>
                Never gonna give you up<br>
                Never gonna let you down<br>
                Never gonna run around<br>
                And desert you<br>
                Never gonna make you cry<br>
                Never gonna say goodbye<br>
                Never gonna tell a lie<br>
                And hurt you<br>
                </p>
            </article>
        </section>
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