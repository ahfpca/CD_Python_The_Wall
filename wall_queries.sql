USE the_Wall_DB;


-- SELECT * FROM messages;

# Dummy Post Records
-- INSERT INTO messages (user_id, user_msg, created_at, updated_at) VALUES (1, 'As with bootstrap’s own plugins, datepicker provides a data-api that can be used to instantiate datepickers without the need for custom javascript. For most datepickers, simply set data-provideon the element you want to initialize, and it will be intialized lazily, in true bootstrap fashion. these will be immediately initialized on page load, and cannot be lazily loaded.', NOW(), NOW());
-- NSERT INTO messages (user_id, user_msg, created_at, updated_at) VALUES (2, 'Using media queries are a popular technique for delivering a tailored style sheet (responsive web design) to desktops, laptops, tablets, and mobile phones.', NOW(), NOW());


-- SELECT * FROM comments;

# Dummy Comment Records
-- INSERT INTO comments (message_id, user_id, user_cmnt, created_at, updated_at) VALUES (1, 2, 'President Donald Trump\'s new attorney, Rudy Giuliani, told CNN on Thursday that Trump "wasn\'t aware" his longtime personal lawyer Michael Cohen pitched his access to the President to potential clients following the 2016 election and landed lucrative consulting deals as a result.', NOW(), NOW());
-- INSERT INTO comments (message_id, user_id, user_cmnt, created_at, updated_at) VALUES (1, 3, 'I talked to the President only one time about this and that was the first day it came out and he wasn\'t aware of that situation that now, I guess, the facts are getting a little contorted', NOW(), NOW());
-- INSERT INTO comments (message_id, user_id, user_cmnt, created_at, updated_at) VALUES (1, 2, 'I don\'t know who\'s been representing you, but you should fire them all. I\'m the guy you should hire. I\'m closest to the President. I\'m his personal lawyer.', NOW(), NOW());
-- 
-- INSERT INTO comments (message_id, user_id, user_cmnt, created_at, updated_at) VALUES (2, 1, 'Lawyers representing Cohen have pushed back against Avenatti\'s disclosures. In a court filing on Wednesday, Cohen\'s attorney\'s wrote, "While much of the information in his \'report\' is completely inaccurate.', NOW(), NOW());
-- INSERT INTO comments (message_id, user_id, user_cmnt, created_at, updated_at) VALUES (2, 3, 'In part, that\'s due to federal rules that sought to crack down on the subprime lending tactics that helped bring on the financial crisis. Also, skyrocketing housing costs have locked many people of modest means out of the market.', NOW(), NOW());
-- INSERT INTO comments (message_id, user_id, user_cmnt, created_at, updated_at) VALUES (2, 4, 'Large banks have blamed their departure from FHA lending on litigation brought against them by the Department of Justice.', NOW(), NOW());
-- INSERT INTO comments (message_id, user_id, user_cmnt, created_at, updated_at) VALUES (2, 1, 'Frankly it\'s kind of disturbing to me.', NOW(), NOW());
-- INSERT INTO comments (message_id, user_id, user_cmnt, created_at, updated_at) VALUES (2, 4, 'We think every lending institution has an obligation to lend to people of modest means.', NOW(), NOW());
 
-- INSERT INTO comments (message_id, user_id, user_cmnt, created_at, updated_at) VALUES (2, 4, '', NOW(), NOW());

# Posts Query
-- SELECT m.message_id, m.user_id, CONCAT_WS(' ', u.first_name, u.last_name) user_name, m.user_msg, m.created_at, m.updated_at, DATE_FORMAT(m.created_at, '%M %D %Y') cDate
-- FROM messages m
-- JOIN users u ON u.user_id = m.user_id;

# Posts Query with Comments Count
SELECT m.message_id, m.user_id, CONCAT_WS(' ', u.first_name, u.last_name) user_name, m.user_msg, m.created_at, m.updated_at, DATE_FORMAT(m.created_at, '%M %D %Y - %H:%m:%s') cDate, COUNT(c.comment_id) cmtCount
FROM messages m
JOIN users u ON u.user_id = m.user_id
LEFT JOIN comments c ON c.message_id = m.message_id
GROUP BY m.message_id, m.user_id, user_name, m.user_msg, m.created_at, m.updated_at, cDate
ORDER BY m.created_at DESC;

# Comments Query
-- SELECT c.comment_id, c.message_id, c.user_id, CONCAT_WS(' ', u.first_name, u.last_name) user_name, c.user_cmnt, c.created_at, c.updated_at, DATE_FORMAT(c.created_at, '%M %D %Y - %H:%m:%s') cDate
-- FROM comments c
-- JOIN users u ON u.user_id = c.user_id
-- ORDER BY created_at DESC;

