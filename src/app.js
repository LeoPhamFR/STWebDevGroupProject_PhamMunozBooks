// app.js --> AJAX for retrieving books in the DB
// AJAX --> We use fetch for each JSON response the coresponding fields to retrieve and fill the the templates pages
// it's the fetch() function that we used


cartItems = JSON.parse(localStorage.getItem('cartItems')) || []; // LOCAL STORAGE FOR CART (Only stores books id)



function addToCart(bookId) {
    // Adds an item to the local storage that contains the cart item (her the books)
    // Only works if that user is logged in (PHP session on)
    if (!window.loggedIn) {
        alert('Please log in to add items to your cart.');
        return;
    }
    cartItems.push(bookId); // Appends in that array
    localStorage.setItem('cartItems', JSON.stringify(cartItems)); // Persistant save for that cart (prevents the cart to be wiped for each page change)
    alert('Book added to cart!');
}

function removeFromCart(bookId) {
    // Remove an item to the local storage that contains the cart item (her the books)
    // Only works if that user is logged in (PHP session on)
    cartItems = cartItems.filter(id => id !== bookId);
    localStorage.setItem('cartItems', JSON.stringify(cartItems)); // Persistant save for that cart (prevents the cart to be wiped for each page change)
    alert('Book removed from cart!');
    getCartItems(); // Refresh cart display after removal
}

function getCartItems() {
    // Retrieves all data from the cart (here the books id)
    // We create a DOM element that list all the items present in the cart
    const booksContainer = document.getElementById('books-container');
    booksContainer.innerHTML = '';
    if (cartItems.length === 0) {
        // If the cart is empty
        booksContainer.innerHTML = '<p>Your cart is empty.</p>';
        return;
    }
    for (i in cartItems) {
        // Retrieveing each book details by their ID from the DB
        // And create a new element, that shows all the detail for each
        // Book in the cart 
        fetch(`./queries/getBookByID.php?id=${cartItems[i]}`)
            .then(response => response.json())
            .then(book => {
                const bookElement = document.createElement('div');
                bookElement.classList.add('book');
                bookElement.innerHTML = `
                    <article class="book-card">
                    <div class="book-cover"><img src="${book.image}" alt="Cover"></div>
                    <h3 class="book-title">${book.title}</h3>
                    <p class="book-author">by <a href="authorDetails.php?id=${book.author_id}">${book.author}</a></p>
                    <p class="book-price">Price: $${book.price}</p>
                    <button onclick="removeFromCart(${book.book_id})">Remove from Cart</button>
                    <a href="bookDetails.php?id=${book.book_id}" class="details-link">View Details</a>
                    </article>`;
                booksContainer.appendChild(bookElement); // Creating that element for the book
            }
        ); 
    }

    // The two buttons to checkout and removing all the items
    const checkoutBtn = document.createElement('button');
    checkoutBtn.textContent = 'Proceed to Checkout';
    const removeAllBooksBtn = document.createElement('button');
    removeAllBooksBtn.textContent = 'Remove All Books';
    removeAllBooksBtn.addEventListener('click', function() {
        // If the user clicks on the remove all books
        cartItems = [];
        localStorage.setItem('cartItems', JSON.stringify(cartItems)); // Persistant save for that cart (prevents the cart to be wiped for each page change)
        getCartItems();
    });
    booksContainer.appendChild(checkoutBtn); // Placeholder
    booksContainer.appendChild(removeAllBooksBtn);
}


