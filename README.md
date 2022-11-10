
## Note to amended Celestial Bodies Database

### Celestial Bodies Database

#### Instructions

For this project, you need to log in to PostgreSQL with psql to create your database. Do that by entering psql --username=freecodecamp --dbname=postgres in the terminal. Make all the tests below pass to complete the project. Be sure to get creative, and have fun!

**Don't forget to connect to your database after you create it** 😄

Here's some ideas for other column and table names: <code>description, has_life, is_spherical, age_in_millions_of_years, planet_types, galaxy_types, distance_from_earth</code>.

#### Notes:

If you leave your virtual machine, your database may not be saved. You can make a dump of it by entering <code>pg_dump -cC --inserts -U freecodecamp universe > universe.sql</code> in a bash terminal (not the psql one). It will save the commands to rebuild your database in <code>universe.sql</code>. The file will be located where the command was entered. If it's anything inside the <code>project</code> folder, the file will be saved in the VM. You can rebuild the database by entering <code>psql -U postgres < universe.sql</code> in a terminal where the <code>.sql</code> file is.

If you are saving your progress on freeCodeCamp.org, after getting all the tests to pass, follow the instructions above to save a dump of your database. Save the universe.sql file in a public repository and submit the URL to it on freeCodeCamp.org.

#### Complete the tasks below

1. You should create a database named **universe**

1. Be sure to connect to your database with **\c universe**. Then, you should add tables named **galaxy**, **star**, **planet**, and **moon**

1. Each table should have a primary key

1. Each primary key should automatically increment

1. Each table should have a **name** column

1. You should use the **INT** data type for at least two columns that are not a primary or foreign key

1. You should use the **NUMERIC** data type at least once

1. You should use the **TEXT** data type at least once

1. You should use the **BOOLEAN** data type on at least two columns

1. Each "star" should have a foreign key that references one of the rows in **galaxy**

1. Each "planet" should have a foreign key that references one of the rows in **star**

1. Each "moon" should have a foreign key that references one of the rows in **planet**

1. Your database should have at least five tables

1. Each table should have at least three rows

1. The **galaxy** and **star** tables should each have at least six rows

1. The **planet** table should have at least 12 rows

1. The **moon** table should have at least 20 rows

1. Each table should have at least three columns

1. The **galaxy**, **star**, **planet**, and **moon** tables should each have at least five columns

1. At least two columns per table should not accept **NULL** values

1. At least one column from each table should be required to be **UNIQUE**

1. All columns named **name** should be of type **VARCHAR**

1. Each primary key column should follow the naming convention **table_name_id**. For example, the **moon** table should have a primary key column named **moon_id**

1. Each foreign key column should have the same name as the column it is referencing

#### Postgres Database Dump       
```sql
pg_dump -U freecodecamp -h localhost universe -f fcc-galaxy-dump.sql
```

#### Create UNIQUE key
```sql
CREATE UNIQUE INDEX CONCURRENTLY equipment_equip_id ON equipment (equip_id);
ALTER TABLE equipment ADD CONSTRAINT unique_equip_id UNIQUE USING INDEX equipment_equip_id;
CREATE UNIQUE INDEX CONCURRENTLY satellite_satellite_id ON satellite (id);
ALTER TABLE satellite ADD CONSTRAINT unique_satellite_id UNIQUE USING INDEX satellite_satellite_id;
```

#### Rename table id + drop FOREIGN KEY
```sql
ALTER TABLE satellite rename column id to satellite_id;
ALTER TABLE satellite DROP CONSTRAINT fk_planet;
ALTER TABLE moon rename column id to moon_id;
ALTER TABLE moon DROP CONSTRAINT fk_planet;
ALTER TABLE star rename column id to star_id;
ALTER TABLE star DROP CONSTRAINT fk_galaxy;
ALTER TABLE planet rename column id to planet_id;
ALTER TABLE planet DROP CONSTRAINT fk_star;
ALTER TABLE galaxy rename column id to galaxy_id;
```

### Add back CONSTRAINT FOREIGN KEY
```sql
ALTER TABLE star ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES galaxy (galaxy_id);
ALTER TABLE moon ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES planet (planet_id);
ALTER TABLE satellite ADD CONSTRAINT fk_satellite_planet FOREIGN KEY (planet_id) REFERENCES planet (planet_id);
```