# MunozPhamBooks
## Your regular online fictive bookstore for all your reading needs
*Also a SeoulTech web developpement group project by Léo PHAM and Ange Munoz--Pichonnier*

# Requirements and setup
- Before explaining the whole project, make sure that you got
`docker` installed
- *if you are on windows, Make sure that you have:* 
`wsl`, `docker destop`, OR the official `Docker` extension installed

- If all the conditions are satisfied:
    - Clone the whole repository
    - Go in the folder containing the project (as you can see the 2 files `DOCKERFILE` and `compose.yaml`)
    - Run in a terminal (or the VSCode Terminal) and thpe these 2 commands:
        - `docker build .` -> To build the docker images and the APP that we need (mysql + apache + phpmyadmin)
        - `docker compose up -d` -> To run these images

- Next go to the `src` folder and you will see and SQL file `(MunozPhamBooks.sql)`
- Connect to the database via http://localhost:8081 (id:`root`, password:`root_password`)
- Import that whole sql file as it creates that database
- And you are good to go as you can now use the website at http://localhost:8080
**If there is any problems: feel free to contact me by email at `leo.pham@et.esiea.fr`**

# Context of this project

- ## This online library contains:
    - *20 BOOKS*
    - *10 Authors*
    - *25 Genres* -> Multiples books have many genres (M:M relationship)

- ## The "skeleton" of the project
    Here's the organisation of that project:
    - `src`
        - `images`
            - `Authors` (All the photos for each authors)
            - `Books` (Covers)
        - `queries`
            - `db_connection.php` 
            - `getAllBooks.php` 
            - `getAuthorByID.php` 
            - `getBooksByID.php` 
            - `getAuthorsAndBooks.php` 
            - `getBookMain.php` 
            - `loginUser.php` 
            - `registerUser.php`
        - `index.php` 
        - `authorsDetails.php` 
        - `bookDetails.php` 
        - `cart.php` 
        - `contact_form.php` 
        - `search_page.php` 
        - `account_register.php` 
        - `account_login.php`
        - `account_logout.php` 
        - `account_menu.php`
        - `app.js`
        - `style.css`
    - `compose.yaml`
    - `Dockerfile`
    - `README.md`
        
- # Description for each file/page
    - `app.js` the JavaScript file that "animates" the whole website
    ## The library itself
    - `index.php` the main landing page (with some featured books, 5 books to be exact)
    - `authorsDetails.php` lists the author details (photo, biography, the books that the wrote) by their ID
    - `bookDetails.php` shows the full details of that book by their ID
    - `cart.php` only accessible if the user is connected, it list the books that the user has added in the cart
    - `contact_form.php` the form for each contact
    - `search_page.php` the search engine for the website

    ## Accounts form/menu
    - `account_register.php` the form for the user to register in
    - `account_login.php` the form for the user to log in
    - `account_logout.php` to logout from the website --> Destroys the user session
    - `account_menu.php` a page for the user to edit their information (visible but not functionnal --> Not implemented)

    ## Queries
    - `db_connection.php` a file to establish the connection to the database
    - `getAllBooks.php` retrieves all the data available in the database
    - `getAuthorByID.php` retrieves a author and their informations with their ID
    - `getBooksByID.php` retrieves a book and it's detailed information by their ID
    - `getAuthorsAndBooks.php` retrievess the name of the authors and **genres** for the navbar
    - `getBookMain.php` retrieves the first 5 books in the database (for the main menu/landing page)
    - `loginUser.php` checks if the user is in the database, if so a PHP session is created for that user (more safe)
    - `registerUser.php` Insert the new user (and their credentials) if there not present in the database + create a session for the new user

- ## On this website:
    - Can see all the available books (that are present in the DATABASE)
    - The user also can also lookup the author name (and get their details and their books)
    - The user can search a book or multiple books by their title, their author, their genre
    - Also the user can chose to see more details for each book
    - Finally the user can chose or not to create an account and add books to cart
    - Also that user can log in
    - The footer is updated in realtime
    - A contact form is also created, so that the user can contact the admin of the website (though non functionnal for now)

- ## Task Repartition:
    - Léo did the Backend + JavaScript of the Website --> Database, Queries (located in the folder queries in PHP) 
    and the app.js file (deta retrieval + cart functionnality + clock footer) + some part of the navbar (checking the user session + update of the navbar)
    and helped a bit to do the main menu and the list of all books, and also the main functionality of the search engine.
    - Ange did the Front-End of that Website, mainly the pages to list all the authors, books details, all the book 
    the forms (register, login, contact form), search menu + results page
    And also the CSS file (for the styling of the website)

- ## Connection between the Database and the Website (PHP + PDO)
    - In order to make that website more lively and perhaps engaging, we did create an external database to store the books, authors and genres. We also create a table to store users as well.
    - The relationship between all the tables can be also seen in the ERD (in `MunozPhamBooksERD.drawio.png`) file
    - So to connect that database to our website, we used PDO (a tool to manage our website through PHP) as a way to retrieve or modify data from the database.
    - In our case, we are using it as a way to retrieve data for each books, authors, genres exported in a JSON file
    - And also we use it to register a user or even create a PHP Session for a user that wants to log in to the website (and add the books in the cart).

- # Data Retrieval + app.js core functionnality (JS + AJAX)
    - We used, the AJAX method (through the app.js script) to retrieve data from the JSON file (that contains queries from the database) generated by the PHP script.
    - For each template page that we created, we fetch the appropriate query, we create a new DOM element that might contain a book full information based on the ID (booksDetails.php and getBookByID.php) or the Author details (authorDetails.php + getAuthorByID.php).
    Or even a list of books that matches with the user input in the search bar (search_page.php + getBooksSearch.php).
    - Also it is also used to send back a JSON file to a PHP script to insert data into the database (for exemple, we send the user credentials after the user registered or logged in)
    - Finally, we also retrieve the books information via their IDs in the array cartItems
    - Some pages are also accessible through a URL parameter too like:
        - http://localhost:8080/authorDetails.php?id=2
        - http://localhost:8080/bookDetails.php?id=7
        - http://localhost:8080/search_page.php?query=Southern%20Gothic
        **The IDS/Queries can be modified in the URL**
