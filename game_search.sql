BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "list" (
	"id"	INTEGER NOT NULL,
	"user_id"	INTEGER NOT NULL,
	"game_id"	INTEGER NOT NULL,
	FOREIGN KEY("game_id") REFERENCES "game"("id"),
	FOREIGN KEY("user_id") REFERENCES "user"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "favorites" (
	"id"	INTEGER NOT NULL,
	"game_id"	INTEGER NOT NULL,
	"user_id"	INTEGER NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "user"("id"),
	FOREIGN KEY("game_id") REFERENCES "games"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "games" (
	"id"	INTEGER NOT NULL,
	"name"	VARCHAR,
	"description"	TEXT,
	"release_date"	VARCHAR,
	"platform"	VARCHAR,
	"genre"	VARCHAR,
	"requeriments_id"	INT NOT NULL,
	"rating_id"	INTEGER NOT NULL,
	FOREIGN KEY("rating_id") REFERENCES "rating"("id"),
	FOREIGN KEY("requeriments_id") REFERENCES "requeriments"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "rating" (
	"id"	INTEGER NOT NULL,
	"score"	REAL,
	"comments"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "requeriments" (
	"id"	INTEGER NOT NULL,
	"requeriments_pc"	TEXT,
	"requeriments_console"	TEXT,
	"requeriments_movil"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "user" (
	"id"	INTEGER NOT NULL,
	"username"	VARCHAR,
	"age"	INTEGER,
	"country"	VARCHAR,
	"lenguage"	VARCHAR,
	"email"	VARCHAR,
	"password"	VARCHAR,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "logs" (
	"id"	INTEGER NOT NULL,
	"username"	TEXT NOT NULL,
	"password"	TEXT NOT NULL,
	"user_id"	INTEGER NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "user_login"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "user_login" (
	"id"	INTEGER NOT NULL,
	"username"	TEXT NOT NULL,
	"password"	TEXT NOT NULL,
	"name"	TEXT,
	"public_id"	TEXT,
	"email"	TEXT,
	PRIMARY KEY("id")
);
INSERT INTO "user_login" VALUES (1,'user1','password1',NULL,NULL,NULL);
INSERT INTO "user_login" VALUES (2,'user2','pbkdf2:sha256:260000$nri18rkVHYTL0Pvt$26191c746ffe2f7a9ae8c088c9016d4b93be8ad830ec4b82de1ed8eba20bdeff','asdasd','52bea785-622a-4ebb-8c7d-59821dc219e0','alberto@hotmail.com');
INSERT INTO "user_login" VALUES (3,'user3','pbkdf2:sha256:260000$kL8wsOYncXVjQp7r$3258935899efef898f1d04d503f719c5bcc10eecd753e0c9f73daa7cb88507ea','pepito','fc2d93a2-8c73-453b-8ec4-ee762cd3729d','albertano@hotmail.com');
COMMIT;
