<?php
include 'db_connection.php';
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0; // Getting the book ID from the URL query parameter
$stmt = $pdo->prepare('SELECT Book.author_id, Book.book_id, Book.image, Book.title, Author.name as author, Book.price, Book.description, Book.summary, Book.image FROM Book
INNER JOIN Author ON Book.author_id = Author.author_id WHERE Book.book_id = :id');
$stmt->execute([':id' => $id]);
$book = $stmt->fetch();
header('Content-Type: application/json');
echo json_encode($book);
?>