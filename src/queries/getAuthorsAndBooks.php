<?php
include 'db_connection.php';
$stmt = $pdo->query('SELECT Author.author_id, Author.name FROM Author');
$stmt2 = $pdo->query('SELECT Genre.genre_id, Genre.name FROM Genre');
$authors = $stmt->fetchAll();
$genres = $stmt2->fetchAll();
header('Content-Type: application/json');
echo json_encode([
    'authors' => $authors,
    'genres' => $genres
]);
?>