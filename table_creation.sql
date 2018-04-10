/* users table creation */
CREATE TABLE USERS 
(
  USERNAME VARCHAR2(50 CHAR) NOT NULL 
, FIRST_NAME VARCHAR2(50 CHAR) 
, LAST_NAME VARCHAR2(50 CHAR) 
, CONSTRAINT USERS_PK PRIMARY KEY 
  (
    USERNAME 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);


/* artists table creation */

CREATE TABLE ARTISTS 
(
  NAME VARCHAR2(50 CHAR) NOT NULL 
, NATIONALITY VARCHAR2(2 BYTE) 
, GENRE VARCHAR2(50 CHAR) 
, CONSTRAINT ARTISTS_PK PRIMARY KEY 
  (
    NAME 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
);

/* albums table creation */

CREATE TABLE ALBUMS 
(
  NAME VARCHAR2(50 CHAR) NOT NULL 
, ARTIST VARCHAR2(50 CHAR) 
, RELEASE_YEAR NUMBER 
, COVER ORDSYS.ORDIMAGE 
, CONSTRAINT ALBUMS_PK PRIMARY KEY 
  (
    NAME 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
);


/* songs table creation */

CREATE TABLE SONGS 
(
  TITLE VARCHAR2(50 BYTE) NOT NULL 
, ARTIST VARCHAR2(50 CHAR) NOT NULL 
, ALBUM VARCHAR2(50 CHAR) NOT NULL 
, TRACKFILE ORDSYS.ORDAUDIO 
, ID NUMBER 
, CONSTRAINT SONGS_TABLE_PK PRIMARY KEY 
  (
    TITLE 
  , ARTIST 
  , ALBUM 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
);

ALTER TABLE SONGS
ADD CONSTRAINT SONGS_TABLE_UK1 UNIQUE 
(
  ID 
)
ENABLE;


/* favs table creation */

CREATE TABLE FAVS 
(
  USERNAME VARCHAR2(50 CHAR) NOT NULL 
, SONG_ID NUMBER NOT NULL 
, PLAYLIST VARCHAR2(50 CHAR) NOT NULL 
, CONSTRAINT FAVS_PK PRIMARY KEY 
  (
    USERNAME 
  , SONG_ID 
  , PLAYLIST 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
);
