CREATE DATABASE tn_election_analysis;
USE tn_election_analysis;
CREATE TABLE election_results (
	code varchar(100),
    constituency VARCHAR(100),
    candidate VARCHAR(100),
    party VARCHAR(50),
    EVM_votes int,
   postal_votes INT,
   total_votes int,
   votes_percent int,
   Rouund int,
   last_updated_time time,
   last_updated_date date);

show tables ;
select * from eci_results_tamilnadu_2026;
DESCRIBE eci_results_tamilnadu_2026;

SELECT COUNT(*) AS total_rows
FROM eci_results_tamilnadu_2026;

SELECT COUNT(DISTINCT party) AS total_parties
FROM eci_results_tamilnadu_2026;

SELECT COUNT(DISTINCT constituency) AS total_constituencies
FROM eci_results_tamilnadu_2026;

SHOW COLUMNS FROM eci_results_tamilnadu_2026;

SELECT 
    party,
    SUM(`Total Votes`) AS total_votes
FROM eci_results_tamilnadu_2026
GROUP BY party
ORDER BY total_votes DESC;

SELECT 
    candidate,
    party,
    `Total Votes`
FROM eci_results_tamilnadu_2026
ORDER BY `Total Votes` DESC
LIMIT 10;

SELECT 
    constituency,
    SUM(`Total Votes`) AS constituency_votes
FROM eci_results_tamilnadu_2026
GROUP BY constituency
ORDER BY constituency_votes DESC
LIMIT 10;

SELECT 
    party,
    SUM(`Total Votes`) AS total_votes,
    ROUND(
        SUM(`Total Votes`) * 100.0 /
        (SELECT SUM(`Total Votes`)
         FROM eci_results_tamilnadu_2026),
         2
    ) AS vote_share_percentage
FROM eci_results_tamilnadu_2026
GROUP BY party
ORDER BY vote_share_percentage DESC;

SELECT 
    candidate,
    party,
    `Total Votes`,
    RANK() OVER(ORDER BY `Total Votes` DESC) AS rank_position
FROM eci_results_tamilnadu_2026;

SELECT 
    constituency,
    candidate,
    party,
    `Total Votes`
FROM eci_results_tamilnadu_2026
ORDER BY `Total Votes` DESC;
