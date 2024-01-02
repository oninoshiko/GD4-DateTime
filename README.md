# GD4-DateTime
A GDscript for tracking and handling datetimes in a game.

This is a simple set of functions for tracking time in a game. It assumes the game uses a timekeeping similar to the real world with 60s per min, 60 min per hour, 24 hrs per day, the appropriate number of days per month (depending on the month), 12 months per year, and accounts for leap-years. All times are in 24hr format (commonly called "millitary time"). It has a precision of 1 second. At least on 64bit systems this should allow for times approximently 292 billion years before and after midnight the morning of Jan 1, 1970.

# _init()

_init() accepts an optional paramater to indicate the starting time. That can be and signed int, a String, or a Dictonary. An int will be read as unix time (seconds since midnight Jan 1, 1970). A String will be read in and interprerated as a limited [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date (specifically "YYYY-MM-DDThh:mm:ssZ" has been tested, although other variations may work). A Dictionary will be interprated with the following fields: year, month, day, hour, minute, second (any other fields will be ignored).

In the absences of a date, the date will be start at midnight the morning of Jan 1, 1970.

# get_datetime_string(space:bool = false)

get_datetime_string() returns the game-time as a string formated YYYY-MM-DDThh:mm:ss. If space is set to true, T will be replaced with a space.

# get_date_string()

get_date_string() returns the date as a string formatted YYYY-MM-DD.

# get_time_string()

get_time_string() returns the time as a string formatted hh:mm:ss.

# get_datetime_dict()

get_datetime_dict() returns a Dictionary of date-time values consisting of: year, month, day, hour, minute, second, weekday. 

# set_datetime_dict(input:Dictonary)

set_datetime_dict(input:Dictonary) sets the game-time to the date-time values in the passed in Dictonary which will be interprated with the following fields: year, month, day, hour, minute, second (any other fields will be ignored).

# set_datetime_string(input:String)

set_datetime_dict(input:String) sets the game-time to the date-time values passed in a String interprated as a limited [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date (specifically "YYYY-MM-DDThh:mm:ssZ" has been tested, although other variations may work)

# inc(s:int = 1)

inc(s) advances game-time by s seconds. If s is not present, it advances time 1s.

A timer can be used to call this for steadily flowing time, or it can be called on player-action for games that only advance when the player performs an action.