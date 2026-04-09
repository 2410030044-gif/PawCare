-- ============================================================
--  PetCare Portal  –  Full Setup Script
--  Run this directly in MySQL Workbench / MySQL CLI
--  mysql -u root -p < petapp_full_setup.sql
-- ============================================================

-- 1. Create & select database
CREATE DATABASE IF NOT EXISTS petapp
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE petapp;

-- 2. Drop existing table (clean slate)
DROP TABLE IF EXISTS pet;

-- 3. Create table (matches JPA entity exactly)
CREATE TABLE pet (
    id     INT          NOT NULL AUTO_INCREMENT,
    name   VARCHAR(100) NOT NULL,
    type   VARCHAR(50)  NOT NULL,
    age    INT          NOT NULL DEFAULT 0,
    status VARCHAR(50)  NOT NULL DEFAULT 'Available',
    PRIMARY KEY (id)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- ============================================================
--  4. Insert 45 pets
-- ============================================================

INSERT INTO pet (name, type, age, status) VALUES

-- ── Dogs (14) ──────────────────────────────────────────────
('Buddy',    'Dog',     3,  'Available'),
('Max',      'Dog',     5,  'Adopted'),
('Charlie',  'Dog',     4,  'Pending'),
('Coco',     'Dog',     6,  'Adopted'),
('Rocky',    'Dog',     7,  'Available'),
('Lola',     'Dog',     3,  'Pending'),
('Bear',     'Dog',     8,  'Available'),
('Duke',     'Dog',     4,  'Adopted'),
('Toby',     'Dog',     6,  'Pending'),
('Molly',    'Dog',     2,  'Available'),
('Sadie',    'Dog',     5,  'Adopted'),
('Shadow',   'Dog',     5,  'Pending'),
('Rusty',    'Dog',     3,  'Available'),
('Archie',   'Dog',     1,  'Available'),

-- ── Cats (12) ──────────────────────────────────────────────
('Luna',     'Cat',     2,  'Available'),
('Bella',    'Cat',     1,  'Available'),
('Nala',     'Cat',     3,  'Available'),
('Daisy',    'Cat',     2,  'Adopted'),
('Simba',    'Cat',     4,  'Available'),
('Lily',     'Cat',     5,  'Adopted'),
('Zoe',      'Cat',     2,  'Available'),
('Chloe',    'Cat',     3,  'Available'),
('Leo',      'Cat',     1,  'Available'),
('Whiskers', 'Cat',     6,  'Available'),
('Ginger',   'Cat',     4,  'Available'),
('Pearl',    'Cat',     2,  'Adopted'),

-- ── Birds (5) ──────────────────────────────────────────────
('Pepper',   'Bird',    2,  'Available'),
('Kiwi',     'Bird',    1,  'Available'),
('Mango',    'Bird',    3,  'Adopted'),
('Tweety',   'Bird',    2,  'Available'),
('Sunny',    'Bird',    4,  'Pending'),

-- ── Rabbits (6) ────────────────────────────────────────────
('Milo',     'Rabbit',  2,  'Available'),
('Oscar',    'Rabbit',  1,  'Available'),
('Snowball', 'Rabbit',  3,  'Available'),
('Thumper',  'Rabbit',  2,  'Adopted'),
('Biscuit',  'Rabbit',  1,  'Available'),
('Hazel',    'Rabbit',  2,  'Available'),

-- ── Fish (4) ───────────────────────────────────────────────
('Nemo',     'Fish',    1,  'Available'),
('Dory',     'Fish',    2,  'Available'),
('Goldie',   'Fish',    1,  'Adopted'),
('Splash',   'Fish',    1,  'Available'),

-- ── Hamsters (4) ───────────────────────────────────────────
('Nibbles',  'Hamster', 1,  'Available'),
('Peanut',   'Hamster', 2,  'Available'),
('Fluffy',   'Hamster', 1,  'Adopted'),
('Pippin',   'Hamster', 1,  'Available');

-- ============================================================
--  5. Verify — summary by type
-- ============================================================
SELECT
    type                              AS `Type`,
    COUNT(*)                          AS `Total`,
    SUM(status = 'Available')         AS `Available`,
    SUM(status = 'Adopted')           AS `Adopted`,
    SUM(status = 'Pending')           AS `Pending`
FROM pet
GROUP BY type
ORDER BY Total DESC;

-- Full list
SELECT * FROM pet ORDER BY type, name;
