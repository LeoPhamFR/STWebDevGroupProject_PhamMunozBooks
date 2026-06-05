<?php
include 'db_connection.php';
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0; // Already handled in the app.js
$stmt = $pdo->prepare('SELECT Author.author_id, Author.name, Author.biography, Author.image FROM Author WHERE Author.author_id = :id');
$stmt2 = $pdo->prepare('SELECT Book.book_id, Book.title, Author.name as author, Book.description, Book.image, Book.price FROM Book
INNER JOIN Author ON Book.author_id = Author.author_id 
WHERE Author.author_id = :id');
$stmt->execute([':id' => $id]);
$stmt2->execute([':id' => $id]);
$author = $stmt->fetch();
$books = $stmt2->fetchAll();
header('Content-Type: application/json');
echo json_encode([
    'author' => $author,
    'books' => $books
]);
?>