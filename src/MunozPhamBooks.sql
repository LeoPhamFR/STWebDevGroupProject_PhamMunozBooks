-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jun 01, 2026 at 09:46 AM
-- Server version: 8.0.46
-- PHP Version: 8.3.26



SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MunozPhamBooks`
--

CREATE DATABASE IF NOT EXISTS `MunozPhamBooks` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `MunozPhamBooks`;

-- --------------------------------------------------------

--
-- Table structure for table `Author`
--

CREATE TABLE `Author` (
  `author_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `biography` text NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Author`
--

INSERT INTO `Author` (`author_id`, `name`, `biography`, `image`) VALUES
(1, 'Harper Lee', 'Nelle Harper Lee (April 28, 1926 – February 19, 2016) was an American novelist whose 1960 novel To Kill a Mockingbird won the 1961 Pulitzer Prize and became a classic of modern American literature. She assisted her close friend Truman Capote in his research for the book In Cold Blood (1966).[1] An earlier draft of Mockingbird, set at a later date, Go Set a Watchman, was published in July 2015 as a sequel.[2][3][4] A collection of her short stories and essays, The Land of Sweet Forever, was published on October 21, 2025.', './images/Authors/HarperLee.jpeg'),
(2, 'George Orwell', 'Eric Arthur Blair (25 June 1903 – 21 January 1950) was an English novelist, poet, essayist, journalist, and critic who wrote under the pen name of George Orwell. His work is characterised by lucid prose, social criticism, opposition to all totalitarianism (both authoritarian communism and fascism), and support of democratic socialism.', './images/Authors/GeorgeOrwell.jpeg'),
(3, 'F. Scott Fitzgerald', 'Francis Scott Key Fitzgerald (September 24, 1896 – December 21, 1940), widely known as F. Scott Fitzgerald or simply Scott Fitzgerald,[1] was an American novelist, essayist, and short story writer. He is best known for his novels depicting the flamboyance and excess of the Jazz Age, a term that he popularized in his short story collection Tales of the Jazz Age. He published four novels, four story collections, and 164 short stories. He achieved transient success and fortune in the 1920s, but did not receive critical acclaim until after his death. He is now widely regarded as one of the greatest American writers of the 20th century. ', ' ./images/Authors/FScottFitzgerald.webp'),
(4, 'Jane Austen', 'Jane Austen (/ˈɒstɪn, ˈɔːstɪn/ OST-in, AW-stin; 16 December 1775 – 18 July 1817) was an English writer known primarily for her six novels, which implicitly interpret, critique, and comment on the English landed gentry at the end of the 18th century.  Austen\'s plots often explore the dependence of women on marriage for the pursuit of favourable social standing and economic security. Her works are implicit critiques of the novels of sensibility of the second half of the 18th century and are part of the transition to 19th-century literary realism.[2][b] Her use of social commentary, realism, wit, and irony have earned her acclaim amongst critics and scholars. ', ' ./images/Authors/JaneAusten.webp'),
(5, 'J.D. Salinger', 'Jerome David Salinger (/ˈsælɪndʒər/ SAL-in-jər; January 1, 1919 – January 27, 2010) was an American author best known for his 1951 novel The Catcher in the Rye. Salinger published several short stories in Story magazine in 1940, before serving in World War II.[1] In 1948, his critically acclaimed story \"A Perfect Day for Bananafish\" appeared in The New Yorker, which published much of his later work.', ' ./images/Authors/JDSalinger.webp'),
(6, 'J.R.R. Tolkien', 'John Ronald Reuel Tolkien (/ˈruːl ˈtɒlkiːn/,[a] 3 January 1892 – 2 September 1973) was an English writer and academic philologist. He was the author of the high fantasy works The Hobbit (1937) and The Lord of the Rings (1954–1955).  From 1925 to 1945 Tolkien was the Rawlinson and Bosworth Professor of Anglo-Saxon and a Fellow of Pembroke College, both at the University of Oxford. He then moved within the same university to become the Merton Professor of English Language and Literature and Fellow of Merton College, and held these positions from 1945 until his retirement in 1959. Tolkien was a devout Catholic and a close friend of C. S. Lewis, a co-member of the Inklings, an informal literary discussion group. He was appointed a Commander of the Order of the British Empire by Queen Elizabeth II on 28 March 1972. ', './images/Authors/JRRTolkien.webp'),
(7, 'Ray Bradbury', 'Ray Douglas Bradbury (US: /ˈbrædbɛri/ BRAD-berr-ee; 22 August 1920 – 5 June 2012) was an American author and screenwriter. One of the most celebrated 20th-century American writers, he worked in a variety of genres, including fantasy, science fiction, horror, mystery, and realistic fiction.[3]  Bradbury is best known for his novel Fahrenheit 451 (1953) and his short-story collections The Martian Chronicles (1950), The Illustrated Man (1951), and The October Country (1955).[4] Other notable works include the coming of age novel Dandelion Wine (1957), the dark fantasy Something Wicked This Way Comes (1962) and the fictionalized memoir Green Shadows, White Whale (1992). He also wrote and consulted on screenplays and television scripts, including Moby Dick and It Came from Outer Space. Many of his works were adapted into television and film productions as well as comic books. Bradbury also wrote poetry which has been published in several collections, such as They Have Not Seen the Stars (2001).', './images/Authors/RayBradbury.jpeg'),
(8, 'Herman Melville', 'Herman Melville (born Melvill;[a] August 1, 1819 – September 28, 1891) was an American writer of the American Renaissance period. Among his best-known works are Moby-Dick (1851); Typee (1846), a romanticized account of his experiences in Polynesia; and Billy Budd, Sailor, a posthumously published novella. At the time of his death, Melville was not well known to the public, but 1919, the centennial of his birth, was the starting point of a Melville revival.[1] Moby-Dick would eventually be considered one of the Great American Novels. ', ' ./images/Authors/HermanMelville.webp'),
(9, 'Aldous Huxley', 'Aldous Leonard Huxley (/ˈɔːldəs/ ⓘ AWL-dəs; 26 July 1894 – 22 November 1963) was an English writer and philosopher.[1][2][3][4] His bibliography spans nearly 50 books,[5][6] including non-fiction works, as well as essays, narratives and poems.  Born into the prominent Huxley family, he graduated from Balliol College, Oxford, with a degree in English literature. Early in his career, he published short stories and poetry and edited the literary magazine Oxford Poetry, before going on to publish novels (witty social-satirical novels and grimly serious ones), travel writing, and screenplays. He spent the latter part of his life in the United States, living in Los Angeles from 1937 until his death.[7] By the end of his life, Huxley was widely acknowledged as one of the foremost intellectuals of his time.[8] He was nominated for the Nobel Prize in Literature nine times,[9] and was elected Companion of Literature by the Royal Society of Literature in 1962.', ' ./images/Authors/AldousHuxley.webp'),
(10, 'Mary Shelley', 'Mary Wollstonecraft Shelley (née Godwin; 30 August 1797 – 1 February 1851) was an English novelist who wrote the Gothic novel Frankenstein; or, The Modern Prometheus (1818), which is considered an early example of science fiction.[2] She also edited and promoted the works of her husband, the Romantic poet and philosopher Percy Bysshe Shelley. Her father was the political philosopher William Godwin and her mother was the philosopher and women\'s rights advocate Mary Wollstonecraft. ', ' ./images/Authors/MaryShelley.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `Book`
--

CREATE TABLE `Book` (
  `book_id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `author_id` int NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `summary` text NOT NULL,
  `grade` int NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Book`
--

INSERT INTO `Book` (`book_id`, `title`, `author_id`, `price`, `description`, `summary`, `grade`, `image`) VALUES
(1, 'To Kill a Mockingbird', 1, 14.99, 'A classic novel about racial injustice in the American South.', 'To Kill a Mockingbird is a 1960 Southern Gothic novel by American author Harper Lee. It became instantly successful after its release; in the United States, it is widely read in high schools and middle schools.[1] To Kill a Mockingbird won the Pulitzer Prize a year after its release, and it has become a classic of modern American literature.[2] The plot and characters are loosely based on Lee\'s observations of her family, her neighbors and an event that occurred near her hometown of Monroeville, Alabama, in 1936, when she was ten.', 0, './images/Books/To_Kill_a_Mockingbird.jpg'),
(2, '1984', 2, 12.99, 'A dystopian masterpiece about government surveillance and totalitarianism.', '1984 or Nineteen Eighty-four, novel by English author George Orwell published in 1949 as a warning against totalitarianism. The novel’s chilling dystopia made a deep impression on readers, and Orwell’s ideas entered mainstream culture in a way achieved by very few books. The book’s title and many of its concepts, such as Big Brother and the Thought Police, are instantly recognized and understood, often as bywords for modern social and political abuses.', 0, './images/Books/1984.jpg'),
(3, 'The Great Gatsby', 3, 10.99, 'A critique of the American Dream during the Roaring Twenties.', 'The Great Gatsby, novel by American author F. Scott Fitzgerald, published in 1925. It tells the story of Jay Gatsby, a self-made millionaire, and his pursuit of Daisy Buchanan, a wealthy young woman whom he loved in his youth. Set in 1920s New York, the book is narrated by Nick Carraway. After moving to the fictional West Egg on Long Island, Nick comes to know Gatsby, who asks for his help in reconnecting with Daisy, now married to Tom Buchanan. Gatsby and Daisy rekindle their relationship. Tom discovers the affair and confronts Gatsby, revealing how Gatsby made his fortune selling illegal alcohol. While driving Gatsby’s car, Daisy hits and kills Myrtle Wilson, Tom’s mistress. Myrtle’s husband later kills Gatsby and then himself. Initially given mixed reviews, The Great Gatsby gained popularity in the 1950s and is now considered a masterpiece of American literature. It has inspired several film adaptations.', 0, './images/Books/The_Great_Gatsby.jpg'),
(4, 'Pride and Prejudice', 4, 9.99, 'A romantic comedy of manners in 19th-century England.', 'Pride and Prejudice, romantic novel of manners by English author Jane Austen, published anonymously in three volumes in 1813. A classic of English literature, written with incisive wit and superb character delineation, it follows Elizabeth Bennet, the daughter of a country gentleman, as she navigates social expectations, family pressures, and her shifting—and initially misjudged—relationship with the wealthy, reserved Fitzwilliam Darcy. It was Austen’s second published novel. Upon publication, Pride and Prejudice was well received by critics and readers. The first edition sold out within the first year, and it never went out of print.', 0, './images/Books/Pride_And_Prejudice.jpg'),
(5, 'The Catcher in the Rye', 5, 11.5, 'A novel exploring teenage angst, alienation, and identity.', 'From what is implied to be a sanatorium, Holden, the narrator and protagonist, tells the story of his adventures before the previous Christmas. The story begins with Holden at Pencey Prep School on his way to the house of his history teacher, Spencer, so that he can say goodbye. He reveals to the reader that he has been expelled for failing most of his classes. After he visits Spencer, he encounters his roommate, Ward Stradlater, who asks Holden to write an essay for English class for him while he goes on a date with a longtime friend of Holden’s. Having agreed, Holden writes about the baseball glove of his younger brother, Allie, who died of leukemia. When Stradlater returns, he tells Holden that the essay isn’t good, and Holden gets angry when Stradlater refuses to say whether he had sex with his date. This causes Holden to storm out and leave Pencey for New York City a few days earlier than planned for Christmas break. Once he arrives in New York, he cannot go home, as his parents do not yet know that he has been expelled. Instead, he rents a room at the Edmont Hotel, where he witnesses some sexually charged scenes through the windows of other rooms. His loneliness then causes him to seek out human interaction, which he does at the Lavender Room, the hotel’s nightclub. After interacting with some women there, he goes to another nightclub, only to leave after seeing his elder brother’s ex-girlfriend. When he gets back to the hotel, he orders a prostitute to his room, only to talk to her. This situation ends in him being punched in the stomach.  The next morning, Holden calls Sally Hayes, an ex-girlfriend of his. They spend the day together until Holden makes a rude remark and she leaves crying. Holden then meets up with a former schoolmate, Carl Luce, at a bar, but Luce leaves early because he becomes annoyed by Holden’s immature comments. Holden stays behind and gets drunk by himself. After he leaves, he wanders in Central Park until the cold drives him to his family’s apartment. He sneaks in, still not prepared to face his parents, and finds his 10-year-old sister, Phoebe. She is upset when she hears that Holden has failed out and accuses him of not liking anything. It is at this time that Holden describes to his sister his fantasy of being “the catcher in the rye,” which was inspired by a song he heard a little boy singing: “If a body catch a body comin’ through the rye.” Phoebe tells him that the words are “If a body meet a body coming through the rye,” from a poem by Robert Burns. (Burns’s poem, “Comin thro’ the Rye,” exists in several versions, but most render the lines as “Gin a body meet a body / Comin thro’ the rye.”) Soon they hear their parents come home after a night out, and Holden sneaks away. He calls his former English teacher, Mr. Antolini, who tells Holden he can come stay at his apartment. Holden falls asleep on Antolini’s couch and awakes to Antolini stroking his forehead, which Holden interprets as a sexual advance. He immediately excuses himself and heads to Grand Central Station, where he spends the rest of the night. When he awakes, he goes to Phoebe’s school and leaves a note telling her that he plans to run away and asking her to meet him at a museum during lunch. She arrives with a packed bag and insists on going with him. He tells her no and instead takes her to the zoo, where he watches her ride the carousel in the pouring rain. This is where the flashback ends. The novel closes with Holden explaining that he has fallen “sick” but is expected to go to a new school in the fall.', 0, './images/Books/The_Catcher_in_the_Rye.jpg'),
(6, 'The Hobbit', 6, 15.99, 'A classic high-fantasy adventure prelude to Lord of the Rings.', 'Hobbits, a race of small humanlike creatures, characteristically value peace, simplicity, and cozy homes yet are capable of incredible feats of courage and resourcefulness. The unwilling hero of The Hobbit, Bilbo Baggins, is persuaded by the wizard Gandalf to leave his village, Hobbiton, and join Thorin and his 12 dwarfs to recover their stolen treasure, which is being guarded by the dragon Smaug. During the expedition, Bilbo finds a magical ring that renders the wearer invisible, which figures prominently in The Lord of the Rings, a novel originally published in three parts that followed in 1954−55. When Bilbo and Gandalf return to Hobbiton, Bilbo is no longer accepted, his adventurous behavior being deemed unhobbitlike. The Hobbit is the story of Bilbo’s maturing from a seeker of warmth and comforts to a fighter, however humble, for the greater good. He proves to be an unlikely hero who achieves metamorphosis through pools of inner strength he did not know he possessed.', 0, './images/Books/The_Hobbit.jpg'),
(7, 'Fahrenheit 451', 7, 13.25, 'A dystopian vision of a society where books are outlawed and burned.', 'Fahrenheit 451, dystopian novel, first published in 1953, that is regarded as perhaps the greatest work by American author Ray Bradbury and has been praised for its stance against censorship and its defense of literature as necessary both to the humanity of individuals and to civilization.  The story takes place in an unspecified city in a distant future. The protagonist, Guy Montag, is a fireman whose job is to burn down houses in which books have been discovered. After leaving work one day, he meets Clarisse, a teenaged girl who enjoys nature and asks if he is happy. At home, he finds that his wife, Mildred, has swallowed a bottle of sleeping pills in a suicide attempt. After he calls for help, two men arrive and revive her. The next morning, she behaves as though nothing happened and watches as usual the programs on the television screens that make up three of the parlour walls. Montag and the cheerful Clarisse begin talking regularly, until one day she is not outside waiting for him; he eventually learns that she was killed by a speeding car. Later, when the firemen are sent to burn down the house of an elderly woman, Montag takes her Bible—an act that he thinks his hand has undertaken on its own—and the woman chooses to die with her books. Montag begins to have doubts about his mission, and the next day he stays home from work.', 0, './images/Books/Faherenheit_451.webp'),
(8, 'Moby-Dick', 8, 12.5, 'An epic tale of obsession, revenge, and whale hunting.', 'Moby Dick famously begins with the narratorial invocation “Call me Ishmael.” The narrator, like his biblical counterpart, is an outcast. Ishmael, who turns to the sea for meaning, relays to the audience the final voyage of the Pequod, a whaling vessel. Amid a story of tribulation, beauty, and madness, the reader is introduced to a number of characters, many of whom have names with religious resonance. The ship’s captain is Ahab, who Ishmael and his friend Queequeg soon learn is losing his mind. Starbuck, Ahab’s first-mate, recognizes this problem too, and is the only one throughout the novel to voice his disapproval of Ahab’s increasingly obsessive behavior. This nature of Ahab’s obsession is first revealed to Ishmael and Queequeg after the Pequod’s owners, Peleg and Bildad, explain to them that Ahab is still recovering from an encounter with a large whale that resulted in the loss of his leg. That whale’s name is Moby Dick. The Pequod sets sail, and the crew is soon informed that this journey will be unlike their other whaling missions: this time, despite the reluctance of Starbuck, Ahab intends to hunt and kill the beastly Moby Dick no matter the cost.', 0, './images/Books/Moby-Dick.jpg'),
(9, 'Brave New World', 9, 14, 'A prophetic novel about a genetically engineered, consumerist future.', 'Brave New World is set in 2540 ce, which the novel identifies as the year AF 632. AF stands for “after Ford,” as Henry Ford’s assembly line is revered as god-like; this era began when Ford introduced his Model T. The novel examines a futuristic society, called the World State, that revolves around science and efficiency. In this society, emotions and individuality are conditioned out of children at a young age, and there are no lasting relationships because “every one belongs to every one else” (a common World State dictum). Huxley begins the novel by thoroughly explaining the scientific and compartmentalized nature of this society, beginning at the Central London Hatchery and Conditioning Centre, where children are created outside the womb and cloned in order to increase the population. The reader is then introduced to the class system of this world, where citizens are sorted as embryos to be of a certain class. The embryos, which exist within tubes and incubators, are provided with differing amounts of chemicals and hormones in order to condition them into predetermined classes. Embryos destined for the higher classes get chemicals to perfect them both physically and mentally, whereas those of the lower classes are altered to be imperfect in those respects. These classes, in order from highest to lowest, are Alpha, Beta, Gamma, Delta, and Epsilon. The Alphas are bred to be leaders, and the Epsilons are bred to be menial labourers.  Bernard Marx, an Alpha, is one of the main characters of the story. He and his love interest, Lenina Crowne, travel to a “savage reservation,” where Marx’s boss (the Director) supposedly lost a female companion some years ago. When the two arrive, they see people living there engaging in unfamiliar rituals. They also stumble upon a woman (Linda) and her son (John, also referred to as the Savage) who Marx correctly assumes to be the lost family mentioned by the Director. The Director had recently been threatening to send Marx away for his antisocial behavior, so Marx decides to bring the two home with him.', 0, './images/Books/Brave New World.webp'),
(10, 'Frankenstein', 10, 8.99, 'A gothic horror masterpiece about ambition and scientific ethics.', 'Frankenstein; or, The Modern Prometheus, Gothic horror novel by English writer Mary Wollstonecraft Shelley that was first published in 1818. The epistolary story follows a scientific genius who brings to life a terrifying monster that torments its creator. It is considered one of the first science-fiction novels. An international sensation, the story has been adapted hundreds of times in different media and has influenced pop culture at large.', 0, './images/Books/frankenstein.jpg'),
(11, 'Go Set a Watchman', 1, 13.99, 'An early draft of Mockingbird published as a sequel.', 'Harper Lee’s Go Set a Watchman narrates the homecoming of Jean Louise Finch as she faces a community rife with racial tension, an old friend turned love interest, and a father who no longer seems as perfect as she once believed him to be.  Jean Louise Finch returns to her childhood hometown of Maycomb, Alabama, for what she expects will be a typical visit. Soon, however, her growing attraction to an old friend named Hank begins to complicate her stay. Her difficulties grow even further with her discovery that both Hank and her father are part of an organization dedicated to preserving racial segregation. Jean Louise, who has always known her father as a champion of civil rights, feels betrayed. No longer sure whom she can trust, Jean Louise lashes out against the people she loves and condemns them for tolerating racism. Gradually, through conversations with her uncle Jack, Jean Louise learns to accept that her father is imperfect and human, capable of doing bad things as well as good.', 0, './images/Books/GoSetAWatchman.jpg'),
(12, 'Animal Farm', 2, 9.99, 'An allegorical novella reflecting events leading up to the Russian Revolution.', 'Animal Farm is a novel about a group of animals who take control of the farm they live on.  The animals get fed up of their master, Farmer Jones, so they kick him out. Once they are free of the tyrant Jones, life on the farm is good for a while and there is hope for a happier future of less work, better education and more food. However, trouble brews as the pigs, Napoleon and Snowball, fight for the hearts and minds of the other animals on the farm. Napoleon seizes power by force and ends up exploiting the animals just as Farmer Jones had done. The novel ends with the pigs behaving and even dressing like the humans the animals tried to get rid of in the first place.', 0, './images/Books/Animal_Farm.jpeg'),
(13, 'Tender Is the Night', 3, 12, 'A tragic novel about the rise and fall of a young psychiatrist.', 'Tender Is the Night by F. Scott Fitzgerald is a tragic Jazz Age story tracking the disintegration of an expatriate American couple in Europe. It contrasts the glamorous, privileged lifestyle of charismatic psychiatrist Dick Diver and wealthy heiress Nicole with Dick\'s downward spiral into alcoholism and his wife\'s recovery from severe mental illness.', 0, './images/Books/Tender_is_the_night.jpeg'),
(14, 'Sense and Sensibility', 4, 8.99, 'The story of the Dashwood sisters navigating love and financial hardship.', 'Jane Austen\'s Sense and Sensibility (1811) follows the Dashwood sisters—prudent Elinor and romantic Marianne—who are left impoverished after their father\'s death. As they navigate love and societal pressures, Elinor learns the value of balancing emotion with reason, while Marianne learns the importance of emotional restraint.', 0, './images/Books/Sense_and_sensibility.jpg'),
(15, 'Franny and Zooey', 5, 10.5, 'Two interconnected stories focused on members of the Glass family.', 'J.D. Salinger\'s Franny and Zooey is a two-part spiritual exploration of the brilliant but tormented Glass family. The story follows 20-year-old Franny as she suffers a breakdown over societal superficiality, and her brother Zooey, who intervenes to help her find peace and meaning in everyday life.', 0, './images/Books/Franny and Zooey.jpg'),
(16, 'The Fellowship of the Ring', 6, 20, 'The epic first volume of the Lord of the Rings trilogy.', 'The Fellowship of the Ring follows hobbit Frodo Baggins as he inherits the One Ring. To stop the Dark Lord Sauron from enslaving Middle-earth, Frodo and eight diverse companions form \"The Fellowship\" to destroy the Ring in the fires of Mount Doom.', 0, './images/Books/The_Fellowship_of_the_Ring.jpg'),
(17, 'The Martian Chronicles', 7, 14.5, 'A science fiction short story collection detailing the colonization of Mars.', 'The Martian Chronicles is a science fiction fix-up novel, published in 1950, by American writer Ray Bradbury that chronicles the exploration and settlement of Mars, the home of indigenous Martians, by Americans leaving a troubled Earth that is eventually devastated by nuclear war.', 0, './images/Books/TheMartianChronicles.jpeg'),
(18, 'Typee', 8, 11, 'A travel romance based on the author\'s actual experiences in Polynesia.', 'Typee, first novel by Herman Melville, published in London in 1846 as Narrative of a Four Months’ Residence Among the Natives of a Valley of the Marquesas Islands. Initially regarded as a travel narrative, the novel is based on Melville’s monthlong adventure as a guest-captive of the Typee people, natives of the Marquesas Islands (in present-day French Polynesia), following his desertion from the whaler Acushnet along with shipmate Richard Tobias Greene in July 1842. Melville injured his leg in the escape from the Acushnet, and Greene was allowed to leave the Typees to find Melville a doctor, but he became sidetracked and never returned. Shortly thereafter, Melville was rescued by the Australian whaler Lucy Ann.  In full:Typee is an anthropological study of an exotic and savage native culture that both impressed and frightened Melville (the Typees were allegedly cannibals). The protagonist of the novel, Tom (also known as Tommo), spends four months with his companion, Toby, in a Polynesian island paradise as prisoners of the Typees. Tom’s opportunities for escape are limited by his disease-swollen leg and by his personal jailer-servant, the devoted Kory-Kory. He befriends several natives, notably the beautiful Fayaway. Tom is intrigued by their social and religious customs, but he is also disgusted by their indolence and cannibalism. Ultimately, he chooses “civilization” over idyllic island life.', 0, './images/Books/Typee.jpg'),
(19, 'Island', 9, 15, 'A utopian novel that acts as a counterpart to Brave New World.', 'Island is a 1962 novel by Aldous Huxley. It tells the story of Will Farnaby’s experience on an isolated island called Pala. The novel is written in third person limited omniscient point of view focused on Will’s perspective. While recovering from injury on the island, Will discovers a world that is starkly different from his native England and Western civilization. Through his time on the island, Will changes from a cynical and indifferent Westerner to a man who embraces the Palanese alternative to the West’s exploitative capitalism.', 0, './images/Books/Island.jpg'),
(20, 'The Last Man', 10, 9.5, 'An early apocalyptic sci-fi novel about a world ravaged by plague.', 'The Last Man is an apocalyptic, dystopian science fiction novel by Mary Shelley, first published in 1826. The narrative concerns Europe in the late 21st century, ravaged by the rise of a bubonic plague pandemic that rapidly sweeps across the entire globe, ultimately resulting in the near-extinction of humanity', 0, './images/Books/TheLastMan.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `BookGenre`
--

CREATE TABLE `BookGenre` (
  `book_id` int NOT NULL,
  `genre_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `BookGenre`
