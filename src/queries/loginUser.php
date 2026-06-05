<?php
    include 'db_connection.php';

    // Trimming whitespace for both username and password + Checking if empty
    $username = isset($_POST['username']) ? trim($_POST['username']) : '';
    $password = isset($_POST['password']) ? $_POST['password'] : '';   
    if ($username === '' || $password === ''){
        // Throwing alert popup to remind user to fill the username or password
        header('Content-Type: application/json', true, 400); 
        echo json_encode([
            'error' => 'Missing username or password' 
        ]);
        exit;
    }
    $stmt = $pdo->prepare('SELECT User.user_id, User.username, User.password, User.email, User.phone FROM User WHERE username = :username');
    $stmt->execute([':username' => $username]);
    $user = $stmt->fetch();
    
    if (!$user || !password_verify($password, $user['password'])) {
        // Throwing alert popup to remind user to enter the correct password or username
        header('Content-Type: application/json', true, 401);
        echo json_encode([
            'error' => 'Invalid username or password'
        ]);
        exit;
    }
    session_start();
    // Creating a session for the user + storing the credentials in the cookies to display the account menu
    $_SESSION['user_id'] = $user['user_id'];
    $_SESSION['username'] = $user['username'];
    $_SESSION['email'] = $user['email'];
    $_SESSION['phone'] = $user['phone'];
    echo json_encode(['success' => true, 'redirect' => '/index.php']);
    exit();
?>