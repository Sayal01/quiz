-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2024 at 11:26 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`) VALUES
(1, 'sayal', 'sayal', 'sayal123'),
(4, 'aajj', 'as123@gmail.com', 'qwerty123'),
(8, 'aja1', 'qwe123@gmail.com', '$2y$10$6Rkd3og3Ws6eSdbPjncw8O2EFuQhtlh/sXDi9YmmdOmnQ6us09S1y'),
(9, 'sayal', 'sayalmdr18@gmail.com', '$2y$10$ObAnvV1.E4puXgHqAEYk2./MYEcQWT8y9u1bqxwrkhpzI5SSyW5PW'),
(10, 'Rupesh', 'rupesh@gmail.com', '$2y$10$gRxUcHPcT5mCKuPsMqYeQ.6SAVuYNDulWZ2OzZtXOPjEn0VOvP3XS');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `addedBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `addedBy`) VALUES
(1, 'BCA', 1),
(2, 'BBS', 1),
(5, 'GK', 4);

-- --------------------------------------------------------

--
-- Table structure for table `daily_score`
--

CREATE TABLE `daily_score` (
  `score_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `submission_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daily_score`
--

INSERT INTO `daily_score` (`score_id`, `user_id`, `score`, `submission_time`) VALUES
(5, 1, 511, '2023-06-16 13:37:41'),
(6, 1, 16, '2023-06-22 16:31:22'),
(7, 4, 3, '2023-06-22 17:21:34'),
(8, 4, 8, '2023-06-23 08:06:57'),
(9, 1, 36, '2023-06-23 08:11:25'),
(10, 6, 7, '2023-06-23 15:09:44'),
(11, 1, 3, '2023-07-21 10:03:21'),
(12, 1, 1, '2023-08-23 20:35:19'),
(13, 1, 0, '2023-08-24 14:32:33'),
(14, 1, 1, '2023-08-26 17:22:38'),
(15, 1, 6, '2023-08-27 08:06:44'),
(16, 1, 17, '2023-09-20 21:26:31'),
(17, 1, 1, '2023-09-24 11:15:59'),
(18, 7, 7, '2023-10-15 19:30:44'),
(19, 1, 0, '2023-10-15 19:44:25'),
(20, 1, 14, '2023-10-16 18:38:16'),
(21, 8, 0, '2023-10-16 20:57:50'),
(22, 1, 1, '2023-10-17 09:07:43');

-- --------------------------------------------------------

--
-- Table structure for table `leaderboard`
--

CREATE TABLE `leaderboard` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `submission_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leaderboard`
--

INSERT INTO `leaderboard` (`id`, `user_id`, `username`, `score`, `submission_time`) VALUES
(5, 1, 'sayal', 120, '2023-10-17 09:07:43'),
(7, 7, 'sayal123', 7, '2023-10-15 19:34:17'),
(8, 8, 'rupesh123', 0, '2023-10-16 20:57:59');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `correct_option` varchar(255) NOT NULL,
  `addedBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `topic_id`, `question`, `option1`, `option2`, `option3`, `option4`, `correct_option`, `addedBy`) VALUES