--

INSERT INTO `BookGenre` (`book_id`, `genre_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 11),
(6, 12),
(7, 3),
(7, 13),
(8, 14),
(8, 15),
(9, 3),
(9, 13),
(10, 13),
(10, 16),
(11, 1),
(11, 17),
(12, 18),
(12, 19),
(13, 20),
(13, 21),
(14, 7),
(14, 8),
(15, 17),
(15, 22),
(16, 11),
(16, 23),
(17, 13),
(17, 24),
(18, 15),
(18, 25),
(19, 26),
(19, 27),
(20, 13),
(20, 28);

-- --------------------------------------------------------

--
-- Table structure for table `Genre`
--

CREATE TABLE `Genre` (
  `genre_id` int NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Genre`
--

INSERT INTO `Genre` (`genre_id`, `name`) VALUES
(1, 'Southern Gothic'),
(2, 'Classic Literature'),
(3, 'Dystopian'),
(4, 'Political Fiction'),
(5, 'Historical Fiction'),
(6, 'Literary Realism'),
(7, 'Romance'),
(8, 'Comedy of Manners'),
(9, 'Coming-of-age'),
(10, 'Realistic Fiction'),
(11, 'High Fantasy'),
(12, 'Adventure'),
(13, 'Science Fiction'),
(14, 'Epic'),
(15, 'Adventure Fiction'),
(16, 'Gothic Horror'),
(17, 'Literary Fiction'),
(18, 'Political Satire'),
(19, 'Allegory'),
(20, 'Modernist Fiction'),
(21, 'Psychological Realism'),
(22, 'Short Story Collection'),
(23, 'Epic Fantasy'),
(24, 'Fix-up Novel'),
(25, 'Travel Literature'),
(26, 'Utopian Fiction'),
(27, 'Philosophical Fiction'),
(28, 'Apocalyptic Fiction');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `user_id` int NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`user_id`, `username`, `password`, `email`, `phone`) VALUES
(1, 'toto', '$2y$10$gUIhfjh57Lr0uZuxUmlbYuQXaDVVDG2e7.Xetgg31hDguqjdp1LvO', 'adfasdfasd@ed.fr', '123123'),
(2, 'tata', '$2y$10$n2W8s83G5ZZf.zpCBIRqc.1KCUQYQwgLVOlfTW8z2SYYlLaBUothS', 'asdawsd@r3.fr', 'wqeqwe'),
(3, 'sdfsdf', '$2y$10$76dBEylrOXtq4U8JDOWxw.XYl6RpqbpNgmMwacP81Tm/9K.Es9Nai', 'lol@com.fr', '1234'),
(4, 'sdfsdf', '$2y$10$0V/oiFLsQ6ROIZCWP8N5b.piMrLfwiUV9HJ0m.ENWsnF62klBrbBW', 'lol@com.fr', '1234'),
(5, 'toto', '$2y$10$M.diofu9d6ICwBEihct1KO0WvyrP.2RQleE28lN3diizEy9CYEQDy', 'test@com.fr', '21312312'),
(6, 'toto', '$2y$10$297Q3J8wQjzFvRMqj.fX2.XkW8U3EFHhc2cwFLQcIAu4K1tutumSm', 'test@com.fr', '21312312'),
(7, 'toto', '$2y$10$5ZW4SVxuBMkvCMRn1yXGMue5WtT98iwChqS2H.ET6RP2YZ2Bk2US6', 'test@com.fr', '21312312'),
(8, 'sdfsdf', '$2y$10$dEbt5oiqz8o0Cx4b1w0RQOPufeT.pgFTOy4rPgXv5wMQRMQw3F1BK', 'lol@com.fr', '1234'),
(9, 'test', '$2y$10$N2H.kCRg1LWqLxHTaDMAf./96hJYJr7wTtV3PDezp617P4ht5oPvm', 'dfssdfsdf@de.fr', '23912393'),
(10, 'googoo10', '$2y$10$D0iziu1DvQB2fOGuYVMT4OMI6mBgg1EvNi7JIimP4usLVbYL0mKlG', 'dfssdfsdf@de.frd', '2391239332123'),
(11, 'toto', '$2y$10$yr6GgEhgUa3o4QQ0FyjIfeFibHawQTlqrlWhjePlIN7Kti8/kStF.', 'test@com.fr', '21312312'),
(12, 'googoo11', '$2y$10$h7VTsHk2H0Zw7vJ5JXlQ0.jbao4TMm2oAblrj9DpXQIkFAzcbDnjW', 'leoph@ed.fr', '0123456789'),
(13, 'googoo1123', '$2y$10$ffHcuT.Gn.qfis3gFCrke.6ody7CFpYFoS0N3ZUbozAeM7iddoLVW', 'dfssdfsdf@de.frd', '2391239332123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Author`
--
ALTER TABLE `Author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `Genre`
--
ALTER TABLE `Genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Author`
--
ALTER TABLE `Author`
  MODIFY `author_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Book`
--
ALTER TABLE `Book`
  MODIFY `book_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `Genre`
--
ALTER TABLE `Genre`
  MODIFY `genre_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
