#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals + opponent_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals + opponent_goals) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) FROM games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(game_id) FROM games WHERE winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT t.name FROM games AS g RIGHT JOIN teams AS t ON g.winner_id = t.team_id WHERE g.year = 2018 AND g.round = 'Final'")" 

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT DISTINCT(t.name) FROM teams AS t FULL JOIN games AS wi ON t.team_id = wi.winner_id FULL JOIN games op ON t.team_id = op.opponent_id WHERE (wi.year = 2014 OR op.year = 2014) AND (wi.round = 'Eighth-Final' OR op.round = 'Eighth-Final')")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT(t.name) FROM teams AS t INNER JOIN games AS g ON t.team_id = g.winner_id ORDER BY t.name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT g.year, t.name FROM teams AS t INNER JOIN games AS g on t.team_id = g.winner_id WHERE g.round = 'Final' ORDER BY g.year")" 

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "Select name from teams where name like 'Co%'")"