(9, 1, 'What is the full form of DBMS?', ' Data of Binary Management System', 'Database Management System', 'Database Management Service', 'Data Backup Management System', 'Database Management System', 1),
(10, 1, 'What is a database?', 'Organized collection of information that cannot be accessed, updated, and managed', 'Collection of data or information without organizing', 'Organized collection of data or information that can be accessed, updated, and managed', 'Organized collection of data that cannot be updated', 'Organized collection of data or information that can be accessed, updated, and managed', 1),
(11, 1, ' What is DBMS?', 'DBMS is a collection of queries', ' DBMS is a high-level language', 'DBMS is a programming language', 'DBMS stores, modifies and retrieves data', 'DBMS stores, modifies and retrieves data', 1),
(12, 1, 'Who created the first DBMS?', 'Edgar Frank Codd', 'Charles Bachman', 'Charles Babbage', 'Sharon B. Codd', 'Charles Bachman', 1),
(13, 1, ' Which type of data can be stored in the database?', ' Image oriented data', 'Text, files containing data', 'Data in the form of audio or video', 'All of the above', 'All of the above', 1),
(14, 1, 'In which of the following formats data is stored in the database management system?', 'image', 'text', 'table', 'graph', 'table', 1),
(15, 1, 'Which of the following is known as a set of entities of the same type that share same properties, or attributes?', 'Relation set', 'Tuples', 'Entity set', 'Entity Relation model', 'Entity set', 1),
(16, 1, 'What is information about data called?', 'Hyper data', 'tera data', 'meta data', 'relations', 'meta data', 1),
(17, 1, 'What does an RDBMS consist of?', 'Collection of Records', 'Collection of keys', 'Collection of tables', 'Collection of fields', 'Collection of tables', 1),
(18, 1, 'The values appearing in given attributes of any tuple in the referencing relation must likewise occur in specified attributes of at least one tuple in the referenced relation, according to _____________________ integrity constraint.', 'Referential', 'Primary', 'Refrencing', 'Specific', 'Referential', 1),
(19, 1, '_____________ is a hardware component that is most important for the operation of a database management system.', 'Microphone', 'High speed,large capacity disk to store data', 'High resolution video display', 'printer', 'High speed,large capacity disk to store data', 1),
(20, 1, 'The DBMS acts as an interface between ________________ and ________________ of an enterprise-class system.', 'Data and the DBMS', 'Application and SQL', 'Database application and the database', 'The user and the software', 'Database application and the database', 1),
(21, 1, ' The ability to query data, as well as insert, delete, and alter tuples, is offered by ____________', 'TCL', 'DCL', 'DDL', 'DML', 'DML', 1),
(22, 1, ' ______________ is a set of one or more attributes taken collectively to uniquely identify a record.', 'Primary key', 'Foreign key', 'Super key', 'Candidate key', 'Super key', 1),
(23, 1, ' Which command is used to remove a relation from an SQL?', 'Drop table', 'Delete', 'Purge', 'Remove', 'Drop table', 1),
(60, 12, 'Which of the following is NOT usually considered a member of the executive committee of a hotel?', 'Director of Catering', 'Rooms Division Manager', 'Director of Food and Beverage', 'director of Engineering', 'Director of Catering', 4),
(61, 12, 'Rooms Division includes which one of the following?', 'security', 'guest services', 'housekeeping', 'all of the above', 'all of the above', 4),
(62, 12, 'To which department does the concierge report?', 'human resources', 'front office', 'security', 'accounting', 'front office', 4),
(63, 12, 'Hotel performance is based on which of the following operating ratios?', 'ADR', 'ROP', 'RTS', 'both 1 and 2', 'both 1 and 2', 4),
(64, 12, 'Hotels add a charge to all long distance calls made by the guest. This charge is typically:', '20%', '50%', '30%', '40%', '50%', 4),
(65, 14, 'During whose reign Mahayana sect of Buddhism came into existence?', 'Ashoka', ' Kanishka', 'Ajatsatru', 'Nagarjuna', ' Kanishka', 4),
(66, 14, 'All India Harijan Sangha established in? ', '1930', '1931', '1932', '1933', '1932', 4),
(67, 14, 'Egypt is also called what?', 'Gift of Nile', 'Gift of the World', 'Gift of Sun', 'Gift of Sphinx', 'Gift of Nile', 4),
(68, 14, 'Who is known as the father of History?', 'Sophocles', 'Homer', 'Herodotus', 'Aristophanes', 'Herodotus', 4),
(69, 14, 'The first Olympic Games were held in?', '776 BC', '745 BC', '779 BC', '749 BC', '776 BC', 4),
(70, 14, 'The Reformation Movement was started by whom?', 'King Henry VIII.', 'Martin Luther.', 'John Calvin.', 'illiam Tyndale.', 'Martin Luther.', 4),
(71, 14, 'When did Americans gain independence?', '4th July 1773', '4th July 1774', '4th July 1771', '4th July 1775', '4th July 1775', 4),
(72, 14, 'When did World War I start?', 'July 28, 1914.', 'July 28, 1915.', 'July 25, 1914.', 'July 28, 1920.', 'July 28, 1914.', 4),
(73, 14, 'The Second World War started.', 'September 1937', 'September 1930.', 'September 1939.', 'September 1938.', 'September 1939.', 4),
(74, 14, ' What was the immediate cause of the beginning of the First World War?', 'The murder of William I.', 'The murder of Archduke Ferdinand.', 'The murder of Victor Emmanuel II.', 'The murder of William II.', 'The murder of Archduke Ferdinand.', 4),
(75, 15, 'When was National Food Security Act enacted?', '2004', '2010', '2013', '2000', '2013', 4),
(76, 15, 'Which of the following is/are the variety of rice? ', 'Padma', 'Bala', 'Kiron', 'All of the above', 'All of the above', 4),
(77, 15, 'Among the agricultural commodities produced by India, India is the largest producer of which one of the following commodities ?', 'Wheat', 'Tea', 'Pulses', 'Maize', 'Pulses', 4),
(78, 15, 'Which of the following state is the highest milk producing state in India?', 'Uttar Pradesh', 'Rajasthan', 'Andhra Pradesh', 'Gujarat ', 'Rajasthan', 4),
(79, 15, 'Which type of farming is practiced in areas of high population pressure on land?', 'Extensive subsistence farming', 'Commercial farming', 'Primitive subsistence farming', 'Intensive subsistence farming', 'Intensive subsistence farming', 4),
(80, 15, 'Which colour is associated with the revolution in fertilisers ?', 'Pink', 'Golden', 'Black', 'Grey', 'Grey', 4),
(81, 15, 'Which of the following are Rabi crops only?', 'Maize and peas', 'Barley and gram', 'Paddy and cotton', 'Wheat and jowar', 'Barley and gram', 4),
(82, 15, 'Muga silk is associated to which of the following states of India?', 'Arunachal Pradesh', 'Bihar', 'Maharashtra', 'Assam', 'Assam', 4),
(83, 15, 'Which state among the following is the largest producer of chilli in India?', 'Madhya Pradesh', 'West Bengal', 'Andhra Pradesh', 'Rajasthan', 'Andhra Pradesh', 4),
(84, 15, 'The expected returns to farmers by way of MSP (Minimum Support Price) over their cost of production for barley for marketing season 2021–22 is estimated at ______.', '65%', '93%', '50%', '106%', '65%', 4),
(85, 10, 'A linear list of elements in which deletion can be done from one end (front) and insertion can take place only at the other end (rear) is known as _____________', 'Queue', 'Stack', 'Tree', 'Linked list', 'Queue', 4),
(86, 10, 'The data structure required for Breadth First Traversal on a graph is?', 'Stack', 'Array', 'Queue', 'Tree', 'Queue', 4),
(87, 10, 'A queue follows __________', 'FIFO (First In First Out) principle', 'LIFO (Last In First Out) principle', 'Ordered array', 'Linear tree', 'FIFO (First In First Out) principle', 4),
(88, 10, 'Circular Queue is also known as ________', 'Ring Buffer', 'Square Buffer', ' Rectangle Buffer', 'Curve Buffer', 'Ring Buffer', 4),
(89, 10, 'A data structure in which elements can be inserted or deleted at/from both ends but not in the middle is?', 'Queue', 'Circular queue', 'Dequeue', 'Priority queue', 'Dequeue', 4),
(90, 10, 'Which of the following is not the type of queue?', 'Ordinary queue', 'Single ended queue', 'Circular queue', 'Priority queue', 'Single ended queue', 4),
(91, 10, 'Queues serve major role in ______________', 'simulation of recursion', 'Simulation of arbitrary linked list', 'Simulation of limited resource allocation', 'Simulation of heap sort', 'Simulation of limited resource allocation', 4),
(92, 10, ' In linked list implementation of queue, if only front pointer is maintained, which of the following operation take worst case linear time?', 'Insertion', 'Deletion', 'To empty a queue', 'Both Insertion and To empty a queue', 'Both Insertion and To empty a queue', 4),
(93, 10, ' In linked list implementation of a queue, where does a new element be inserted?', 'At the head of link list', 'At the centre position in the link list', 'At the tail of the link list', 'At any position in the linked list', 'At the centre position in the link list', 4),
(94, 10, 'In case of insertion into a linked queue, a node borrowed from the __________ list is inserted in the queue.', 'AVAIL', ' FRONT', 'REAR', 'NULL', 'AVAIL', 4),
(95, 10, 'In linked list implementation of a queue, from where is the item deleted?', ' At the head of link list', 'At the centre position in the link list', 'At the tail of the link list', 'Node before the tail', ' At the head of link list', 4),
(96, 10, 'The essential condition which is checked before insertion in a linked queue is?', 'Underflow', 'Overflow', 'Front value', 'Rear value', 'Overflow', 4),
(97, 10, 'The essential condition which is checked before deletion in a linked queue is?', 'Underflow', 'Overflow', 'ront value', 'Rear value', 'Underflow', 4),
(98, 13, 'What is JavaScript?', ' JavaScript is a scripting language used to make the website interactive', 'JavaScript is an assembly language used to make the website interactive', 'JavaScript is a compiled language used to make the website interactive', 'None of the mentioned', ' JavaScript is a scripting language used to make the website interactive', 4),
(99, 13, 'Which of the following is correct about JavaScript?', 'JavaScript is an Object-Based language', ' JavaScript is Assembly-language', 'JavaScript is an Object-Oriented language', 'JavaScript is a High-level language', 'JavaScript is an Object-Based language', 4),
(100, 13, ' Arrays in JavaScript are defined by which of the following statements?', 'It is an ordered list of values', 'It is an ordered list of objects', 'It is an ordered list of string', ' It is an ordered list of functions', 'It is an ordered list of values', 4),
(101, 13, 'Which of the following is not javascript data types?', 'Null type', 'Undefined type', 'Number type', 'All of the mentioned', 'All of the mentioned', 4),
(102, 13, 'Which of the following object is the main entry point to all client-side JavaScript features and APIs?', 'Position', 'Window', 'Standard', 'Location', 'Window', 4),
(103, 13, ' Which of the following can be used to call a JavaScript Code Snippet?', 'Function/Method', 'Preprocessor', 'Triggering Event', 'RMI', 'Function/Method', 4),
(104, 13, 'Which of the following scoping type does JavaScript use?', 'Sequential', 'Segmental', 'Lexical', 'Literal', 'Lexical', 4),
(105, 13, 'Why JavaScript Engine is needed?', ' Both Compiling & Interpreting the JavaScript', 'Parsing the javascript', 'Interpreting the JavaScript', ' Compiling the JavaScript', 'Interpreting the JavaScript', 4),
(106, 13, 'Why event handlers is needed in JS?', 'Allows JavaScript code to alter the behaviour of windows', 'Adds innerHTML page to the code', 'Change the server location', 'Performs handling of exceptions and occurrences', 'Allows JavaScript code to alter the behaviour of windows', 4),
(107, 13, 'Which of the following is not an error in JavaScript?', 'Missing of Bracket', 'Division by zero', 'yntax error', ' Missing of semicolons', 'Division by zero', 4),
(108, 13, 'Which function is a synonym for on()?', 'addListener()', 'listeners()', 'once()', 'add()', 'addListener()', 4),
(109, 13, 'Which object supports Filesystem API?', 'Element', ' File', 'Window', 'DOM', ' File', 4),
(110, 9, '__________ is a specialised branch of accounting that keeps track of a company’s financial transactions.', ' Cost accounting', 'Management accounting', 'Financial Accounting', 'Corporate accounting', 'Financial Accounting', 4),
(111, 9, 'Financial accountancy is governed by ___________', 'local standards only', 'international standards', 'local as well as international accounting standards', 'company’s internal top management only', 'local as well as international accounting standards', 4),
(112, 9, '_____ is the scope of financial accounting.', 'Collection and processing of data', 'Verifying or auditing data', ' Publishing data', 'All of the above', 'All of the above', 4),
(113, 9, 'Which is not a benefit of financial accounting?', 'Maintaining systematic records', 'Protecting and safeguarding business assets', 'Historical in nature', 'Facilitates rational decision making', 'Historical in nature', 4),
(114, 9, 'Which is not a limitation of financial accounting?', 'Inadequate information to fix up the price of products manufactured', ' Lack of data for comparison of cost of operation of the firm with other firms in the industry', 'The data available is historical in nature', 'Complies with the various legal requirements', 'Inadequate information to fix up the price of products manufactured', 4),
(115, 9, 'The overriding purpose of financial accounting is to summarize financial activity in business in the ______', 'profit and loss statement', 'balance sheet', 'cash flow statement', 'all of the above', 'all of the above', 4),
(116, 9, '_________ are the basis of the business’s financial accounting.', 'Accounting records', 'Bookkeeping', 'Sales Volume', 'Both A & B', 'Both A & B', 4),
(117, 9, 'Financial accounting reports to the ________ after the completion of the accounting year.', 'internal management', 'external parties', 'Media', 'rivals', 'external parties', 4),
(118, 9, 'Financial accounting cover overall performance of the _______', 'Competitors', ' Market', 'Company', 'Finance department', 'Company', 4),
(119, 9, 'Financial accounting reports lay greater emphasis on the _______', 'objectivity of data', 'Flexibility of data', 'Relevancy of data', 'Subjectivity of data', 'objectivity of data', 4),
(120, 9, 'Cash flow is also known as _____', 'balance sheet flow', 'profit and loss account', 'fund flow statement', 'notes and schedules', 'fund flow statement', 4);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_topics`
--

CREATE TABLE `quiz_topics` (
  `topic_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `topic_name` varchar(255) NOT NULL,
  `addedBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_topics`
