--users
INSERT INTO users (name, email, password)
VALUES ('Steve Mine', 'minecraftsteve@yahoo.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Michael Jrodan', 'michaeljrodan@hotmail.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('John Pork', 'crispybcn@yahoo.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Jean-Michel Sebastien', 'Jeanmichelsebastien@yahoo.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Jose Rodriguez', 'joserodriguez@hotmail.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Kimiko Hitoyuri', 'Kimiko@gmail.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
--properties
INSERT INTO properties(owner_id, title, description, thumbnail_photo_url,cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES (3, 'Mansion', 'Mansion in the hills', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg','255','15','7','10','England','Dover','West Hill','Kent','BR6 7PU',TRUE),
(2, 'Studio', 'Beautiful studio in up and coming neighbourhood', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg','25', '1','1','1','United States of America','W 47th St','New York City','New York',10036,False),
(1, 'Chalet','Newly renovated by lake', 'https://images.pexels.com/photos/2080018/pexels-photo-2080018.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2080018/pexels-photo-2080018.jpeg','55','3','3','4','Canada','chemin de pepin','Saint-Michel','Quebec','K09 8L2',True);

--reservations
INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2020-02-19', '2020-03-01', 1, 4),
('2021-11-25', '2021-12-25', 2, 6),
('2024-04-16', '2024-04-20', 3, 5);

--property_review
INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (4, 1, 4, '3', 'Great location but i asked for horses and they were unavailble do to the rain. Otherwise, amazing spot.'),
(6, 2, 5, '5', 'Perfect spot in the heart of the cit, tons of activities around and great restaurants. I guess its not called Hell''s Kitchen for nothing.'),
(5, 3, 6, '1', 'Horrible spot. The lake was so dirty and smelled of dead fish. I would never recommend.');