function loadingBooks() {
    // The main function to retrieve books in the front page and the all_books.php page

    if(window.location.pathname.includes('index.php') || window.location.pathname === '/') {
        // Here we retrieve only 5 books (see the SQL query in getBooksMain.php)
        // We create for each book an "article" element that contains
        // The current informations that we got for each book (not in details)
        // We got the cover image, the title, the author --> link to authorDetails.php?=ID
        // the price, the book_id as a link "more details" (as a click element --> link to bookDetails.php?=ID
        // And also the button to add this to the cart if the user is connected
        // If not --> A button for him to log in
        fetch('./queries/getBooksMain.php')
            .then(response => response.json())
            .then(books => {
                const booksContainer = document.getElementById('books-container');
                booksContainer.innerHTML = '';
                books.forEach(book => {
                    const bookElement = document.createElement('div');
                    bookElement.classList.add('book');
                    bookElement.innerHTML = `
                        <article class="book-card">
                        <div class="book-cover"><img src="${book.image}" alt="Cover"></div>
                        <h3 class="book-title">${book.title}</h3>
                        <p class="book-author">by <a href="authorDetails.php?id=${book.author_id}">${book.author}</a></p>
                        <p class="book-price">Price: $${book.price}</p>
                        ${window.loggedIn ? `<button onclick="addToCart(${book.book_id})">Add to Cart</button>` : '<button onclick="window.location.href=\'account_login.php\'">Log in to purchase</button>'}
                        <br>
                        <a href="bookDetails.php?id=${book.book_id}" class="details-link">View Details</a>
                        </article>
                    `;
                    booksContainer.appendChild(bookElement);
                });
            }
        );
    }
    else if(window.location.pathname.includes('all_books.php')) {
        // Same principle here, but with all the books that are in the database
        // (see the SQL query in getAllBooks.php)
        fetch('./queries/getAllBooks.php')
            .then(response => response.json())
            .then(books => {
                const booksContainer = document.getElementById('books-container');
                booksContainer.innerHTML = '';
                books.forEach(book => {
                    const bookElement = document.createElement('div');
                    bookElement.classList.add('book');
                    bookElement.innerHTML = `
                        <article class="book-card">
                        <div class="book-cover"><img src="${book.image}" alt="Cover"></div>  
                        <h3 class="book-title">${book.title}</h3>
                        <p class="book-author">by <a href="authorDetails.php?id=${book.author_id}">${book.author}</a></p>
                        ${window.loggedIn ? `<button onclick="addToCart(${book.book_id})">Add to Cart</button>` : '<button onclick="window.location.href=\'account_login.php\'">Log in to purchase</button>'}
                        <br>
                        <a href="bookDetails.php?id=${book.book_id}" class="details-link">View Details</a>
                        </article>
                    `;
                    booksContainer.appendChild(bookElement);
                });
            }
        );
    }
}


function clickSearchButton() {
    // This function leads the user to the results of their queries (search items)
    // It redirects the user to the result page with that query
    document.getElementById('main-search-btn').addEventListener('click', function() {
        const query = document.getElementById('main-search-input').value.trim();
        if (query) {
            window.location.href = 'search_page.php?query=' + encodeURIComponent(query); // We add the query in the end of that link
        }
    });
}

