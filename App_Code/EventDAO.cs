﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// EventDAO class is the main class which interacts with the database. SQL Server express edition
/// has been used.
/// the event information is stored in a table named 'event' in the database.
///
/// Here is the table format:
/// event(id int, title varchar(100), description varchar(200),starttime datetime, endtime datetime)
/// id is the primary key
/// </summary>
public class EventDAO
{
	//change the connection string as per your database connection.
    //private static string connectionString = "Data Source=localhost;Initial Catalog=Buki;Integrated Security=True";
    private static string connectionString = ConfigurationManager.ConnectionStrings["ClubSiteDB"].ConnectionString;

	//this method retrieves all events within range start-end
    public static List<CalendarEvent> getEvents(DateTime start, DateTime end)
    {
       
        List<CalendarEvent> events = new List<CalendarEvent>();
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("SELECT id, description, title, starttime, endtime FROM events where starttime>=@start AND endtime<=@end", con);
        cmd.Parameters.AddWithValue("@start", start);
        cmd.Parameters.AddWithValue("@end", end);
        
        using (con)
        {
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                CalendarEvent cevent = new CalendarEvent();
                cevent.id = (int)reader["id"];
                cevent.title = (string)reader["title"];
                cevent.description = (string)reader["description"];
                cevent.start = (DateTime)reader["starttime"];
                cevent.end = (DateTime)reader["endtime"];
                events.Add(cevent);
            }
        }
        return events;
        //side note: if you want to show events only related to particular users,
        //if user id of that user is stored in session as Session["userid"]
        //the event table also contains a extra field named 'user_id' to mark the event for that particular user
        //then you can modify the SQL as:
        //SELECT id, description, title, starttime, endtime FROM event where user_id=@user_id AND starttime>=@start AND endtime<=@end
        //then add paramter as:cmd.Parameters.AddWithValue("@user_id", HttpContext.Current.Session["userid"]);
    }

	//this method updates the event title and description
    public static void updateEvent(int id, String title, String description)
    {
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("UPDATE events SET title=@title, description=@description WHERE id=@id", con);
        cmd.Parameters.AddWithValue("@title", title);
        cmd.Parameters.AddWithValue("@description", description);
        cmd.Parameters.AddWithValue("@id", id);
        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }


    }

	//this method updates the event start and end time
    public static void updateEventTime(int id, DateTime start, DateTime end)
    {
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("UPDATE events SET starttime=@starttime, endtime=@endtime WHERE id=@id", con);
        cmd.Parameters.AddWithValue("@starttime", start);
        cmd.Parameters.AddWithValue("@endtime", end);
        cmd.Parameters.AddWithValue("@id", id);
        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

	//this mehtod deletes event with the id passed in.
    public static void deleteEvent(int id)
    {
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("DELETE FROM events WHERE (id = @id)", con);
        cmd.Parameters.AddWithValue("@id", id);
        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

	//this method adds events to the database
    public static int addEvent(CalendarEvent cevent)
    {
        //add event to the database and return the primary key of the added event row

        //insert
        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand("INSERT INTO events(title, description, starttime, endtime) VALUES(@title, @description, @starttime, @endtime)", con);
        cmd.Parameters.AddWithValue("@title", cevent.title);
        cmd.Parameters.AddWithValue("@description", cevent.description);
        cmd.Parameters.AddWithValue("@starttime", cevent.start);
        cmd.Parameters.AddWithValue("@endtime", cevent.end);

        int key = 0;
        using (con)
        {
            con.Open();
            cmd.ExecuteNonQuery();

            //get primary key of inserted row
            cmd = new SqlCommand("SELECT max(id) FROM events where title=@title AND description=@description AND starttime=@starttime AND endtime=@endtime", con);
            cmd.Parameters.AddWithValue("@title", cevent.title);
            cmd.Parameters.AddWithValue("@description", cevent.description);
            cmd.Parameters.AddWithValue("@starttime", cevent.start);
            cmd.Parameters.AddWithValue("@endtime", cevent.end);

            key = (int)cmd.ExecuteScalar();
        }

        return key;

    }


    
}
