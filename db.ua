# Experimental!
~ "../uiqlite/lib" ~ C! Exec Q!

C!(
  Exec Q!(
    CREATE TABLE "Unit" (
      "ID" INTEGER PRIMARY KEY :
      "Name" NVARCHAR(50)
    ).
  
    CREATE TABLE "Humidity" (
      "Level" INTEGER NOT NULL :
      "Timestamp" INTEGER NOT NULL :
      "Unit" INTEGER :
      FOREIGN KEY("Unit") REFERENCES "Unit"("ID")
    ).
  )
) "storage.db"