--

INSERT INTO `quiz_topics` (`topic_id`, `category_id`, `topic_name`, `addedBy`) VALUES
(1, 1, 'Database', 1),
(9, 2, 'account', 1),
(10, 1, 'DSA', 1),
(12, 2, 'Hotel Management', 1),
(13, 1, 'Scripting Language', 1),
(14, 5, 'history', 4),
(15, 5, 'agriculture', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`) VALUES
(1, 'sayal', 'sayalmdr23@gmail.com', '$2y$10$bmqnL6akeKCUfLwWqLrGV.e24O1X3akoBGr6QfOQQE2n.qt4kthee'),
(2, 'rupesh', 'rupsmdr23@gmail.com', '$2y$10$p4NcSgD9gGWc8RsFRyqP1uzxc6TEm32UtxArRV6agrj2iHaTF7TKu'),
(4, 'ajay', 'shresthaajay961@gmail.com', '$2y$10$w6KGeScP8avjczZoUcdKEOGJcERAIFqDckcR5GOh.yuNZBm5ci2r6'),
(6, 'ishan', 'ishan@gmail.com', '$2y$10$liftvD4W6P3gpkpI0QDZRuqKtnMpLyPLl94CBS.Urd8H.fYCRX86q'),
(7, 'sayal123', 'sayalmdr230@gmail.com', '$2y$10$ETTo88X4Cn4ldSh8h.uUSOc81CoUX7GtvjyDrfelgeVS.yC6t/WJy'),
(8, 'rupesh123', 'rupesh@gmail.com', '$2y$10$q99mSRLMIKb6HVVavPZrfOseUuzrSaZNiADoO32G.1ixYTUejM60y'),
(9, 'rupsMdr', 'sayalmdr3@gmail.om', '$2y$10$XdCMIOWqKY8NtCRZNulfEe4pFIS4TSw3wx2lbP70.t1/BfOYC87Um');

-- --------------------------------------------------------

--
-- Table structure for table `user_responses`
--

CREATE TABLE `user_responses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `selected_option` varchar(255) NOT NULL,
  `submission_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_responses`
--

INSERT INTO `user_responses` (`id`, `user_id`, `question_id`, `selected_option`, `submission_time`) VALUES
(422, 6, 78, 'Rajasthan', '2023-06-23 15:16:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `addedBy` (`addedBy`);

--
-- Indexes for table `daily_score`
--
ALTER TABLE `daily_score`
  ADD PRIMARY KEY (`score_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `leaderboard`
--
ALTER TABLE `leaderboard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `questions_ibfk_2` (`addedBy`);

--
-- Indexes for table `quiz_topics`
--
ALTER TABLE `quiz_topics`
  ADD PRIMARY KEY (`topic_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `addedBy` (`addedBy`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_responses`
--
ALTER TABLE `user_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `daily_score`
--
ALTER TABLE `daily_score`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `leaderboard`
--
ALTER TABLE `leaderboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `quiz_topics`
--
ALTER TABLE `quiz_topics`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_responses`
--
ALTER TABLE `user_responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=524;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`addedBy`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `daily_score`
--
ALTER TABLE `daily_score`
  ADD CONSTRAINT `daily_score_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `leaderboard`
--
ALTER TABLE `leaderboard`
  ADD CONSTRAINT `leaderboard_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `quiz_topics` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`addedBy`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_topics`
--
ALTER TABLE `quiz_topics`
  ADD CONSTRAINT `quiz_topics_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quiz_topics_ibfk_2` FOREIGN KEY (`addedBy`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_responses`
--
ALTER TABLE `user_responses`
  ADD CONSTRAINT `user_responses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_responses_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
