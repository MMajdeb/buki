CREATE TABLE [Albums] (
	[albumid] [int] IDENTITY (1, 1) NOT NULL ,
	[title] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[parentid] [int] NOT NULL ,
	[private] [bit] NULL ,
	[description] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ownerid] [uniqueidentifier] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [Announcements] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[itemdate] [datetime] NOT NULL ,
	[title] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[description] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[staticURL] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[photo] [int] NOT NULL ,
	[albumid] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [Events] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[starttime] [datetime] NOT NULL ,
	[endtime] [datetime] NULL ,
	[title] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[description] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[staticURL] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[location] [int] NULL ,
	[photo] [int] NOT NULL ,
	[album] [int] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [Locations] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[title] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[description] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[linkURL] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[photo] [int] NOT NULL ,
	[directions] [varchar] (800) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[address] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [MemberInfo] (
	[address] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[phone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[firstname] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lastname] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[avatar] [image] NULL ,
	[memberid] [uniqueidentifier] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [images] (
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[title] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[largeimage] [image] NOT NULL ,
	[thumbimage] [image] NULL ,
	[origimage] [image] NULL ,
	[album] [int] NOT NULL ,
	[notes] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [Albums] ADD 
	CONSTRAINT [PK_Albums] PRIMARY KEY  CLUSTERED 
	(
		[albumid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [MemberInfo] ADD 
	CONSTRAINT [PK_MemberInfo] PRIMARY KEY  CLUSTERED 
	(
		[memberid]
	)  ON [PRIMARY] 
GO


SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE PROCEDURE AlbumList
(
	@userid UNIQUEIDENTIFIER
)
AS

SELECT     Albums.albumid, Albums.title, Albums.private, MIN(images.id) AS DisplayImage, COUNT(images.id) AS ImageCount, Albums.description
FROM         Albums LEFT OUTER JOIN
                      images ON Albums.albumid = images.album
WHERE     (Albums.private = 0) OR
                     (Albums.ownerid = @userid)
GROUP BY Albums.albumid, Albums.title, Albums.private, Albums.description

RETURN
GO

CREATE PROCEDURE MemberCountByLetter
AS
	DECLARE @letter char(1), @index int, @max int
	CREATE TABLE #results ( letter CHAR(1), num INT)
	SET @index=ASCII('A')
	SET @max=ASCII('Z')

	WHILE @index <= @max
	BEGIN
		SET @letter = CHAR(@index)
		INSERT INTO #results Select letter=@letter, num=count(*) from MemberInfo where SUBSTRING(lastname,1,1)=@letter  
		SET @index = @index + 1
	END
	Select * FROM #results
RETURN
GO

CREATE PROCEDURE NextAnnouncement 
(
	@id int
)
AS
	/* SET NOCOUNT ON */ 
	
	DECLARE @curr datetime
	
	SELECT @curr = itemdate
	FROM Announcements
	WHERE (id = @id)


SELECT	  top 1 nextid= id
	FROM	Announcements
	WHERE	(itemdate > @curr OR
			(itemdate = @curr) AND (id > @id)) order by itemdate asc, id  asc
GO

CREATE PROCEDURE NextPrevAnnouncement 
(
	@id int,
	@previd int output,
	@nextid int output
)
AS
	/* SET NOCOUNT ON */ 
	
	DECLARE @curr datetime
	
	SELECT @curr = itemdate
	FROM Announcements
	WHERE (id = @id)

	SELECT	@previd=  id
	FROM	Announcements
	WHERE	(itemdate < @curr OR
			(itemdate = @curr) AND (id < @id)) order by itemdate asc, id asc


SELECT	 @nextid= id
	FROM	Announcements
	WHERE	(itemdate > @curr OR
			(itemdate = @curr) AND (id > @id)) order by itemdate desc, id  desc
GO

CREATE PROCEDURE NextPrevEvent 
(
	@id int,
	@previd int output,
	@nextid int output
)
AS
	/* SET NOCOUNT ON */ 
	
	DECLARE @curr datetime
	
	SELECT @curr = starttime
	FROM Events AS Events_1
	WHERE (id = @id)

	SELECT	@previd=  id
	FROM	Events
	WHERE	(starttime < @curr OR
			(starttime = @curr) AND (id < @id)) order by starttime asc, id asc


SELECT	 @nextid= id
	FROM	Events
	WHERE	(starttime > @curr OR
			(starttime = @curr) AND (id > @id)) order by starttime desc, id  desc
GO

CREATE PROCEDURE NextPrevLocation
(
	@id int,
	@previd int output,
	@nextid int output
)
AS
	/* SET NOCOUNT ON */ 
	

	SELECT	@previd=  max(id)
	FROM	locations
	WHERE	id < @id


SELECT	@nextid=  min(id)
	FROM	locations
	WHERE	id > @id

GO

CREATE PROCEDURE PagedAlbumList
(
	@ownerID UNIQUEIDENTIFIER,
	@pageNum INT = 1,
	@pageSize INT = 10
)
	
AS
	DECLARE @rows INT
	DECLARE @keyid INT
	DECLARE @rowCount FLOAT /* yes we need a float for the math */
	
	IF @pageNum = 1
		BEGIN
			SET @keyid=0
		END
	ELSE
		BEGIN
			/* get the values for the date and row */
			SELECT @rows = (@pageNum-1) * @pageSize
			SET ROWCOUNT  @rows
			SELECT @keyid=albumid FROM albums 
				WHERE(Albums.private = 0) OR (Albums.private = 1) AND (Albums.ownerid = @ownerid)
				ORDER BY albumid ASC  
		END

SELECT @rowCount=COUNT(*) FROM albums WHERE (Albums.private = 0) OR (Albums.private = 1) AND (Albums.ownerid = @ownerid) 

SET  ROWCOUNT @pageSize
	SELECT Albums.albumid, Albums.title, Albums.private, MIN(images.id) AS DisplayImage, count(images.id) as ImageCount 
	FROM Albums LEFT OUTER JOIN images ON Albums.albumid = images.album 
	WHERE ((Albums.private = 0) OR (Albums.private = 1) AND (Albums.ownerid = @ownerid))
	  AND (albums.albumid > @keyid)
	GROUP BY  albumid, albums.title, albums.private  
	RETURN CEILING(@rowCount/@pageSize)


GO

CREATE PROCEDURE PagedAnnouncementList 
(
	@pageNum INT = 1,
	@pageSize INT = 10
)
	
AS
	DECLARE @rows INT
	DECLARE @keydate DATETIME
	DECLARE @keyid INT
	DECLARE @rowCount FLOAT /* yes we need a float for the math */
	
	IF @pageNum = 1
		BEGIN
			SET @keydate= 0
			SET @keyid=0
		END
	ELSE
		BEGIN
			/* get the values for the date and row */
			SELECT @rows = (@pageNum-1) * @pageSize
			SET ROWCOUNT  @rows
			SELECT @keydate=itemdate, @keyid=id FROM announcements ORDER BY itemdate ASC, id ASC  
		END

SELECT @rowCount=COUNT(*) FROM announcements

SET  ROWCOUNT @pageSize
	SELECT id, itemdate, title, description, photo FROM Announcements 
	WHERE (itemdate > @keydate OR
			(itemdate = @keydate) AND (id > @keyid))
	ORDER BY itemdate ASC, id ASC 
	RETURN CEILING(@rowCount/@pageSize)


GO

CREATE PROCEDURE PagedLocationsList
(
	@pageNum INT = 1,
	@pageSize INT = 10
)
	
AS
	DECLARE @rows INT
	DECLARE @keyid INT
	DECLARE @rowCount FLOAT /* yes we need a float for the math */
	
	IF @pageNum = 1
		BEGIN
			SET @keyid=0
		END
	ELSE
		BEGIN
			/* get the values for the date and row */
			SELECT @rows = (@pageNum-1) * @pageSize
			SET ROWCOUNT  @rows
			SELECT @keyid=id FROM locations ORDER BY id ASC  
		END

SELECT @rowCount=COUNT(*) FROM locations

SET  ROWCOUNT @pageSize
	SELECT id, title, description, linkURL, address, photo, directions
		FROM Locations
		WHERE id > @keyid
	ORDER BY id ASC 
RETURN CEILING(@rowCount/@pageSize)
GO

CREATE PROCEDURE PagedRecentEventList
(
	@pageNum int = 1,
	@pageSize int = 10
)
	
AS
	declare @rows int
	declare @keydate datetime
	declare @keyid int
	declare @rowCount float /* yes we need a float for the math */
	
	if @pageNum = 1
		begin
			set @keydate= GETDATE()
			set @keyid=0
		end
	else
		BEGIN
			/* get the values for the date and row */
			select @rows = (@pageNum-1) * @pageSize
			SET ROWCOUNT  @rows
			select @keydate=starttime, @keyid=id from Events
				WHERE starttime < GETDATE()
				ORDER BY starttime desc, id desc  
		END

select @rowCount=count(*) from Events WHERE starttime < GETDATE()

SET  ROWCOUNT @pageSize
	SELECT Events.id, Events.starttime, Events.title, Events.description, Events.photo, 
		Locations.title AS locationname 
	FROM Events LEFT OUTER JOIN Locations ON Events.location = Locations.id 
	WHERE (Events.starttime < @keydate OR
			(Events.starttime = @keydate) AND (events.id < @keyid))
	ORDER BY Events.starttime desc, Events.id desc 
RETURN CEILING(@rowCount/@pageSize)
GO

CREATE PROCEDURE PagedUpcommingEventList
(
	@pageNum int = 1,
	@pageSize int = 10
)
	
AS
	declare @rows int
	declare @keydate datetime
	declare @keyid int
	declare @rowCount float /* yes we need a float for the math */
	
	if @pageNum = 1
		begin
			set @keydate= GETDATE()
			set @keyid=0
		end
	else
		BEGIN
			/* get the values for the date and row */
			select @rows = (@pageNum-1) * @pageSize
			SET ROWCOUNT  @rows
			select @keydate=starttime, @keyid=id from Events
				WHERE Events.starttime > GetDATE()
				ORDER BY starttime asc, id asc  
		END

select @rowCount=count(*) from Events WHERE Events.starttime > GetDATE()

SET  ROWCOUNT @pageSize
	SELECT Events.id, Events.starttime, Events.title, Events.description, Events.photo, 
		Locations.title AS locationname 
	FROM Events LEFT OUTER JOIN Locations ON Events.location = Locations.id 
	WHERE (Events.starttime > @keydate OR
			(Events.starttime = @keydate) AND (events.id > @keyid))
	ORDER BY Events.starttime asc, Events.id asc 
RETURN CEILING(@rowCount/@pageSize)
GO

CREATE PROCEDURE PrevAnnouncement
(
		@id int
)
AS
	/* SET NOCOUNT ON */ 
	
	DECLARE @curr datetime
	
	SELECT @curr = itemdate
	FROM Announcements
	WHERE (id = @id)

	SELECT	 top 1 previd=id
	FROM	Announcements
	WHERE	(itemdate < @curr OR
			(itemdate = @curr) AND (id < @id)) order by itemdate desc, id desc
GO


SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

