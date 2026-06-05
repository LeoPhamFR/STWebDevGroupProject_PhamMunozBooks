<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include 'db_connection.php';
$query = isset($_GET['query']) ? trim($_GET['query']) : ''; // Getting the search query from the URL, REMVOING THE WHITESPACE

try {
    if ($query === '') {
        // No query: return all books
        $stmt = $pdo->query('SELECT Book.author_id, Book.book_id, Book.image, Book.title, Author.name as author, Book.price FROM Book INNER JOIN Author ON Book.author_id = Author.author_id');
        $books = $stmt->fetchAll();
    } else {
        // Query present: filter
        $stmt = $pdo->prepare('SELECT DISTINCT Book.author_id, Book.book_id, Book.image, Book.title, Author.name as author, Book.price FROM Book
            INNER JOIN Author ON Book.author_id = Author.author_id
            INNER JOIN BookGenre ON Book.book_id = BookGenre.book_id
            INNER JOIN Genre ON BookGenre.genre_id = Genre.genre_id
            WHERE Book.title LIKE :title_query OR Author.name LIKE :author_query OR Genre.name LIKE :genre_query'); // Distinct to avoid duplicates
        $search = '%' . $query . '%';
        $stmt->execute([
            ':genre_query' => $search,
            ':title_query' => $search,
            ':author_query' => $search
        ]);
        $books = $stmt->fetchAll();
    }
    header('Content-Type: application/json');
    echo json_encode($books);
} catch (Exception $e) {
    header('Content-Type: application/json', true, 500);
    echo json_encode([
        'error' => 'Database error',
        'message' => $e->getMessage()
    ]);
}
?>
