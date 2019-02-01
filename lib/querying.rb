def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year
   FROM books
   WHERE series_id = 1
   ORDER BY year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
   FROM characters
   WHERE length(motto) = (SELECT max(length(motto)) FROM characters);"
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, count(species) as total
   FROM characters
   GROUP BY species
   HAVING total = (SELECT count(species) as total FROM characters GROUP BY species ORDER BY total DESC LIMIT 1);"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
   FROM authors
   INNER JOIN series
   ON authors.id = series.author_id
   JOIN subgenres
   ON subgenres.id = series.subgenre_id;"
end

def select_series_title_with_most_human_characters
  "SELECT title
   FROM series
   WHERE id = (SELECT series_id
                  FROM characters
                  WHERE species = \"human\"
                  GROUP BY series_id
                  ORDER BY count(species) DESC Limit 1);"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name as Name, count(book_id) as Books
   FROM characters
   INNER JOIN character_books
   ON characters.id = character_books.character_id
   GROUP BY character_id
   ORDER BY Books DESC, Name Asc;"
end
