<?php
    session_start();
    if (isset($_SESSION['user_id'])) {
        $logged_in = true;
        $username = $_SESSION['username'];
        $phone = $_SESSION['phone'];
        $mail = $_SESSION['email'];
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
        <?php if ($logged_in): ?>
        <h2 class="section-title">Account Panel</h2>
        <div class="account-container">
            <form id="account-update-form" method="POST" action="index.php"> <!-- Just to demonstrate the panel, not functional for now -->
            <p>Welcome to your account panel, <strong><?php echo htmlspecialchars($username); ?></strong></p> 
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="<?php echo htmlspecialchars($username); ?>" readonly> <!-- Cannot change username -->
            <br>
            <label for="password">Change Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter new password">
            <br>
            <label for="password">Confirm Password:</label>
            <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm new password"> <!-- NOT FUNCTIONAL, just here for demo -->
            <br>
            <label for="phone">Phone number: (write here to change number)</label>
            <input type="text" id="phone" name="phone" value="<?php echo htmlspecialchars($phone); ?>">
            <br>
            <label for="email">Email: (write here to change email)</label>
            <input type="text" id="email" name="email" value="<?php echo htmlspecialchars($mail); ?>">
            <br>
            <button type="submit">Update and return to main menu</button> <!-- Just to demonstrate the panel, not functional for now -->
            </form>
        </div>
        <?php else: ?>
            <h2 class="section-title">You are not logged in</h2>
            <p>Please log in to access your account panel.</p>
            <button onclick="window.location.href='account_login.php'">Log in to purchase</button>
        <?php endif; ?>
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
