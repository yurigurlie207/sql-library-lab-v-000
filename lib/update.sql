UPDATE characters set species = "Martian" WHERE id=(SELECT max(id) from characters);
