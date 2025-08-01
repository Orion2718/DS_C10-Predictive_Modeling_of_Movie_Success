-- Capstone Project --

Create Database Cap_movD;

-- After the creation of the Database, the excel files are imported and added as tables in SQL Database. This importing is done from the Schemas by selecting the option for importing.

Use Cap_movD;

-- A new table is created that combines all the useful columns from the three tables and is combined into one table and exported into a new excel file.


Create Table Movie_DF as 
	Select 
    tcre.movie_id,
    tcre.title,
    tm.genres,
    tm.original_language,
    tm.production_companies,
    tm.production_countries,
    tm.actors,
    tm.director,
    tm.profit,
    tmov.budget,
    tmov.popularity,
    tmov.release_date,
    tmov.revenue,
    tmov.runtime,
    tmov.status,
    tmov.vote_average,
    tmov.vote_count 
    From 
    tmdb_movies tm
        Left Join
    tmdb_5_credits tcre ON tm.id = tcre.movie_id
        Left Join
    tmdb_5_movies tmov ON tcre.title = tmov.title;




-- Top movies based on Revenue

Select title, vote_average, budget, revenue, runtime From tmdb_5_movies order by revenue Desc limit 5;

Create view rev as Select title, vote_average, budget, revenue, runtime From tmdb_5_movies order by revenue Desc limit 5;



-- Top movies based on Runtime

Select id, title, vote_average, revenue, runtime From tmdb_5_movies order by runtime Desc limit 5;

Create view RT as Select id, title, vote_average, revenue, runtime From tmdb_5_movies order by runtime Desc limit 5;