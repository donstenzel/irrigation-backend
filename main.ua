# Experimental!
~ "git: https://github.com/donstenzel/hypertext.ua" ~ Server
~ "../uiqlite/lib" ~ C! PExec Q!

# U~Database!"storage.db"

~Unit {ID Name}
~Humidity {Level Timestamp Unit}

# ? humidity db
Insert ← PExec Humidity!Q!(
  INSERT INTO Humidity (Level : Timestamp)
  VALUES ($l : $t).
) ˜⊟⌊now

R ← Server!(
  °⊓"POST" "/"⊸Req!⊃Method Path
  get"Humidity" °json Req~Data
  C!˜Insert "storage.db"
  "204 No Content" [] ""
)

Err ← "500 Internal Server Error" [] ⋅""

Server!(
  Cfg ⊚4 8080
  Run‼R Err
)