document.addEventListener('DOMContentLoaded', function() {
    // Dropdown for authors and genres
    const dropdowns = document.querySelectorAll('.author-list-dropdown, .genre-list-dropdown');
    // A dropdown that list all the authors (all clickable and leads to the author details)
    fetch('./queries/getAuthorsAndBooks.php')
        .then(response => response.json())
        .then(data => {
            const {authors, genres} = data;
            const authorDropdown = document.querySelector('.author-list-dropdown');
            const genreDropdown = document.querySelector('.genre-list-dropdown');
            if (authorDropdown && authors) {
                authors.forEach(author => {
                    const liElement = document.createElement('li');
                    const link = document.createElement('a');
                    link.classList.add('dropdown-item');
                    link.href = 'authorDetails.php?id=' + encodeURIComponent(author.author_id); // We add the ID in the end of that link
                    link.textContent = author.name;
                    liElement.appendChild(link);
                    authorDropdown.appendChild(liElement);
                });
            }
            // A dropdown that list all the genres but leads to search query for a genre
            if (genreDropdown && genres) {
                genres.forEach(genre => {
                    const liElement = document.createElement('li');
                    const link = document.createElement('a');
                    link.classList.add('dropdown-item');
                    link.href = 'search_page.php?query=' + encodeURIComponent(genre.name);
                    link.textContent = genre.name;
                    liElement.appendChild(link);
                    genreDropdown.appendChild(liElement);
                });
            }
        })
        .catch(error => {
            console.error('Error fetching authors and genres:', error);
        }); 

    // Check if on bookDetails.php
    if (window.location.pathname.includes('bookDetails.php')) {
        // Get book id from URL
        // Here we retrieve the complete details of that book (see the SQL query in getBookByID.php)
        // We create for each book an "article" element that contains our book (by it's ID)
        // The current informations that we got for each book (not in details)
        // We got the cover image, the title, the author --> link to authorDetails.php?=ID
        // the price
        // A description of the book (not a summary)
        // And also the button to add this to the cart if the user is connected
        // A return button to the menu
        // A quick summary of this book (not a full summary)
        // If not --> A button for him to log in
        const urlParams = new URLSearchParams(window.location.search); //Looks for the ID (?id=[id])
        const bookId = urlParams.get('id'); // Getting only the ID
        const detailsContainer = document.querySelector('.book-details'); // Selecting the ID
        if (bookId) {
            fetch(`./queries/getBookByID.php?id=${bookId}`) // Getting the ID and fetching the book details
                .then(response => response.json())
                .then(book => {
                    if (!book || book.error) {
                        detailsContainer.innerHTML = '<p style="color:red">Book not found.</p>';
                        return;
                    }
                    // Adding the whole detailed section for this BOOK with that ID
                    detailsContainer.innerHTML = `
                        <article class="book-card">
                            <div class="book-cover"><img src="${book.image}" alt="Cover"></div>                            
                            <h3 class="book-title">${book.title}</h3>
                            <p class="book-author">by <a href="authorDetails.php?id=${book.author_id}">${book.author}</a></p>
                            <p class="book-description">${book.description || ''}</p>
                            <p class="book-price">Price: $${book.price}</p>
                            ${window.loggedIn ? `<button onclick="addToCart(${book.book_id})">Add to Cart</button>` : '<button onclick="window.location.href=\'account_login.php\'">Log in to purchase</button>'}
                            <br>
                            <h3 class="book-additional-details">Additional Details</h3>
                            <h4 class="summary-heading">Summary</h4>
                            <p class="book-summary">${book.summary ? `${book.summary}` : ''}</p>
                            <p class="book-genre">${book.genre ? `Genre: ${book.genre}` : ''}</p>
                            <p class="return-link"><a href="index.php">Back to the main page</a></p>
                        </article>
                    `;
                })
                .catch(error => {
                    // If the database returns an error
                    console.error('Error fetching book details:', error);
                    detailsContainer.innerHTML = '<p style="color:red">Error loading details. See console for info.</p>';
                });
        } else {
            // If the user provides that does not exist or shouldn't exist
            detailsContainer.innerHTML = '<p style="color:red">No book ID provided.</p>';
        }
        return;
    }
    if (window.location.pathname.includes('authorDetails.php')) {
        // Get book id from URL
        // Here we retrieve the complete details of the author (see the SQL query in getAuthorByID.php)
        // We create for each book an "article" element that contains our Author (by it's ID)
        // The current informations that we got for each Author (not in details)
        // We got the image, the name of this author, a biography
        // We also list all of the author's books too

        const urlParams = new URLSearchParams(window.location.search);
        const authorId = urlParams.get('id');
        const detailsContainer = document.querySelector('.author-details');
        const authorBooksContainer = document.querySelector('.author-books');
        if (authorId) {
            fetch(`./queries/getAuthorByID.php?id=${authorId}`)
                .then(response => response.json())
                .then(data => {
                    const {author, books} = data; // Retrieving both the author and the books in the JSON response
                    if (!author || author.error) {
                        detailsContainer.innerHTML = '<p style="color:red">Author not found.</p>';
                        authorBooksContainer.innerHTML = '';
                        return;
                    }
                    // Creating a DOM element for the author details  
                    detailsContainer.innerHTML = `
                            <article class="author-card">
                            <div class="author-image-cover"><img src="${author.image}" alt="Cover"></div>
                            <h3 class="author-name">${author.name}</h3>
                            <p class="author-bio">${author.biography || ''}</p>
                            <p class="return-link"><a href="index.php">Back to the main page</a></p>
                            </article>
                        `;
                    if (books && books.length > 0) {
                        // Creating a DOM element for a list of author books  
                        authorBooksContainer.innerHTML = '<h3>Books by this author:</h3>';
                        books.forEach(book => {
                            const bookElement = document.createElement('div');
                            bookElement.classList.add('book');
                            // We create for each book an "article" element that contains
                            // The current informations that we got for each book (not in details)
                            // We got the cover image, the title
                            // the price, the book_id as a link "more details" (as a click element --> link to bookDetails.php?=ID
                            // And also the button to add this to the cart if the user is connected
                            // If not --> A button for him to log in
                            bookElement.innerHTML = `
                                <article class="book-card">
                                <div class="book-cover"><img src="${book.image}" alt="Cover"></div>
                                <h3 class="book-title">${book.title}</h3>
                                <p class="book-price">Price: $${book.price}</p>
                                ${window.loggedIn ? `<button onclick="addToCart(${book.book_id})">Add to Cart</button>` : '<button onclick="window.location.href=\'account_login.php\'">Log in to purchase</button><br>'}
                                <a href="bookDetails.php?id=${book.book_id}" class="details-link">View Details</a>
                                </article>
                            `;
                            authorBooksContainer.appendChild(bookElement);
                        });
                    } else {
                        // If for some reason the authors has zero books (could happen)
                        authorBooksContainer.innerHTML = '<p>No books found for this author.</p>';
                    }
                })
                .catch(error => {
                    // DATABASE ERROR
                    console.error('Error fetching author details:', error);
                    detailsContainer.innerHTML = '<p style="color:red">Error loading details. See console for info.</p>';
                });
        } else {
            // If the user forgot to put the ID
            detailsContainer.innerHTML = '<p style="color:red">No author ID provided.</p>';
        }
        return;


    }

    // Check if on search_page.php
    if (window.location.pathname.includes('search_page.php')) {
        const searchInput = document.getElementById('main-search-input');
        const searchBtn = document.getElementById('main-search-btn');
        const resultsContainer = document.querySelector('.search-results');

        function getQueryParam(name) {
            // Getting the query for that search page (GET)
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(name) || '';
        }

        function searchBooks(query) {
            // Fetching all the books that contains the keyword/query
            // See more of that in the getBooksSearch.php query file
            console.log('searchBooks called with query:', query);
            if (!query) return;
            fetch(`./queries/getBooksSearch.php?query=${encodeURIComponent(query)}`)
                .then(response => {
                    // Debug
                    console.log('Fetch response:', response);
                    return response.json();
                })
                .then(books => {
                    console.log('Books received:', books);
                    resultsContainer.innerHTML = '';
                    if (!books || books.length === 0) {
                        // If no books equals to that keyword
                        resultsContainer.innerHTML = '<p>No books found.</p>';
                        return;
                    }
                    books.forEach(book => {
                        const bookElement = document.createElement('div');
                        // We create for each book an "article" element that contains
                        // The current informations that we got for each book (not in details)
                        // We got the cover image, the title, the author --> link to authorDetails.php?=ID
                        // the price, the book_id as a link "more details" (as a click element --> link to bookDetails.php?=ID
                        // And also the button to add this to the cart if the user is connected
                        // If not --> A button for him to log in
                        bookElement.classList.add('book');
                        bookElement.innerHTML = `
                            <article class="book-card">
                            <div class="book-cover"><img src="${book.image}" alt="Cover"></div>
                            <h3 class="book-title">${book.title}</h3>
                            <p class="book-author">by <a href="authorDetails.php?id=${book.author_id}">${book.author}</a></p>
                            <p class="book-price">Price: $${book.price}</p>
                            ${window.loggedIn ? `<button onclick="addToCart(${book.book_id})">Add to Cart</button>` : '<button onclick="window.location.href=\'account_login.php\'">Log in to purchase</button>'}
                            <br>
                            <a href="bookDetails.php?id=${book.book_id}" class="details-link">View Details</a>
                            </article>
                        `;
                        resultsContainer.appendChild(bookElement); // Appending that book in the results
                    });
                })
                .catch(error => {
                    // DATABASE ERROR
                    console.error('Error in fetch or JSON parsing:', error);
                    resultsContainer.innerHTML = '<p style="color:red">Error loading results. See console for details.</p>';
                });
        }

        searchBtn.addEventListener('click', function() {
            const query = searchInput.value.trim();
            searchBooks(query);
        });

        // If query param exists, prefill and search
        const initialQuery = getQueryParam('query');
        if (initialQuery) {
            searchInput.value = initialQuery;
            searchBooks(initialQuery);
        }
    } else {
        loadingBooks();
        if (document.getElementById('main-search-btn')) {
            clickSearchButton();
        }
    }

    // AJAX for register form
    const registerForm = document.getElementById('register-form');
    if (registerForm) {
        registerForm.addEventListener('submit', function(e) {
            e.preventDefault(); // Prevents the page from refreshing
            const formData = new FormData(registerForm);
            // Posting the credentials to the database through registerUser.php (via JSON)
            fetch('queries/registerUser.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                // Redirects the user to the menu (see the registerUser.php file) if succesful
                if (data.success && data.redirect) {
                    window.location.href = data.redirect;
                } else if (data.error) {
                    // Will show the errors that the user has made (see the registerUser.php)
                    alert(data.error);
                }
            })
            .catch(() => {
                alert('Registration failed.');
            });
        });
    }

    // AJAX for login form
    const loginForm = document.getElementById('login-form');
    if (loginForm) {
        loginForm.addEventListener('submit', function(e) {
            e.preventDefault(); // Prevent the page from refreshing
            const formData = new FormData(loginForm);
            // Posting the credentials to the database through loginUser.php (via JSON)
            fetch('queries/loginUser.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                // Redirects the user to the menu (see the loginUser.php file)
                if (data.success && data.redirect) {
                    window.location.href = data.redirect;
                } else if (data.error) {
                    // Will show the errors that the user has made (see the loginUser.php)
                    alert(data.error);
                }
            })
            .catch(() => {
                alert('Login failed.');
            });
        });
    }
    // Show the cart page
    if (window.location.pathname.includes('cart.php')) {
        getCartItems(); // Litterally getting the full cart in that page
    }


    // FOR THE DYNAMIC FOOTER CURRENT DATETIME AND CLOCK
    const clockElement = document.getElementById('date-and-clock');
    if (clockElement) {
        const now = new Date();

        const dateOptions = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        const formattedDate = now.toLocaleDateString('en-US', dateOptions);

        // Formating time HH:MM:SS with the 24-hour format
        const formattedTime = now.toLocaleTimeString('en-GB', { hour: '2-digit', minute: '2-digit', second: '2-digit' });

        clockElement.textContent = `current date and time: ${formattedDate}, ${formattedTime}`;
    }
    
});