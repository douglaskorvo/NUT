#!/bin/sh
# the next line restarts using tclsh \
exec tclsh "$0" "$@"

# NUT nutrition software
# Copyright (C) 1996-2017 by Jim Jozwiak.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

package require sqlite3

sqlite3 db nut.sqlite

db eval {create table if not exists tcl_code(name text primary key, code text)}
db eval {create table if not exists version(version text primary key unique, update_cd text)}

###
source src/source.tcl
###

package require Tk

wm geometry . 1x1
set appSize 0.0
set ::magnify [expr {[winfo vrootheight .] / 711.0}]
if {[string is double -strict $appSize] && $appSize > 0.0} {
 set ::magnify [expr {$::magnify * $appSize}]
 }
if {$appSize == 0.0} {set ::magnify 1.0}
foreach font [font names] {
 font configure $font -size [expr {int($::magnify * [font configure $font -size]
)}]
 }
set i [font measure TkDefaultFont -displayof . "  TransMonoenoic  "]
set ::column18 [expr {int(round($i / 3.0))}]
set ::column15 [expr {int(round(2.0 * $i / 5.0))}]
option add *Dialog.msg.wrapLength [expr {400 * $::magnify}]
option add *Dialog.dtl.wrapLength [expr {400 * $::magnify}]

db eval {select max(version) as "::version" from version} { }

tk_messageBox -type ok -title "updateNUT.tcl Completion" -message "There\'s a signpost up ahead.\n\nNext stop:  ${::version}"
exit 0
