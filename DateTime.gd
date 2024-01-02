#
#Copyright 2024 A. Hettinger (oninoshiko@gmail.com)
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of 
#this software and associated documentation files (the “Software”), to deal in 
#the Software without restriction, including without limitation the rights to 
#use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
#of the Software, and to permit persons to whom the Software is furnished to do 
#so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all 
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
extends Node

var s: int

# No datetime should set the time to midnight, the morning of Jan 1, 1970
func _init(input = 0) -> void:
	match typeof(input):
		TYPE_INT:
			s=input
		TYPE_STRING:
			s=Time.get_unix_time_from_datetime_string(input)
		TYPE_DICTIONARY:
			s=Time.get_unix_time_from_datetime_dict(input)

func get_datetime_string(space:bool = false) -> String:
	return Time.get_datetime_string_from_unix_time(s, space)

func get_date_string() -> String:
	return Time.get_date_string_from_unix_time(s)

func get_time_string() -> String:
	return Time.get_time_string_from_unix_time(s)
	
func get_datetime_dict() -> Dictionary:
	return Time.get_datetime_dict_from_unix_time(s)
	
func set_datetime_dict(input:Dictionary) -> void:
	s=Time.get_unix_time_from_datetime_dict(input)
	
func set_datetime_string(input:String) -> void:
	s=Time.get_unix_time_from_datetime_string(input)

func inc(sec:int = 1) -> void:
	s=s+sec
