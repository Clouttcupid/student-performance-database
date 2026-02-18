# Student Performance Tracking Database

## Overview
This project implements a normalized relational database in MySQL designed to support student performance tracking, goal management, and advisory content.

The schema enforces referential integrity using primary keys, foreign keys, and composite keys to maintain data consistency and prevent orphan records.

## Features
- One-to-many and many-to-many relationships  
- Junction table implementation (`StudentTeacher`)  
- Composite primary keys  
- NOT NULL and UNIQUE constraints  
- Referential integrity enforcement  
- Scalable schema design  

## Technologies
- MySQL  
- MySQL Workbench  
- SQL  

## Schema Highlights
- Students linked to Parents (one-to-many)  
- Students linked to Teachers (many-to-many)  
- Goals linked to Progress Entries  
- Advice topics linked to Advice Items  

## How to Run
1. Open MySQL Workbench  
2. Import `schema.sql`  
3. Execute script to create database structure  
