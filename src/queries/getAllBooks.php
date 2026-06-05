<?php
include 'db_connection.php';
$stmt = $pdo->query('SELECT Book.author_id, Book.book_id, Book.image, Book.title, Author.name as author, Book.price FROM Book
INNER JOIN Author ON Book.author_id = Author.author_id');
$books = $stmt->fetchAll();
header('Content-Type: application/json');
echo json_encode($books);
?>