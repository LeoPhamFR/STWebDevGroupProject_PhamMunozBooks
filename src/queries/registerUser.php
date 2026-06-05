<?php
    include 'db_connection.php';
    $username = isset($_POST['username']) ? trim($_POST['username']) : '';
    $password = isset($_POST['password']) ? $_POST['password'] : '';
    $email = isset($_POST['email']) ? trim($_POST['email']) : '';   
    $phone = isset($_POST['phone']) ? trim($_POST['phone']) : ''; 
    if ($username === '' || $password === '' || $email === '' || $phone === ''){
        header('Content-Type: application/json', true, 400);
        echo json_encode([
            'error' => 'Missing username, password, email, or phone'
        ]);
        exit;
    }
    # Searching if that account already exist in the database
    $pre_stmt = $pdo->prepare('SELECT user_id, username FROM User WHERE username = :username');
    $pre_stmt->execute([':username' => $username]);
    $existing_user = $pre_stmt->fetch();
    if ($existing_user) {
        // User exits --> Throwing a popup to remind that user already exists
        header('Content-Type: application/json', true, 500);
        echo json_encode([
            'error' => 'Registration failed: An account with the same username, email, or phone already exists (duplicate)'
        ]);
        exit;
    }
    // Inserting the new user into the database
    $stmt = $pdo->prepare('INSERT INTO User(User.username, User.password, User.email, User.phone) VALUES (:username, :password_hash, :email, :phone)');
    // HASHING the password --> MORE SECURE
    $stmt->execute([':username' => $username, ':password_hash' => password_hash($password, PASSWORD_DEFAULT), ':email' => $email, ':phone' => $phone]);
    $user_id = $pdo->lastInsertId();
    session_start();

    // If the user is registered, we create a session for them
    // Credentials stored in the cookies
    if($user_id){
        $_SESSION['user_id'] = $user_id;
        $_SESSION['username'] = $username;
        $_SESSION['email'] = $email;
        $_SESSION['phone'] = $phone;
        echo json_encode(['success' => true, 'redirect' => '/index.php']);
        exit();
    } else {
        // If not, we throw an error, oops
        header('Content-Type: application/json', true, 500);
        echo json_encode([
            'error' => 'Registration failed'
        ]);
        exit();
    }

?>