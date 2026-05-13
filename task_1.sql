CREATE TABLE categories(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	title TEXT UNIQUE NOT NULL
);

CREATE TABLE posts(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	category_id INTEGER NOT NULL,
	title TEXT,
	views INTEGER DEFAULT 0,
	FOREIGN KEY (category_id) REFERENCES categories(id) 
	ON DELETE RESTRICT
);

INSERT INTO categories (title)
VALUES
	('Technology'),
	('Travel'),
	('Food');
	
INSERT INTO posts(category_id,title,views)
VALUES
	(1, 'Intro to SQL',1),
	(1, 'Python learnings', 525682),
	(2, 'Top 10 countries to visit in 2026', 1525068),
	(2, 'Does hantavirus will affect travels?', 523140),
	(3, 'How to cook a perfect medium rare steak', 673800);
	
SELECT 
	p.title AS post_title,
	p.views,
	c.title AS category_title
FROM posts AS p
INNER JOIN categories AS c
	ON p.category_id = c.id;
	
SELECT 
	c.title AS category_title,
	COUNT(p.id) AS post_count
FROM categories AS c
LEFT JOIN posts AS p 
	on c.id = p.category_id
GROUP BY c.id,c.title;

SELECT 
	c.title AS category_title,
	coalesce(SUM(p.views),0) AS total_views
FROM categories AS c
LEFT JOIN posts AS p 
	on c.id = p.category_id
GROUP BY c.id,c.title
ORDER BY total_views DESC
LIMIT 1;
