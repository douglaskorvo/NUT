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

set Main {

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
package require BWidget

if {$appSize != 0.0} {
 set ::ALTGUI 1
 db eval {select code from tcl_code where name = 'Main_alt'} { }
 eval $code
 return
 } else {
 set ::ALTGUI 0
 }

package require Tk

set DiskDB [file nativename $DiskDB]

db eval {select max(version) as "::version" from version} { }
set ::scrollwidth 8
set ::magnify [expr {[winfo vrootheight .] / 711.0}]
if {[string is double -strict $appSize] && $appSize > 0.0} {
 set ::magnify [expr {$::magnify * $appSize}]
 }
if {$appSize == 0.0} {set ::magnify 1.0}
foreach font [font names] {
 font configure $font -size [expr {int($::magnify * [font configure $font -size])}]
 }
set i [font measure TkDefaultFont -displayof . "  TransMonoenoic  "]
set ::column18 [expr {int(round($i / 3.0))}]
set ::column15 [expr {int(round(2.0 * $i / 5.0))}]
option add *Dialog.msg.wrapLength [expr {400 * $::magnify}]
option add *Dialog.dtl.wrapLength [expr {400 * $::magnify}]

wm title . $::version
catch {set im [image create photo -file nuticon.gif]}
catch {wm iconphoto . -default $im}
bind . <Destroy> {
 rename unknown ""
 rename _original_unknown unknown
 db close
 exit 0
 }

db eval {select code from tcl_code where name = 'get_procs_from_db'} {
 eval $code
 }
get_procs_from_db

trace add variable ::FIRSTMEALam write SetMealRange_am
trace add variable ::LASTMEALam write SetMealRange_am
ttk::style configure nutbutton.TButton
ttk::style configure recipe.TButton
ttk::style configure meal.TButton
ttk::style configure lightmeal.TButton
ttk::style configure meal.TRadiobutton
ttk::style configure ar.TRadiobutton
ttk::style configure po.TButton
ttk::style configure po.red.TButton
ttk::style configure po.TCheckbutton
ttk::style map po.TCheckbutton
ttk::style map po.TButton
ttk::style map po.red.TButton
ttk::style map po.TCheckbutton
ttk::style configure ts.TCheckbutton
ttk::style map ts.TCheckbutton
ttk::style map ts.TCheckbutton
ttk::style map ts.TCheckbutton
ttk::style map meal.TRadiobutton
ttk::style map ar.TRadiobutton
ttk::style configure vf.TButton
ttk::style configure am.TFrame
ttk::style configure rm.TFrame
ttk::style configure vf.TFrame
ttk::style configure po.TFrame
ttk::style configure ts.TFrame
ttk::style configure ar.TFrame
ttk::style configure am.TLabel
ttk::style configure rm.TLabel
ttk::style configure ar.TLabel
ttk::style configure vf.TLabel
ttk::style configure po.TLabel
ttk::style configure po.TMenubutton
ttk::style map po.TMenubutton
ttk::style configure am.TNotebook
ttk::style configure rm.TNotebook
ttk::style configure vf.TNotebook
ttk::style configure ar.TNotebook
ttk::style configure rm.TCombobox
ttk::style configure nut.TCombobox
ttk::style configure vf.TCombobox
ttk::style configure ts.TCombobox
ttk::style map po.TCombobox
ttk::style map rm.TCombobox
ttk::style map nut.TCombobox
ttk::style map ts.TCombobox
ttk::style map rm.TCombobox
ttk::style map nut.TCombobox
ttk::style map ts.TCombobox
ttk::style map rm.TCombobox
ttk::style map nut.TCombobox
ttk::style map ts.TCombobox
ttk::style map vf.TCombobox
ttk::style configure vf.TSpinbox
ttk::style configure am.TSpinbox
ttk::style configure rm.TSpinbox
ttk::style configure lf.Horizontal.TProgressbar
ttk::style configure meal.Horizontal.TProgressbar
ttk::style configure meal.TMenubutton
ttk::style configure ar.TButton
if {$::magnify > 0.0} {ttk::style configure nut.Treeview -font TkFixedFont -rowheight [expr {int(round($::magnify * 15.0))}]} else {ttk::style configure nut.Treeview -font TkFixedFont}

grid [ttk::notebook .nut]
ttk::frame .nut.am -padding [expr {$::magnify * 2}] -style "am.TFrame"
ttk::frame .nut.rm -padding [expr {$::magnify * 2}] -style "rm.TFrame"
ttk::frame .nut.ar -padding [expr {$::magnify * 2}] -style "ar.TFrame"
ttk::frame .nut.vf -padding [expr {$::magnify * 2}] -style "vf.TFrame"
ttk::frame .nut.po -padding [expr {$::magnify * 2}] -style "po.TFrame"
ttk::frame .nut.ts -padding [expr {$::magnify * 2}] -style "ts.TFrame"
ttk::frame .nut.qn -padding [expr {$::magnify * 2}]
grid [ttk::label .nut.am.herelabel -text "Here are \"Daily Value\" average percentages for your previous " -style am.TLabel] -row 2 -column 1 -columnspan 9 -sticky e
grid [tk::spinbox .nut.am.mealsb -width 5 -justify right -from 1 -to 999999 -increment 1 -textvariable ::meals_to_analyze_am -buttonbackground "#00FFFF"] -row 2 -column 10 -columnspan 2 -sticky we
grid [ttk::label .nut.am.meallabel -text " meals:" -style am.TLabel] -row 2 -column 12 -columnspan 2 -sticky w
grid [ttk::label .nut.am.rangelabel -textvariable mealrange -style am.TLabel] -row 3 -column 0 -columnspan 15

set ::SetDefanalPreviousValue 0
set ::LastSetDefanal 0

set ::MealfoodSequence 0
set ::MealfoodStatus {}
set ::MealfoodPCF {}
set ::MealfoodPCFfactor {}

set ::lastrmq 0
set ::lastamrm 0
set ::lastac 0
set ::lastbubble 0
set ::BubbleMachineStatus 0

set ::realmealchange 0
grid [scale .nut.rm.scale -background "#FF9428" -width [expr {$::magnify * 11}] -sliderlength [expr {$::magnify * 20}] -length [expr {10 + ($::column15 * 4)}] -showvalue 0 -orient horizontal -variable ::mealoffset -from -100 -to 100 -command mealchange] -row 0 -rowspan 2 -column 0 -columnspan 4 -sticky w

grid [ttk::menubutton .nut.rm.theusual -style meal.TMenubutton -text "Customary Meals" -direction right -menu .nut.rm.theusual.m] -row 2 -column 0 -columnspan 4 -sticky nsw
grid [ttk::button .nut.rm.recipebutton -style ar.TButton -width 16 -text "Save as a Recipe" -state disabled -command RecipeSaveAs] -row 3 -rowspan 2 -column 0 -columnspan 2 -pady [expr {$::magnify * 5.0}] -sticky w
menu .nut.rm.theusual.m -background "#FF9428" -tearoff 0 -postcommand theusualPopulateMenu
.nut.rm.theusual.m add cascade -label "Add Customary Meal to this meal" -menu .nut.rm.theusual.m.add -background "#FF9428"
.nut.rm.theusual.m add cascade -label "Save this meal as a Customary Meal" -menu .nut.rm.theusual.m.save -background "#FF9428"
.nut.rm.theusual.m add cascade -label "Delete a Customary Meal" -menu .nut.rm.theusual.m.delete -background "#FF9428"
menu .nut.rm.theusual.m.add -tearoff 0
menu .nut.rm.theusual.m.save -tearoff 0
menu .nut.rm.theusual.m.delete -tearoff 0

grid [ttk::label .nut.rm.newtheusuallabel -style rm.TLabel -text "Type new Customary Meal name and press Save" -wraplength [expr {4 * $::column15}]] -row 0 -rowspan 2 -column 5 -columnspan 4 -sticky ws
grid [ttk::entry .nut.rm.newtheusualentry -textvariable ::newtheusual] -row 2 -rowspan 2 -column 5 -columnspan 4 -sticky w
grid [ttk::button .nut.rm.newtheusualbutton -text "Save" -command theusualNewName -width 5] -row 2 -rowspan 2 -column 9 -columnspan 2 -sticky w
set ::newtheusual ""
grid remove .nut.rm.newtheusuallabel
grid remove .nut.rm.newtheusualentry
grid remove .nut.rm.newtheusualbutton

grid [ttk::radiobutton .nut.rm.grams -text "Grams" -width 6 -variable ::GRAMSopt -value 1 -style meal.TRadiobutton] -row 0 -column 13 -columnspan 3 -sticky nsw
grid [ttk::radiobutton .nut.rm.ounces -text "Ounces" -width 6 -variable ::GRAMSopt -value 0 -style meal.TRadiobutton] -row 1 -column 13 -columnspan 3 -sticky nsw
grid [ttk::button .nut.rm.analysismeal -text "Analysis" -command SwitchToAnalysis -style lightmeal.TButton] -row 3 -rowspan 2 -column 13 -columnspan 3 -sticky nw
grid remove .nut.rm.grams
grid remove .nut.rm.ounces
grid remove .nut.rm.analysismeal
grid [menubutton .nut.rm.setmpd -background "#FF9428" -text "Delete All Meals and Set Meals Per Day" -relief raised -menu .nut.rm.setmpd.m] -row 0 -column 8 -columnspan 8 -sticky e
grid [ttk::label .nut.rm.fslabel -text "Food Search" -style rm.TLabel] -row 4 -column 4 -columnspan 2 -sticky e
grid [ttk::combobox .nut.rm.fsentry -textvariable ::like_this_rm -style rm.TCombobox] -padx [expr {$::magnify * 5}] -row 4 -column 6 -columnspan 7 -sticky we
grid [ttk::progressbar .nut.rm.bubblemachine -style meal.Horizontal.TProgressbar -orient horizontal -mode indeterminate] -row 4 -column 6 -columnspan 7 -sticky nswe
grid remove .nut.rm.bubblemachine

grid [ttk::button .nut.rm.searchcancel -text "Cancel" -width 6 -command CancelSearch -style vf.TButton] -row 3 -rowspan 2 -column 13 -columnspan 3 -sticky sw
grid remove .nut.rm.searchcancel
grid [ttk::frame .nut.rm.frlistbox -style rm.TFrame -width [expr {15 * $::column15}] ] -row 5 -rowspan 16 -column 0 -columnspan 15 -sticky nswe
grid [tk::listbox .nut.rm.frlistbox.listbox -listvariable foodsrm -yscrollcommand ".nut.rm.frlistbox.scrollv set" -xscrollcommand ".nut.rm.frlistbox.scrollh set" -height 22 -width 85 -background "#FF7F00" -setgrid 1] -row 0 -column 0 -sticky nsew
grid [scrollbar .nut.rm.frlistbox.scrollv -width [expr {$::magnify * $::scrollwidth}] -relief sunken -orient vertical -command ".nut.rm.frlistbox.listbox yview"] -row 0 -column 1 -sticky nsew
grid [scrollbar .nut.rm.frlistbox.scrollh -width [expr {$::magnify * $::scrollwidth}] -relief sunken -orient horizontal -command ".nut.rm.frlistbox.listbox xview"] -row 1 -column 0 -sticky nswe
grid rowconfig .nut.rm.frlistbox 0 -weight 1 -minsize 0
grid columnconfig .nut.rm.frlistbox 0 -weight 1 -minsize 0
grid propagate .nut.rm.frlistbox 0

bind .nut.rm.frlistbox.listbox <<ListboxSelect>> FoodChoicerm
trace add variable ::like_this_rm write FindFoodrm
bind .nut.rm.fsentry <FocusIn> FoodSearchrm
grid remove .nut.rm.frlistbox
grid [ttk::label .nut.vf.label -textvariable Long_Desc -style vf.TLabel -wraplength [expr {$::magnify * 250}]] -row 0 -column 3 -columnspan 9 -rowspan 3

set gramsvf 0
set ouncesvf 0
set caloriesvf 0
set Amountvf 0

grid [tk::spinbox .nut.vf.sb0 -width 5 -justify right -from -9999 -to 9999 -increment 1 -textvariable gramsvf -buttonbackground "#00FF00"] -row 0 -column 0 -columnspan 2 -sticky e
grid [tk::spinbox .nut.vf.sb1 -width 5 -justify right -from -999 -to 999 -increment 0.1 -textvariable ouncesvf -buttonbackground "#00FF00"] -row 1 -column 0 -columnspan 2 -sticky e
grid [tk::spinbox .nut.vf.sb2 -width 5 -justify right -from -9999 -to 9999 -increment 1 -textvariable caloriesvf -buttonbackground "#00FF00"] -row 2 -column 0 -columnspan 2 -sticky e
grid [tk::spinbox .nut.vf.sb3 -width 5 -justify right -from -999 -to 999 -increment 0.1 -textvariable Amountvf -buttonbackground "#00FF00"] -row 3 -column 0 -columnspan 2 -sticky e
grid [ttk::label .nut.vf.sbl0 -text "gm." -style vf.TLabel] -row 0 -column 2 -columnspan 2 -padx [expr {$::magnify * 5}] -sticky w
grid [ttk::label .nut.vf.sbl1 -text "oz." -style vf.TLabel] -row 1 -column 2 -columnspan 2 -padx [expr {$::magnify * 5}] -sticky w
grid [ttk::label .nut.vf.sbl2 -text "cal." -style vf.TLabel] -row 2 -column 2 -columnspan 2 -padx [expr {$::magnify * 5}] -sticky w
grid [menubutton .nut.vf.refusemb -background "#00FF00" -text "Refuse"  -direction below -relief raised -menu .nut.vf.refusemb.m ] -row 4 -column 0 -columnspan 2 -sticky e
menu .nut.vf.refusemb.m -tearoff 0 -background "#00FF00"
.nut.vf.refusemb.m add command -label "No refuse description provided"
grid [ttk::label .nut.vf.refusevalue -textvariable Refusevf -style vf.TLabel] -row 4 -column 2 -padx [expr {$::magnify * 5}] -columnspan 2 -sticky w
grid [ttk::button .nut.vf.meal -text "Add to Meal" -state disabled -command vf2rm -style meal.TButton] -row 1 -rowspan 2 -column 12 -columnspan 3 -sticky nw
grid [ttk::label .nut.vf.fslabel -text "Food Search" -style vf.TLabel] -row 4 -column 4 -columnspan 2 -sticky e
grid [ttk::combobox .nut.vf.cb -textvariable Msre_Descvf -state readonly -style vf.TCombobox] -padx [expr {$::magnify * 5}] -row 3 -column 2 -columnspan 11 -sticky we
grid [ttk::combobox .nut.vf.fsentry -textvariable like_this_vf -style vf.TCombobox] -padx [expr {$::magnify * 5}] -row 4 -column 6 -columnspan 7 -sticky we

grid [ttk::label .nut.ar.name -text "Recipe Name" -style ar.TLabel] -row 0 -column 0 -columnspan 2 -sticky e
grid [ttk::entry .nut.ar.name_entry -textvariable ::RecipeName ] -row 0 -column 2 -columnspan 11 -padx [expr {$::magnify * 5}] -sticky we

grid [ttk::label .nut.ar.numserv -text "Number of servings recipe makes" -style ar.TLabel] -row 1 -column 0 -columnspan 2 -sticky e
grid [ttk::entry .nut.ar.numserv_entry -textvariable ::RecipeServNum -width 7] -row 1 -column 2 -columnspan 2 -padx [expr {$::magnify * 5}] -sticky w

grid [ttk::label .nut.ar.servunit -text "Serving Unit (cup, piece, tbsp, etc.)" -style ar.TLabel] -row 2 -column 0 -columnspan 2 -sticky e
grid [ttk::entry .nut.ar.servunit_entry -textvariable ::RecipeServUnit] -row 2 -column 2 -columnspan 2 -padx [expr {$::magnify * 5}] -sticky w

grid [ttk::label .nut.ar.servnum -text "Number of units in one serving" -style ar.TLabel] -row 3 -column 0 -columnspan 2 -sticky e
grid [ttk::entry .nut.ar.servnum_entry -textvariable ::RecipeServUnitNum -width 7] -row 3 -column 2 -columnspan 2 -padx [expr {$::magnify * 5}] -sticky w

grid [ttk::label .nut.ar.weight -text "Weight of one serving (if known)" -style ar.TLabel] -row 4 -column 0 -columnspan 2 -sticky e
grid [ttk::entry .nut.ar.weight_entry -textvariable ::RecipeServWeight -width 7] -row 4 -column 2 -columnspan 2 -padx [expr {$::magnify * 5}] -sticky w

grid [ttk::button .nut.ar.save -text "Save" -command RecipeDone -style vf.TButton] -row 3 -column 13 -columnspan 3 -sticky e
grid [ttk::button .nut.ar.cancel -text "Cancel" -command RecipeCancel -style ar.TButton] -row 4 -column 13 -columnspan 3 -sticky e

grid [ttk::radiobutton .nut.ar.grams -text "Grams" -width 6 -variable ::GRAMSopt -value 1 -style ar.TRadiobutton] -row 0 -column 13 -columnspan 3 -sticky nsw
grid [ttk::radiobutton .nut.ar.ounces -text "Ounces" -width 6 -variable ::GRAMSopt -value 0 -style ar.TRadiobutton] -row 1 -column 13 -columnspan 3 -sticky nsw

panedwindow .nut.po.pane -orient horizontal -showhandle 0 -handlesize [expr {round($::magnify * 10.0)}] -background "#5454FF" -relief solid
ttk::frame .nut.po.pane.optframe -style po.TFrame
ttk::frame .nut.po.pane.wlogframe -style po.TFrame
.nut.po.pane add .nut.po.pane.optframe .nut.po.pane.wlogframe
grid .nut.po.pane -in .nut.po -sticky nsew -row 0 -column 0

grid rowconfigure .nut.po.pane.wlogframe all -uniform 1
grid columnconfigure .nut.po.pane.wlogframe all -uniform 1

grid [ttk::label .nut.po.pane.wlogframe.weight_l -text "Weight" -style "po.TLabel" -justify right] -row 0 -column 1 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky e
grid [tk::spinbox .nut.po.pane.wlogframe.weight_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::weightyintercept -disabledforeground "#000000" ] -row 0 -column 2 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}]
grid [ttk::label .nut.po.pane.wlogframe.bf_l -text "Body Fat %" -style "po.TLabel" -justify right] -row 1 -column 1 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky e
grid [tk::spinbox .nut.po.pane.wlogframe.bf_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::currentbfp -disabledforeground "#000000" ] -row 1 -column 2 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}]
grid [ttk::button .nut.po.pane.wlogframe.accept -text "Accept New\nMeasurements" -command AcceptNewMeasurements] -row 2 -rowspan 2 -column 0 -columnspan 3 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky e
grid [ttk::button .nut.po.pane.wlogframe.clear -text "Clear Weight Log" -command ClearWeightLog] -row 10 -column 0 -columnspan 3 -padx [expr {$::magnify * 5}] -sticky e

grid [ttk::label .nut.po.pane.wlogframe.summary -wraplength [expr {$::magnify * 150}] -textvariable ::wlogsummary -justify right -style po.TLabel] -row 4 -rowspan 6 -column 0 -columnspan 3 -padx [expr {$::magnify * 5}] -sticky e

grid rowconfigure .nut.po.pane.optframe all -uniform 1
grid columnconfigure .nut.po.pane.optframe all -uniform 1

grid [ttk::label .nut.po.pane.optframe.cal_l -text "Calories kc" -style "po.TLabel" -justify right] -row 0 -column 0 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky e
grid [tk::spinbox .nut.po.pane.optframe.cal_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::ENERC_KCALopt -disabledforeground "#000000" ] -row 0 -column 1 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}]
set ::ENERC_KCALpo 0
grid [ttk::checkbutton .nut.po.pane.optframe.cal_cb1 -text "Adjust to my meals" -variable ::ENERC_KCALpo -onvalue -1 -style po.TCheckbutton -command [list ChangePersonalOptions ENERC_KCAL]] -row 0 -column 2 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w
grid [ttk::checkbutton .nut.po.pane.optframe.cal_cb2 -text "Auto-Set" -variable ::ENERC_KCALpo -onvalue 2 -style po.TCheckbutton -command [list ChangePersonalOptions ENERC_KCAL]] -row 0 -column 3 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w

grid [ttk::label .nut.po.pane.optframe.fat_l -text "Total Fat g" -style "po.TLabel" -justify right] -row 1 -column 0 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky e
grid [tk::spinbox .nut.po.pane.optframe.fat_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::FATopt -disabledforeground "#000000" ] -row 1 -column 1 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}]
grid [ttk::checkbutton .nut.po.pane.optframe.fat_cb1 -text "Adjust to my meals" -variable ::FATpo -onvalue -1 -style po.TCheckbutton -command [list ChangePersonalOptions FAT]] -row 1 -column 2 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w
grid [ttk::checkbutton .nut.po.pane.optframe.fat_cb2 -text "DV 30% of Calories" -variable ::FATpo -onvalue 2 -style po.TCheckbutton -command [list ChangePersonalOptions FAT]] -row 1 -column 3 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w

grid [ttk::label .nut.po.pane.optframe.prot_l -text "Protein g" -style "po.TLabel" -justify right] -row 2 -column 0 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky e
grid [tk::spinbox .nut.po.pane.optframe.prot_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::PROCNTopt -disabledforeground "#000000" ] -row 2 -column 1 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}]
grid [ttk::checkbutton .nut.po.pane.optframe.prot_cb1 -text "Adjust to my meals" -variable ::PROCNTpo -onvalue -1 -style po.TCheckbutton -command [list ChangePersonalOptions PROCNT]] -row 2 -column 2 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w
grid [ttk::checkbutton .nut.po.pane.optframe.prot_cb2 -text "DV 10% of Calories" -variable ::PROCNTpo -onvalue 2 -style po.TCheckbutton -command [list ChangePersonalOptions PROCNT]] -row 2 -column 3 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w

grid [ttk::label .nut.po.pane.optframe.nfc_l -text "Non-Fiber Carb g" -style "po.TLabel" -justify right] -row 3 -column 0 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky e
grid [tk::spinbox .nut.po.pane.optframe.nfc_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::CHO_NONFIBopt -disabledforeground "#000000" ] -row 3 -column 1 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}]
grid [ttk::checkbutton .nut.po.pane.optframe.nfc_cb1 -text "Adjust to my meals" -variable ::CHO_NONFIBpo -onvalue -1 -style po.TCheckbutton -command [list ChangePersonalOptions CHO_NONFIB]] -row 3 -column 2 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w
grid [ttk::checkbutton .nut.po.pane.optframe.nfc_cb2 -text "Balance of Calories" -variable ::CHO_NONFIBpo -onvalue 2 -style po.TCheckbutton -command [list ChangePersonalOptions CHO_NONFIB]] -row 3 -column 3 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w

grid [ttk::label .nut.po.pane.optframe.fiber_l -text "Fiber g" -style "po.TLabel" -justify right] -row 4 -column 0 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky e
grid [tk::spinbox .nut.po.pane.optframe.fiber_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::FIBTGopt -disabledforeground "#000000" ] -row 4 -column 1 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}]
grid [ttk::checkbutton .nut.po.pane.optframe.fiber_cb1 -text "Adjust to my meals" -variable ::FIBTGpo -onvalue -1 -style po.TCheckbutton -command [list ChangePersonalOptions FIBTG]] -row 4 -column 2 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w
grid [ttk::checkbutton .nut.po.pane.optframe.fiber_cb2 -text "Daily Value Default" -variable ::FIBTGpo -onvalue 2 -style po.TCheckbutton -command [list ChangePersonalOptions FIBTG]] -row 4 -column 3 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w

grid [ttk::label .nut.po.pane.optframe.sat_l -text "Saturated Fat g" -style "po.TLabel" -justify right] -row 5 -column 0 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky e
grid [tk::spinbox .nut.po.pane.optframe.sat_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::FASATopt -disabledforeground "#000000" ] -row 5 -column 1 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}]
grid [ttk::checkbutton .nut.po.pane.optframe.sat_cb1 -text "Adjust to my meals" -variable ::FASATpo -onvalue -1 -style po.TCheckbutton -command [list ChangePersonalOptions FASAT]] -row 5 -column 2 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w
grid [ttk::checkbutton .nut.po.pane.optframe.sat_cb2 -text "DV 10% of Calories" -variable ::FASATpo -onvalue 2 -style po.TCheckbutton -command [list ChangePersonalOptions FASAT]] -row 5 -column 3 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w

grid [ttk::label .nut.po.pane.optframe.efa_l -text "Essential Fatty Acids g" -style "po.TLabel" -justify right] -row 6 -column 0 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky e
grid [tk::spinbox .nut.po.pane.optframe.efa_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::FAPUopt -disabledforeground "#000000" ] -row 6 -column 1 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}]
grid [ttk::checkbutton .nut.po.pane.optframe.efa_cb1 -text "Adjust to my meals" -variable ::FAPUpo -onvalue -1 -style po.TCheckbutton -command [list ChangePersonalOptions FAPU]] -row 6 -column 2 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w
grid [ttk::checkbutton .nut.po.pane.optframe.efa_cb2 -text "4% of Calories" -variable ::FAPUpo -onvalue 2 -style po.TCheckbutton -command [list ChangePersonalOptions FAPU]] -row 6 -column 3 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w

grid [ttk::label .nut.po.pane.optframe.fish_l -text "Omega-6/3 Balance" -style "po.TLabel" -justify right] -row 7 -column 0 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky e
set ::balvals {}
for {set i 15} {$i < 91} {incr i} {
 lappend ::balvals "$i / [expr {100 - $i}]"
 }
grid [ttk::combobox .nut.po.pane.optframe.fish_s -width 7 -justify right -textvariable ::FAPU1po -values $::balvals -state readonly -style po.TCombobox] -row 7 -column 1 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}]
trace add variable ::FAPU1po write [list ChangePersonalOptions FAPU1]

grid [ttk::menubutton .nut.po.pane.optframe.dv_mb -style po.TMenubutton -text "Daily Values for Individual Vitamins and Minerals" -direction right -menu .nut.po.pane.optframe.dv_mb.m] -row 8 -column 0 -columnspan 3 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w
menu .nut.po.pane.optframe.dv_mb.m -tearoff 0
foreach nut {{Vitamin A} Thiamin Riboflavin Niacin {Panto. Acid} {Vitamin B6} Folate {Vitamin B12} {Vitamin C} {Vitamin D} {Vitamin E} {Vitamin K1} Calcium Copper Iron Magnesium Manganese Phosphorus Potassium Selenium Zinc} {
 .nut.po.pane.optframe.dv_mb.m add command -label $nut -command [list changedv_vitmin $nut]
 }

grid [ttk::label .nut.po.pane.optframe.vite_l -text "vite" -style "po.TLabel" -justify right] -row 9 -column 0 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky e
grid [tk::spinbox .nut.po.pane.optframe.vite_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::NULLopt -disabledforeground "#000000" ] -row 9 -column 1 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}]
grid [ttk::checkbutton .nut.po.pane.optframe.vite_cb1 -text "Adjust to my meals" -variable ::vitminpo -onvalue -1 -style po.TCheckbutton] -row 9 -column 2 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w
grid [ttk::checkbutton .nut.po.pane.optframe.vite_cb2 -text "Daily Value Default" -variable ::vitminpo -onvalue 2 -style po.TCheckbutton] -row 9 -column 3 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 10}] -sticky w
grid remove .nut.po.pane.optframe.vite_l
grid remove .nut.po.pane.optframe.vite_s
grid remove .nut.po.pane.optframe.vite_cb1
grid remove .nut.po.pane.optframe.vite_cb2

ttk::frame .nut.ts.frranking -style vf.TFrame
grid propagate .nut.ts.frranking 0

grid [ttk::combobox .nut.ts.rankchoice -state readonly -justify center -style ts.TCombobox] -row 0 -column 0 -sticky we
grid [ttk::combobox .nut.ts.fdgroupchoice -textvariable ::fdgroupchoice -state readonly -justify center -style ts.TCombobox] -row 0 -column 1 -sticky we
grid .nut.ts.frranking -in .nut.ts -sticky nsew -row 1 -column 0 -columnspan 2
pack .nut.ts -fill both -expand 1
grid column .nut.ts 0 -weight 1
grid column .nut.ts 1 -weight 1
grid row .nut.ts 1 -weight 4
grid [labelframe .nut.ts.frgraph -background "#FFFF00"] -row 2 -column 0 -columnspan 2 -sticky nsew
canvas .nut.ts.frgraph.canvas -relief flat -background "#FFFF00"
grid .nut.ts.frgraph.canvas -in .nut.ts.frgraph -sticky nsew
grid row .nut.ts 2 -weight 2
grid propagate .nut.ts.frgraph 0

grid [ttk::treeview .nut.ts.frranking.ranking -yscrollcommand [list .nut.ts.frranking.vsb set] -style nut.Treeview -columns {food field1 field2} -show headings] -row 0 -column 0 -sticky nsew
.nut.ts.frranking.ranking column 0 -minwidth [expr {10 * $::column15}]
.nut.ts.frranking.ranking column 1 -minwidth [expr {2 * $::column15}]
.nut.ts.frranking.ranking column 2 -minwidth [expr {3 * $::column15}]
grid [scrollbar .nut.ts.frranking.vsb -width [expr {$::magnify * $::scrollwidth}] -relief sunken -orient vertical -command [list .nut.ts.frranking.ranking yview]] -row 0 -column 1 -sticky nsew

grid columnconfigure .nut.ts.frranking 0 -weight 1 -minsize 0
grid rowconfigure .nut.ts.frranking 0 -weight 1 -minsize 0

bind .nut.ts.frranking.ranking <<TreeviewSelect>> rank2vf

tuneinvf

trace add variable like_this_vf write FindFoodvf
bind .nut.vf.fsentry <FocusIn> FoodSearchvf
pack [ttk::label .nut.qn.label -text "\nNUT has ended."]
.nut add .nut.am -text "Analyze Meals" -sticky nsew
.nut add .nut.rm -text "Record Meals & Recipes" -sticky nsew
.nut add .nut.ar -text "Record Meals & Recipes" -sticky nsew
.nut add .nut.vf -text "View Foods" -sticky nsew
.nut add .nut.po -text "Personal Options"
.nut add .nut.ts -text "The Story"
#.nut hide .nut.rm
.nut hide .nut.ar
.nut hide .nut.ts
.nut add .nut.qn -text "Quit NUT"
bind .nut <<NotebookTabChanged>> NutTabChange
grid [ttk::frame .nut.vf.frlistbox -style vf.TFrame -width [expr {15 * $::column15}] ] -row 5 -rowspan 16 -column 0 -columnspan 15 -sticky nsew
grid propagate .nut.vf.frlistbox 0
grid [tk::listbox .nut.vf.frlistbox.listbox -width 85 -height 22 -listvariable foodsvf -yscrollcommand ".nut.vf.frlistbox.scrollv set" -xscrollcommand ".nut.vf.frlistbox.scrollh set" -background "#00FF00" -setgrid 1] -row 0 -column 0 -sticky nsew
grid [scrollbar .nut.vf.frlistbox.scrollv -width [expr {$::magnify * $::scrollwidth}] -relief sunken -orient vertical -command ".nut.vf.frlistbox.listbox yview"] -row 0 -column 1 -sticky nsew
grid [scrollbar .nut.vf.frlistbox.scrollh -width [expr {$::magnify * $::scrollwidth}] -relief sunken -orient horizontal -command ".nut.vf.frlistbox.listbox xview"] -row 1 -column 0 -sticky nswe
grid rowconfig .nut.vf.frlistbox 0 -weight 1 -minsize 0
grid columnconfig .nut.vf.frlistbox 0 -weight 1 -minsize 0
bind .nut.vf.frlistbox.listbox <<ListboxSelect>> FoodChoicevf
grid remove .nut.vf.frlistbox

grid [ttk::frame .nut.rm.frmenu -style rm.TFrame -width [expr {15 * $::column15}] ] -row 5 -rowspan 16 -column 0 -columnspan 15
grid propagate .nut.rm.frmenu 0
grid [tk::text .nut.rm.frmenu.menu -yscrollcommand ".nut.rm.frmenu.scrollv set" -state disabled -wrap none -height 32 -width 99 -inactiveselectbackground {} -background "#FF7F00" -cursor [. cget -cursor] ] -row 0 -column 0 -sticky nsew
grid [scrollbar .nut.rm.frmenu.scrollv -width [expr {$::magnify * $::scrollwidth}] -relief sunken -orient vertical -command ".nut.rm.frmenu.menu yview"] -row 0 -column 1 -sticky nsew
grid rowconfig .nut.rm.frmenu 0 -weight 1 -minsize 0
grid columnconfig .nut.rm.frmenu 0 -weight 1 -minsize 0

set ::PCFchoices {{No Auto Portion Control} {Protein} {Non-Fiber Carb} {Total Fat} {Vitamin A} {Thiamin} {Riboflavin} {Niacin} {Panto. Acid} {Vitamin B6} {Folate} {Vitamin B12} {Vitamin C} {Vitamin D} {Vitamin E} {Vitamin K1} {Calcium} {Copper} {Iron} {Magnesium} {Manganese} {Phosphorus} {Potassium} {Selenium} {Zinc} {Glycine} {Retinol} {Fiber}}
set ::rmMenu .nut.rm.frmenu
grid remove .nut.rm.frmenu

foreach x {am rm vf ar} {
 grid [ttk::notebook .nut.${x}.nbw -style ${x}.TNotebook] -row 5 -rowspan 16 -column 0 -columnspan 15 -sticky s
 for {set i 0} {$i < 16} {incr i} {
  grid columnconfigure .nut.${x} $i -uniform 1
  }
 for {set i 0} {$i < 5} {incr i} {
  grid rowconfigure .nut.${x} $i -uniform 1 -weight 1
  }
 for {set i 5} {$i < 21} {incr i} {
  grid rowconfigure .nut.${x} $i -uniform 1
  }
 ttk::frame .nut.${x}.nbw.screen0 -style ${x}.TFrame
 ttk::frame .nut.${x}.nbw.screen1 -style ${x}.TFrame
 ttk::frame .nut.${x}.nbw.screen2 -style ${x}.TFrame
 ttk::frame .nut.${x}.nbw.screen3 -style ${x}.TFrame
 ttk::frame .nut.${x}.nbw.screen4 -style ${x}.TFrame
 ttk::frame .nut.${x}.nbw.screen5 -style ${x}.TFrame
 .nut.${x}.nbw add .nut.${x}.nbw.screen0 -text "Daily Value %"
 .nut.${x}.nbw add .nut.${x}.nbw.screen1 -text "DV Amounts"
 .nut.${x}.nbw add .nut.${x}.nbw.screen2 -text "Carbs & Amino Acids"
 .nut.${x}.nbw add .nut.${x}.nbw.screen3 -text "Miscellaneous"
 .nut.${x}.nbw add .nut.${x}.nbw.screen4 -text "Sat & Mono FA"
 .nut.${x}.nbw add .nut.${x}.nbw.screen5 -text "Poly & Trans FA"
 set screen 0
 set row 0
 set bcol 0
 set valcol 3
 set ucol 5
 foreach nut {ENERC_KCAL} {
  if {$x != "ar"} {grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::caloriebutton -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we} else {grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -text "Calories (2000)" -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we}
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -text "%" -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 foreach nut {ENERC_KCAL1} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -text "Prot / Carb / Fat" -command "NewStory ENERC_KCAL $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 3
  incr row
  }
 set row 3
 foreach nut {FAT FASAT FAMS FAPU OMEGA6 LA AA OMEGA3 ALA EPA DHA CHOLE} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -text "%" -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 0
 set bcol 6
 set valcol 9
 set ucol 11
 foreach nut {CHOCDF FIBTG} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -text "%" -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 3
 foreach nut {VITA_IU THIA RIBF NIA PANTAC VITB6A FOL VITB12 VITC VITD VITE VITK1} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -text "%" -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 0
 set bcol 12
 set valcol 15
 set ucol 17
 foreach nut {PROCNT} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -text "%" -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 foreach nut {CHO_NONFIB} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
   if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}1 -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}1 -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
   grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w

#uncomment these two lines and comment out the previous two if user insists he
#must see CHO_NONFIB percentage of DV instead of grams

#   if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}1 -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
#   grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -text "%" -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 3
 foreach nut {CA CU FE MG MN P K SE NA ZN} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -text "%" -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 14
 foreach nut {FAPU1} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -text "Omega-6/3 Bal." -command "NewStory FAPU $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 3
  incr row
  }
 for {set i 0} {$i < 18} {incr i} {
  grid columnconfigure .nut.${x}.nbw.screen${screen} $i -uniform 1 -minsize $::column18
  }
 for {set i 0} {$i < 15} {incr i} {
  grid rowconfigure .nut.${x}.nbw.screen${screen} $i -uniform 1
  }
 set screen 1
 set row 0
 set bcol 0
 set valcol 3
 set ucol 5
 foreach nut {ENERC_KCAL} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 foreach nut {ENERC_KCAL1} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -text "Prot / Carb / Fat" -command "NewStory ENERC_KCAL $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 3
  incr row
  }
 set row 3
 foreach nut {FAT FASAT FAMS FAPU OMEGA6 LA AA OMEGA3 ALA EPA DHA CHOLE} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 0
 set bcol 6
 set valcol 9
 set ucol 11
 foreach nut {CHOCDF FIBTG} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 3
 foreach nut {VITA_IU THIA RIBF NIA PANTAC VITB6A FOL VITB12 VITC VITD VITE VITK1} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 0
 set bcol 12
 set valcol 15
 set ucol 17
 foreach nut {PROCNT CHO_NONFIB} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 3
 foreach nut {CA CU FE MG MN P K SE NA ZN} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 14
 foreach nut {FAPU1} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -text "Omega-6/3 Bal." -command "NewStory FAPU $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 3
  incr row
  }
 for {set i 0} {$i < 18} {incr i} {
  grid columnconfigure .nut.${x}.nbw.screen${screen} $i -uniform 1 -minsize $::column18
  }
 for {set i 0} {$i < 15} {incr i} {
  grid rowconfigure .nut.${x}.nbw.screen${screen} $i -uniform 1
  }
 set screen 2
 set row 2
 set bcol 0
 set valcol 3
 set ucol 5
 foreach nut {CHOCDF FIBTG STARCH SUGAR FRUS GALS GLUS LACS MALS SUCS} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 2
 set bcol 6
 set valcol 9
 set ucol 11
 foreach nut {PROCNT ADPROT ALA_G ARG_G ASP_G CYS_G GLU_G GLY_G HISTN_G HYP ILE_G} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 2
 set bcol 12
 set valcol 15
 set ucol 17
 foreach nut {LEU_G LYS_G MET_G PHE_G PRO_G SER_G THR_G TRP_G TYR_G VAL_G} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 for {set i 0} {$i < 18} {incr i} {
  grid columnconfigure .nut.${x}.nbw.screen${screen} $i -uniform 1 -minsize $::column18
  }
 for {set i 0} {$i < 15} {incr i} {
  grid rowconfigure .nut.${x}.nbw.screen${screen} $i -uniform 1
  }
 set screen 3
 set row 1
 set bcol 0
 set valcol 3
 set ucol 5
 foreach nut {ENERC_KJ ASH WATER CAFFN THEBRN ALC FLD BETN CHOLN FOLAC FOLFD FOLDFE RETOL} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 1
 set bcol 6
 set valcol 9
 set ucol 11
 foreach nut {VITA_RAE ERGCAL CHOCAL VITD_BOTH VITB12_ADDED VITE_ADDED VITK1D MK4 TOCPHA TOCPHB TOCPHG TOCPHD TOCTRA} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 1
 set bcol 12
 set valcol 15
 set ucol 17
 foreach nut {TOCTRB TOCTRG TOCTRD CARTA CARTB CRYPX LUT_ZEA LYCPN CHOLE PHYSTR SITSTR CAMD5 STID7} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 for {set i 0} {$i < 18} {incr i} {
  grid columnconfigure .nut.${x}.nbw.screen${screen} $i -uniform 1 -minsize $::column18
  }
 for {set i 0} {$i < 15} {incr i} {
  grid rowconfigure .nut.${x}.nbw.screen${screen} $i -uniform 1
  }
 set screen 4
 set row 0
 set bcol 3
 set valcol 6
 set ucol 8
 foreach nut {FASAT F4D0 F6D0 F8D0 F10D0 F12D0 F13D0 F14D0 F15D0 F16D0 F17D0 F18D0 F20D0 F22D0 F24D0} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 1
 set bcol 9
 set valcol 12
 set ucol 14
 foreach nut {FAMS F14D1 F15D1 F16D1 F16D1C F17D1 F18D1 F18D1C F20D1 F22D1 F22D1C F24D1C} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 for {set i 0} {$i < 18} {incr i} {
  grid columnconfigure .nut.${x}.nbw.screen${screen} $i -uniform 1 -minsize $::column18
  }
 for {set i 0} {$i < 15} {incr i} {
  grid rowconfigure .nut.${x}.nbw.screen${screen} $i -uniform 1
  }
 set screen 5
 set row 3
 set bcol 0
 set valcol 3
 set ucol 5
 foreach nut {FAPU F18D2 F18D2CN6 F18D3 F18D3CN3 F18D3CN6 F18D4 F20D2CN6} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 2
 set bcol 6
 set valcol 9
 set ucol 11
 foreach nut {F20D3 F20D3N3 F20D3N6 F20D4 F20D4N6 F20D5 F21D5 F22D4 F22D5 F22D6} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 set row 1
 set bcol 12
 set valcol 15
 set ucol 17
 foreach nut {FATRN FATRNM F16D1T F18D1T F18D1TN7 F22D1T FATRNP F18D2I F18D2T F18D2TT F18D2CLA F18D3I} {
  grid [ttk::button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -style "nutbutton.TButton"] -row $row -column $bcol -columnspan 3 -sticky we
  if {$x == "ar"} {grid [ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right -width 8] -row $row -column $valcol -columnspan 2 -sticky e} else {grid [ttk::label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -style ${x}.TLabel] -row $row -column $valcol -columnspan 2 -sticky e}
  grid [ttk::label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -style ${x}.TLabel] -row $row -column $ucol -sticky w
  incr row
  }
 for {set i 0} {$i < 18} {incr i} {
  grid columnconfigure .nut.${x}.nbw.screen${screen} $i -uniform 1 -minsize $::column18
  }
 for {set i 0} {$i < 15} {incr i} {
  grid rowconfigure .nut.${x}.nbw.screen${screen} $i -uniform 1
  }
 }
bind .nut.am.nbw <<NotebookTabChanged>> NBWamTabChange
bind .nut.rm.nbw <<NotebookTabChanged>> NBWrmTabChange
bind .nut.vf.nbw <<NotebookTabChanged>> NBWvfTabChange
bind .nut.ar.nbw <<NotebookTabChanged>> NBWarTabChange

if {[file exists "NUTR_DEF.txt"]} {

 toplevel .loadframe
 wm title .loadframe $::version
 wm withdraw .

 grid [ttk::label .loadframe.mainlabel -text "Updating USDA Nutrient Database"] -column 0 -row 0 -columnspan 2 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 5}]

 set ::pbprog1counter 0

 for {set i 1} {$i < 9} {incr i} {
  set pbar($i) 0.0
  grid [ttk::progressbar .loadframe.pbar${i} -style lf.Horizontal.TProgressbar -variable pbar($i) -orient horizontal -length [expr {$::magnify * 100}] -mode determinate] -column 0 -row $i -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 5}]
  }

 grid [ttk::label .loadframe.label1 -text "Load Nutrient Definitions"] -column 1 -row 1 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 5}] -sticky w
 grid [ttk::label .loadframe.label2 -text "Load Food Groups"] -column 1 -row 2 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 5}] -sticky w
 grid [ttk::label .loadframe.label3 -text "Load Foods"] -column 1 -row 3 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 5}] -sticky w
 grid [ttk::label .loadframe.label4 -text "Load Serving Sizes"] -column 1 -row 4 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 5}] -sticky w
 grid [ttk::label .loadframe.label5 -text "Load Nutrient Values"] -column 1 -row 5 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 5}] -sticky w
 grid [ttk::label .loadframe.label6 -text "Join Nutrient Values to Foods"] -column 1 -row 6 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 5}] -sticky w
 grid [ttk::label .loadframe.label7 -text "Compute Derived Nutrient Values"] -column 1 -row 7 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 5}] -sticky w
 grid [ttk::label .loadframe.label8 -text "Load Legacy Files and Write to Disk"] -column 1 -row 8 -padx [expr {$::magnify * 5}] -pady [expr {$::magnify * 5}] -sticky w

db eval {select code from tcl_code where name = 'ComputeDerivedValues'} { }
eval $code
db eval {select code from tcl_code where name = 'InitialLoad'} { }
eval $code
 } else {
 set tablename [db eval {select name from sqlite_master where type='table' and name = "nutr_def"}]
 if { $tablename == "" } {
  tk_messageBox -type ok -title $::version -message "NUT requires the USDA Nutrient Database to be present initially in order to be loaded into SQLite.  Download it in the full ascii version from \"http://www.ars.usda.gov/nutrientdata\" or from \"http://nut.sourceforge.net\" and unzip it in this directory, [pwd]." -detail "Follow this same procedure later when you want to upgrade the USDA database yet retain your personal data.  After USDA files have been loaded into NUT they can be deleted.\n\nIf you really do want to reload a USDA database that you have already loaded, rename the file \"NUTR_DEF.txt.loaded\" to \"NUTR_DEF.txt\"."
  rename unknown ""
  rename _original_unknown unknown
  destroy .
  } else {
  db eval {select code from tcl_code where name = 'Start_NUT'} { }
  eval $code
  }
 }

#end Main
}

set ComputeDerivedValues {

proc ComputeDerivedValues {db table} {
$db eval {BEGIN}
$db eval "update $table set VITE = null"
$db eval "update $table set VITE = case when VITE_ADDED is not null and TOCPHA is not null then (VITE_ADDED/0.45)+((TOCPHA-VITE_ADDED)*1.5) when VITE_ADDED is not null then VITE_ADDED/0.45 when TOCPHA is not null then TOCPHA*1.5 end"
$db eval "update $table set LA = null"
$db eval "update $table set LA = case when F18D2CN6 is not null then F18D2CN6 when F18D2CN6 is null and F18D2 is not null then F18D2 end"
$db eval "update $table set LA = case when F18D2CN6 is null and F18D2 is not null and F18D2T is not null then LA - F18D2T else LA end"
$db eval "update $table set LA = case when F18D2CN6 is null and F18D2 is not null and F18D2TT is not null then LA - F18D2TT else LA end"
$db eval "update $table set LA = case when F18D2CN6 is null and F18D2 is not null and F18D2I is not null then LA - F18D2I else LA end"
$db eval "update $table set LA = case when F18D2CN6 is null and F18D2 is not null and F18D2CLA is not null then LA - F18D2CLA else LA end"
$db eval "update $table set ALA = null"
$db eval "update $table set ALA = case when F18D3CN3 is not null then F18D3CN3 when F18D3CN3 is null and F18D3 is not null then F18D3 end"
$db eval "update $table set ALA = case when F18D3CN3 is null and F18D3 is not null and F18D3I is not null then ALA - F18D3I else ALA end"
$db eval "update $table set SHORT6 = LA"
$db eval "update $table set SHORT6 = case when F18D3CN6 is not null and SHORT6 is null then F18D3CN6 when F18D3CN6 is not null and SHORT6 is not null then SHORT6+F18D3CN6 else SHORT6 end"
$db eval "update $table set SHORT3 = ALA"
$db eval "update $table set SHORT3 = case when F18D4 is not null and SHORT3 is null then F18D4 when F18D4 is not null and SHORT3 is not null then SHORT3+F18D4 else SHORT3 end"
$db eval "update $table set AA = F20D4N6"
$db eval "update $table set AA = case when AA is null then F20D4 else AA end"
$db eval "update $table set LONG6 = AA"
$db eval "update $table set LONG6 = case when LONG6 is null and F20D3N6 is not null then F20D3N6 when LONG6 is not null and F20D3N6 is not null then LONG6 + F20D3N6 when F20D3N6 is null then LONG6 end"
$db eval "update $table set LONG6 = case when FdGrp_Cd != 1500 and FdGrp_Cd != 3500 and F20D3N6 is null and F20D3 is not null and F20D3N3 is not null and LONG6 is not null then LONG6 + F20D3 - F20D3N3 when FdGrp_Cd != 1500 and FdGrp_Cd != 3500 and F20D3N6 is null and F20D3 is not null and F20D3N3 is null and LONG6 is not null then LONG6 + F20D3 when FdGrp_Cd != 1500 and FdGrp_Cd != 3500 and F20D3N6 is null and LONG6 is null and F20D3 is not null then F20D3 else LONG6 end"
$db eval "update $table set EPA = F20D5"
$db eval "update $table set DHA = F22D6"
$db eval "update $table set LONG3 = EPA"
$db eval "update $table set LONG3 = case when LONG3 is null and DHA is not null then DHA when LONG3 is not null and DHA is not null then LONG3+DHA else LONG3 end"
$db eval "update $table set LONG3 = case when LONG3 is null and F20D3N3 is not null then F20D3N3 when LONG3 is not null and F20D3N3 is not null then LONG3+F20D3N3 else LONG3 end"
$db eval "update $table set LONG3 = case when LONG3 is null and F21D5 is not null then F21D5 when LONG3 is not null and F21D5 is not null then LONG3+F21D5 else LONG3 end"
$db eval "update $table set LONG6 = case when LONG6 is null and F22D4 is not null then F22D4 when LONG6 is not null and F22D4 is not null then LONG6+F22D4 else LONG6 end"
$db eval "update $table set LONG3 = case when LONG3 is null and F22D5 is not null then F22D5 when LONG3 is not null and F22D5 is not null then LONG3+F22D5 else LONG3 end"
$db eval "update $table set OMEGA6 = SHORT6"
$db eval "update $table set OMEGA6 = case when OMEGA6 is null then LONG6 when OMEGA6 is not null and LONG6 is not null then OMEGA6+LONG6 else OMEGA6 end"
$db eval "update $table set OMEGA3 = SHORT3"
$db eval "update $table set OMEGA3 = case when OMEGA3 is null then LONG3 when OMEGA3 is not null and LONG3 is not null then OMEGA3+LONG3 else OMEGA3 end"
$db eval "update $table set Pro_Factor = Pro_Factor * 1.0, CHO_Factor = CHO_Factor * 1.0, Fat_Factor = Fat_Factor * 1.0"
$db eval "update $table set Pro_Factor = case when (Pro_Factor is null or Pro_Factor <= 0.0) and PROCNT is not null then 4 else Pro_Factor end, CHO_Factor = case when (CHO_Factor is null or CHO_Factor <= 0.0) and CHOCDF is not null then 4 else CHO_Factor end, Fat_Factor = case when (Fat_Factor is null or Fat_Factor <= 0.0) and FAT is not null then 9 else Fat_Factor end"
$db eval "update $table set PROT_KCAL = case when PROCNT is null then 0 else Pro_Factor*PROCNT end, CHO_KCAL = case when CHOCDF is null then 0 else CHO_Factor*CHOCDF end, FAT_KCAL = case when FAT is null then 0 else Fat_Factor*FAT end"
$db eval "update $table set ENERC_KCAL = 0 where ENERC_KCAL is null"
$db eval "update $table set WATER = 0 where WATER is null"
$db eval "update $table set FAT = 0 where FAT is null"
$db eval "update $table set PROCNT = 0 where PROCNT is null"
$db eval "update $table set CHOCDF = 0 where CHOCDF is null"
$db eval "update $table set CHO_NONFIB = case when FIBTG is null then CHOCDF else CHOCDF - FIBTG end"
$db eval "create temp table tratios (rNDB_No int primary key, ratio real)"
$db eval "insert into tratios select NDB_No, (PROT_KCAL + CHO_KCAL + FAT_KCAL + (case when ALC is not null then ALC else 0.0 end * 6.93)) / ENERC_KCAL from $table where ENERC_KCAL > 0.0"
$db eval "update $table set PROT_KCAL = PROT_KCAL / (select ratio from tratios where NDB_No = rNDB_No), CHO_KCAL = CHO_KCAL / (select ratio from tratios where NDB_No = rNDB_No), FAT_KCAL = FAT_KCAL / (select ratio from tratios where NDB_No = rNDB_No)"
$db eval {drop table tratios}
$db eval {COMMIT}
}

#end ComputeDerivedValues
}

set InitialLoad {

sqlite3 dbmem :memory:
dbmem function n6hufa n6hufa
dbmem function setRefDesc setRefDesc
dbmem function format_meal_id format_meal_id

if {[catch {dbmem restore main $DiskDB}]} {

# Duplicate the schema of appdata1.xyz into the in-memory db database

 db eval {SELECT sql FROM sqlite_master WHERE sql NOT NULL and type = 'table' and name not like '%sqlite_%'} {
  dbmem eval $sql
  }

# Copy data content from appdata1.xyz into memory
 dbmem eval {ATTACH $::DiskDB AS app}
 dbmem eval {SELECT name FROM sqlite_master WHERE type='table'} {
  dbmem eval "INSERT INTO $name SELECT * FROM app.$name"
  }
 dbmem eval {DETACH app}
 }

dbmem eval {PRAGMA synchronous = 0}

dbmem progress 1920 {pbprog 1 1.0 }
load_nutr_def

set ::pbar(1) 100.0
dbmem progress 10 {pbprog 2 1.0 }
load_fd_group

set ::pbar(2) 100.0
dbmem progress 8000 {pbprog 3 1.0 }
load_food_des1

dbmem eval {select count(*) as count from food_des} {
 if {$count != 0} {
  dbmem progress 32000 {pbprog 3 1.0 }
  }
 }
load_food_des2

set ::pbar(3) 100.0
dbmem progress 9000 {pbprog 4 1.0 }
load_weight

set ::pbar(4) 100.0
set ::pbar(5) 0.5
dbmem progress 26 {pbprog1}
load_nut_data1

dbmem progress 300000 {pbprog 5 1.0 }
load_nut_data2

set ::pbar(5) 100.0

dbmem progress 240000 {pbprog 6 1.0 }
dbmem eval $::foodjoin

set ::pbar(6) 100.0
dbmem progress [expr {[dbmem eval {select count(NDB_No) from food_des}] * 120}] {pbprog 7 1.0 }
ComputeDerivedValues dbmem food_des

set ::pbar(7) 100.0
dbmem progress 4000 {update}

.loadframe.pbar8 configure -mode indeterminate
.loadframe.pbar8 start
load_legacy

dbmem progress 0 ""
.loadframe.pbar8 stop
.loadframe.pbar8 configure -mode determinate
set ::pbar(8) 80.0
update
dbmem eval {analyze main}
dbmem eval {PRAGMA synchronous = 2}
if {[catch {dbmem backup main $DiskDB}]} {

# Duplicate the schema of appdata1.xyz from the in-memory db database
 set sql_mast [db eval {SELECT name, type FROM sqlite_master where type != 'index'}]
 foreach {name type} $sql_mast {
  db eval "DROP $type if exists $name"
  }
 dbmem eval {SELECT sql FROM sqlite_master WHERE sql NOT NULL and type != 'trigger'} {
  db eval $sql
  }

# Copy data content into appdata1.xyz from memory
 dbmem eval {ATTACH $DiskDB AS app}
 dbmem eval {SELECT name FROM sqlite_master WHERE type='table'} {
  dbmem eval "INSERT INTO app.$name SELECT * FROM $name"
  }
 dbmem eval {SELECT sql FROM sqlite_master WHERE sql NOT NULL and type = 'trigger'} {
  db eval $sql
  }
 dbmem eval {DETACH app}
 }
dbmem close
set ::pbar(8) 90.0
update
db eval {vacuum}
file rename -force "NUTR_DEF.txt" "NUTR_DEF.txt.loaded"
set ::pbar(8) 100.0
update
db eval {select code from tcl_code where name = 'Start_NUT'} { }
eval $code
wm deiconify .
destroy .loadframe

#end InitialLoad
}

set Start_NUT {

db nullvalue "\[No Data\]"

#If user didn't reload USDA database, he won't pickup Retinol & Glycine change.
#This ensures Retinol & Glycine are now DV nutrients

db eval {update nutr_def set dv_default = case when (select dv_default from nutr_def where NutrDesc = 'Retinol') = 0.0 then 7.0 else dv_default end where NutrDesc = 'Retinol'}
db eval {update nutr_def set dv_default = case when (select dv_default from nutr_def where NutrDesc = 'Glycine') = 0.0 then 7.0 else dv_default end where NutrDesc = 'Glycine'}

#end of special Retinol & Glycine update

db eval {select Tagname, NutrDesc, Units from nutr_def} {
 set nut $Tagname
 set ::${nut}b $NutrDesc
 set ::${nut}u $Units
 }

db eval {select count(meal_id) as "::mealcount", case when FAPU1 = 0.0 then 50.0 else FAPU1 end as "::FAPU1", defanal_am from meals, options} {
 if {$defanal_am > 0} {
  set ::meals_to_analyze_am [expr {$defanal_am > $::mealcount ? $::mealcount : $defanal_am}]
  .nut.am.mealsb configure -from 1
  } else {
  set ::meals_to_analyze_am $::mealcount
  if {$::mealcount > 0} {.nut.am.mealsb configure -from 1} else {
   .nut.am.mealsb configure -from 0
   }
  }
 if {$::mealcount > 0} {.nut.am.mealsb configure -to $::mealcount}
 }

::trace add variable ::meals_to_analyze_am write SetDefanal

db eval {select Tagname from nutr_def where dv_default > 0.0} {
 trace add variable ::${Tagname}opt write [list opt_change $Tagname]
 trace add variable ::${Tagname}am write ::${Tagname}dv_change
 trace add variable ::${Tagname}rm write ::${Tagname}new_rm
 trace add variable ::${Tagname}vf write ::${Tagname}new_vf
 trace add variable ::${Tagname}dv write ::${Tagname}new_dv
 }

db eval {select grams as "::GRAMSopt" from options} { }
db eval {select * from nut_opts} { }
db eval {select * from dv_defaults} { }
db eval {select * from dv} { }
db eval {select * from am_zero; select * from rm_zero; select * from vf_zero} { }
if {$::mealcount > 0} {
 update_am
 }

SetMealBase
set ::rmMainPane .nut.rm.nbw

::trace add variable ::GRAMSopt write GO_change

set ::rankchoices { {Foods Ranked per 100 Grams} {Foods Ranked per 100 Calories} {Foods Ranked per one approximate Serving} {Foods Ranked per Daily Recorded Meals} }
set ::fdgroupchoices { {All Food Groups} }
db eval {select count(meal_id) as "::mealcount" from meals} { }
if {$::mealcount > 0} {
 set ::rankchoice {Foods Ranked per Daily Recorded Meals}
 } else {
 set ::rankchoice {Foods Ranked per 100 Grams}
 }
set ::fdgroupchoice {All Food Groups}
.nut.ts.rankchoice configure -textvariable ::rankchoice -values $::rankchoices

db eval {select FdGrp_Desc as fg from fd_group order by FdGrp_Desc} {
 lappend ::fdgroupchoices $fg
 }
.nut.ts.fdgroupchoice configure -values $::fdgroupchoices
trace add variable ::rankchoice write [list NewStoryLater NULL ts]
trace add variable ::fdgroupchoice write [list NewStoryLater NULL ts]

menu .nut.rm.setmpd.m -tearoff 0 -background "#FF9428"
if {$::meals_per_day != 1} {
 .nut.rm.setmpd.m add command -label "Set 1 meal per day" -command [list SetMPD 1]
 } else {
 .nut.rm.setmpd.m add command -label "Set 1 meal per day" -command [list SetMPD 1] -state disabled
 }
for {set i 2} {$i < 20} {incr i} {
 if {$i != $::meals_per_day} {
  .nut.rm.setmpd.m add command -label "Set $i meals per day" -command [list SetMPD $i]
  } else {
  .nut.rm.setmpd.m add command -label "Set $i meals per day" -command [list SetMPD $i] -state disabled
  }
 }

after 1000 {.nut.vf.frlistbox configure -height [winfo height .nut.vf.nbw]}
after 1000 {.nut.vf.frlistbox configure -width [winfo width .nut.vf.nbw]}
after 1000 {.nut.rm.frlistbox configure -height [winfo height .nut.rm.nbw]}
after 1000 {.nut.rm.frlistbox configure -width [winfo width .nut.rm.nbw]}
after 1000 {.nut.rm.frmenu configure -height [winfo height .nut.rm.nbw]}
after 1000 {.nut.rm.frmenu configure -width [winfo width .nut.rm.nbw]}
after 1000 {.nut.po.pane configure -handlepad [expr 8 * {[winfo height .nut] / 19}]}
after 1000 {.nut.po.pane configure -height [expr {145 * [winfo height .nut] / 152}]}
after 1000 {.nut.po.pane configure -width [winfo width .nut.rm.nbw]}
after 1000 {.nut.po.pane paneconfigure .nut.po.pane.wlogframe -sticky ne}
if {$::mealcount == 0} {
 db eval {select FAPU1 as "::FAPU1" from options} { }
 auto_cal
 }
after 2000 InitializePersonalOptions

#end Start_NUT
}

set AmountChangevf {

proc AmountChangevf {args} {

 uplevel #0 {
  if {![string is double -strict $Amountvf]} { return }
  set gramsvf [expr {$Amountvf * $Amount2gram}]
  }

 }

#end AmountChangevf
}

set CalChangevf {

proc CalChangevf {args} {

 uplevel #0 {
  if {![string is double -strict $caloriesvf]} { return }
  set gramsvf [expr {$caloriesvf * $cal2gram}]
  }

 }

#end CalChangevf
}

set CancelSearch {

proc CancelSearch {args} {

if {!$::ALTGUI} {
 grid remove .nut.rm.searchcancel
 grid remove .nut.rm.frlistbox
 grid .nut.rm.grams
 grid .nut.rm.ounces
 grid .nut.rm.analysismeal
 } else {
 place forget .nut.rm.searchcancel
 place forget .nut.rm.frlistbox
 place .nut.rm.grams -relx 0.87 -rely 0.0046296296 -relheight 0.044444444 -relwidth 0.11
 place .nut.rm.ounces -relx 0.87 -rely 0.0490740736 -relheight 0.044444444 -relwidth 0.11
 place .nut.rm.analysismeal -relx 0.87 -rely 0.14722222 -relheight 0.044444444 -relwidth 0.11
 }
 SwitchToMenu
 set ::like_this_rm ""
 focus .nut

 }

#end CancelSearch
}

set FindFoodrm {

proc FindFoodrm {args} {

 set ::needFindFoodrm 1
 after 350 FindFoodrm_later

 }

#end FindFoodrm
}

set FindFoodrm_later {

proc FindFoodrm_later {args} {

 if {! $::needFindFoodrm} {return}
 set ::needFindFoodrm 0
 uplevel #0 {
  set query "select Long_Desc from food_des where "
  regsub -all {"} "$::like_this_rm" " " ::like_this_rm1
  regsub -all "\{" "$::like_this_rm1" " " ::like_this_rm1
  if { $::like_this_rm == ""} {
   set foodsrm ""
   return
   }
  foreach token $::like_this_rm1 {
   append query "Long_Desc like \"%${token}%\" and "
   }
  append query "Long_Desc is not null order by Long_Desc collate nocase asc"
  set foodsrm [db eval $query]
  .nut.rm.frlistbox.listbox xview 0
  }

 }

#end FindFoodrm_later
}

set FindFoodvf {

proc FindFoodvf {args} {

 set ::needFindFoodvf 1
 after 350 FindFoodvf_later

 }

#end FindFoodvf
}

set FindFoodvf_later {

proc FindFoodvf_later {args} {

 if {! $::needFindFoodvf} {return}
 set ::needFindFoodvf 0
 uplevel #0 {
  set query "select Long_Desc from food_des where "
  regsub -all {"} "$like_this_vf" " " like_this_vf1
  regsub -all "\{" "$like_this_vf1" " " like_this_vf1
  if { $like_this_vf == ""} {
   set foodsvf ""
   return
   }
  foreach token $like_this_vf1 {
   append query "Long_Desc like \"%${token}%\" and "
   }
  append query "Long_Desc is not null order by Long_Desc collate nocase asc"
  set foodsvf [db eval $query]
  .nut.vf.frlistbox.listbox xview 0
  }

 }

#end FindFoodvf_later
}

set FoodChoicerm {

proc FoodChoicerm {args} {

 uplevel #0 {
  set ld "[lindex $foodsrm [.nut.rm.frlistbox.listbox curselection]]"
  if {$ld == ""} {return}
  db eval {select Shrt_Desc, food_des.NDB_No, whectograms from food_des, weight where Long_Desc = $ld and food_des.NDB_No = weight.NDB_No limit 1} {
   db eval {insert or replace into mealfoods values ($::currentmeal / 100, $::currentmeal % 100, $NDB_No, $whectograms)}
   MealfoodWidget $Shrt_Desc $NDB_No
   }
  if {!$::ALTGUI} {
   grid remove .nut.rm.frlistbox
   grid remove .nut.rm.searchcancel
   grid .nut.rm.analysismeal
   } else {
   place forget .nut.rm.frlistbox
   place forget .nut.rm.searchcancel
   place .nut.rm.analysismeal -relx 0.87 -rely 0.14722222 -relheight 0.044444444 -relwidth 0.11
   }
  SwitchToMenu
  if { $::like_this_rm ni [.nut.rm.fsentry cget -values]} {
   .nut.rm.fsentry configure -values [linsert [.nut.rm.fsentry cget -values] 0 $::like_this_rm]
   }
  set ::like_this_rm ""
  focus .nut
  }
 RefreshMealfoodQuantities
 db eval {select * from rm} { }
 update_am
 }

#end FoodChoicerm
}

set vf2rm {

proc vf2rm {args} {

db eval {select Shrt_Desc, food_des.NDB_No, whectograms from food_des, weight where food_des.NDB_No = $::NDB_Novf and food_des.NDB_No = weight.NDB_No limit 1} {
 db eval {insert or replace into mealfoods values ($::currentmeal / 100, $::currentmeal % 100, $NDB_No, $whectograms)}
 MealfoodWidget $Shrt_Desc $NDB_No
 }
if {!$::ALTGUI} {
 grid remove .nut.rm.setmpd
 grid .nut.rm.analysismeal
 } else {
 place forget .nut.rm.setmpd
 place .nut.rm.analysismeal -relx 0.87 -rely 0.14722222 -relheight 0.044444444 -relwidth 0.11
 }
SwitchToMenu
.nut select .nut.rm
RefreshMealfoodQuantities
db eval {select * from rm} { }
update_am
}

#end vf2rm
}

set FoodChoicevf {

proc FoodChoicevf {args} {

 uplevel #0 {
  set ld "[lindex $foodsvf [.nut.vf.frlistbox.listbox curselection]]"
  if {$ld == ""} {return}
  .nut.vf.meal configure -state normal
  dropoutvf
  db eval {select * from vf where Long_Desc = $ld limit 1} { }
  tuneinvf
  set servingsizes [db eval {select distinct Msre_Desc from weight where NDB_No = $NDB_Novf limit 100 offset 1}]
  .nut.vf.cb configure -values $servingsizes
  if {!$::ALTGUI} {
  grid remove .nut.vf.frlistbox
  grid .nut.vf.nbw
  grid .nut.vf.meal
  } else {
  place forget .nut.vf.frlistbox
  place .nut.vf.nbw -relx 0.0 -rely 0.25 -relheight 0.75 -relwidth 1.0
  place .nut.vf.meal -relx 0.78 -rely 0.0490740736 -relheight 0.044444444 -relwidth 0.12
  }
  if { $like_this_vf ni [.nut.vf.fsentry cget -values]} {
   .nut.vf.fsentry configure -values [linsert [.nut.vf.fsentry cget -values] 0 $like_this_vf]
   }
  set like_this_vf ""
  focus .nut
  }

 }

#end FoodChoicevf
}

set FoodChoicevf_alt {

proc FoodChoicevf_alt {ndb grams upd} {

set ::x $ndb
set hgrams [expr {$grams / 100.0}]
if {$hgrams != 0.0} {
 db eval {select Seq from weight where NDB_No = $ndb limit 1} { }
 if {$upd} {
  db eval {update weight set whectograms = $hgrams, Amount = origAmount * $hgrams / orighectograms where NDB_No = $ndb and Seq = $Seq}
  }
 }

uplevel #0 {
 .nut.vf.meal configure -state normal
 dropoutvf
 db eval {select * from vf where Long_Desc = (select Long_Desc from food_des where NDB_No = $::x) limit 1} { }
 tuneinvf
 set servingsizes [db eval {select distinct Msre_Desc from weight where NDB_No = $::NDB_Novf limit 100 offset 1}]
 .nut.vf.cb configure -values $servingsizes
 if {!$::ALTGUI} {
  grid remove .nut.vf.frlistbox
  grid .nut.vf.nbw
  grid .nut.vf.meal
  } else {
  place forget .nut.vf.frlistbox
  place .nut.vf.nbw -relx 0.0 -rely 0.25 -relheight 0.75 -relwidth 1.0
  place .nut.vf.meal -relx 0.78 -rely 0.0490740736 -relheight 0.044444444 -relwidth 0.12
  }
 set like_this_vf ""
 .nut select .nut.vf
 focus .nut
 }
}

#end FoodChoicevf_alt
}

set FoodSearchrm {

proc FoodSearchrm {args} {

 uplevel #0 {
  if {!$::ALTGUI} {
   grid remove $::rmMainPane
   grid remove .nut.rm.setmpd
   grid remove .nut.rm.analysismeal
   grid remove .nut.rm.grams
   grid remove .nut.rm.ounces
   set ::rmMainPane .nut.rm.frmenu
   focus .nut.rm.fsentry
   grid .nut.rm.frlistbox
   grid .nut.rm.searchcancel
   after 400 {focus .nut.rm.fsentry}
   } else {
   place forget $::rmMainPane
   place forget .nut.rm.setmpd
   place forget .nut.rm.analysismeal
   place forget .nut.rm.grams
   place forget .nut.rm.ounces
   set ::rmMainPane .nut.rm.frmenu
   focus .nut.rm.fsentry
   place .nut.rm.frlistbox -relx 0.0 -rely 0.25 -relheight 0.75 -relwidth 1.0
   place .nut.rm.searchcancel -relx 0.86 -rely 0.19629629  -relheight 0.044444444 -relwidth 0.09
   after 400 {focus .nut.rm.fsentry}
   }
  }

 }

#end FoodSearchrm
}

set FoodSearchvf {

proc FoodSearchvf {args} {

 uplevel #0 {
  dropoutvf
  if {!$::ALTGUI} {
   grid remove .nut.vf.nbw
   grid .nut.vf.frlistbox
   grid remove .nut.vf.meal
   } else {
   place forget .nut.vf.nbw
   place .nut.vf.frlistbox -relx 0.0 -rely 0.25 -relheight 0.75 -relwidth 1.0
   place forget .nut.vf.meal
   }

  set Long_Desc ""
  set Msre_Descvf ""
  .nut.vf.sb0 set ""
  .nut.vf.sb1 set ""
  .nut.vf.sb2 set ""
  .nut.vf.sb3 set ""
  .nut.vf.cb configure -values ""
  set Refusevf ""
  .nut.vf.refusemb.m entryconfigure 0 -label "No refuse description provided"
  tuneinvf
  after 400 {focus .nut.vf.fsentry}
  }

 }

#end FoodSearchvf
}

set GramChangevf {

proc GramChangevf {args} {

 if {![string is double -strict $::gramsvf]} { return }
 after idle [list GramChangevfIdle $::gramsvf]

 }

#end GramChangevf
}

set GramChangevfIdle {

proc GramChangevfIdle {newval} {

 if {$::gramsvf != $newval} {return}
 uplevel #0 {
  db     eval {update weight set whectograms = $::gramsvf/100.0, Amount = $::gramsvf/$::Amount2gram where NDB_No = $::NDB_Novf and Msre_Desc = $::Msre_Descvf}

  dropoutvf
  db eval {select * from vf where NDB_Novf = $::NDB_Novf and Msre_Descvf = $::Msre_Descvf limit 1} { }
  tuneinvf
  }

 }

#end GramChangevfIdle
}

set InitializePersonalOptions {

proc InitializePersonalOptions {args} {

 db eval {select autocal, wltweak from options} { }

 if {$::ENERC_KCALopt == -1.0} {
  .nut.po.pane.optframe.cal_s configure -state disabled -textvariable ::ENERC_KCALdv
  set ::ENERC_KCALpo -1
  } elseif {$::ENERC_KCALopt == 0.0} {
  .nut.po.pane.optframe.cal_s configure -state normal -textvariable ::ENERC_KCALopt
  set ::ENERC_KCALopt 2000.0
  set ::ENERC_KCALpo 0
  } else {
  .nut.po.pane.optframe.cal_s configure -state normal -textvariable ::ENERC_KCALopt
  set ::ENERC_KCALpo 0
  }
 if {$autocal == 2} {
  set ::ENERC_KCALpo 2
  }

 if {$::FATopt == -1.0} {
  .nut.po.pane.optframe.fat_s configure -state disabled -textvariable ::FATdv
  set ::FATpo -1
  } elseif {$::FATopt == 0.0} {
  .nut.po.pane.optframe.fat_s configure -state disabled -textvariable ::FATdv
  set ::FATpo 2
  } else {
  .nut.po.pane.optframe.fat_s configure -state normal -textvariable ::FATopt
  set ::FATpo 0
  }

 if {$::PROCNTopt == -1.0} {
  .nut.po.pane.optframe.prot_s configure -state disabled -textvariable ::PROCNTdv
  set ::PROCNTpo -1
  } elseif {$::PROCNTopt == 0.0} {
  .nut.po.pane.optframe.prot_s configure -state disabled -textvariable ::PROCNTdv
  set ::PROCNTpo 2
  } else {
  .nut.po.pane.optframe.prot_s configure -state normal -textvariable ::PROCNTopt
  set ::PROCNTpo 0
  }

 if {$::CHO_NONFIBopt == -1.0} {
  .nut.po.pane.optframe.nfc_s configure -state disabled -textvariable ::CHO_NONFIBdv
  set ::CHO_NONFIBpo -1
  .nut.po.pane.optframe.fat_cb2 configure -text "Balance of Calories"
  } elseif {$::CHO_NONFIBopt == 0.0} {
  .nut.po.pane.optframe.nfc_s configure -state disabled -textvariable ::CHO_NONFIBdv
  set ::CHO_NONFIBpo 2
  .nut.po.pane.optframe.fat_cb2 configure -text "DV 30% of Calories"
  } else {
  .nut.po.pane.optframe.nfc_s configure -state normal -textvariable ::CHO_NONFIBopt
  set ::CHO_NONFIBpo 0
  .nut.po.pane.optframe.fat_cb2 configure -text "Balance of Calories"
  }
 if {$::ENERC_KCALopt == -1.0} {
  .nut.po.pane.optframe.fat_cb2 configure -text "DV 30% of Calories"
  .nut.po.pane.optframe.nfc_cb2 configure -text "DV 60% of Calories"
  }


 if {$::FIBTGopt == -1.0} {
  .nut.po.pane.optframe.fiber_s configure -state disabled -textvariable ::FIBTGdv
  set ::FIBTGpo -1
  } elseif {$::FIBTGopt == 0.0} {
  .nut.po.pane.optframe.fiber_s configure -state disabled -textvariable ::FIBTGdv
  set ::FIBTGpo 2
  } else {
  .nut.po.pane.optframe.fiber_s configure -state normal -textvariable ::FIBTGopt
  set ::FIBTGpo 0
  }

 if {$::FASATopt == -1.0} {
  .nut.po.pane.optframe.sat_s configure -state disabled -textvariable ::FASATdv
  set ::FASATpo -1
  } elseif {$::FASATopt == 0.0} {
  .nut.po.pane.optframe.sat_s configure -state disabled -textvariable ::FASATdv
  set ::FASATpo 2
  } else {
  .nut.po.pane.optframe.sat_s configure -state normal -textvariable ::FASATopt
  set ::FASATpo 0
  }

 if {$::FAPUopt == -1.0} {
  .nut.po.pane.optframe.efa_s configure -state disabled -textvariable ::FAPUdv
  set ::FAPUpo -1
  } elseif {$::FAPUopt == 0.0} {
  .nut.po.pane.optframe.efa_s configure -state disabled -textvariable ::FAPUdv
  set ::FAPUpo 2
  } else {
  .nut.po.pane.optframe.efa_s configure -state normal -textvariable ::FAPUopt
  set ::FAPUpo 0
  }

 if {$::FAPU1 == 0.0} {
  .nut.po.pane.optframe.fish_s set {50 / 50}
  } else {
  set n6 [expr {int($::FAPU1)}]
  .nut.po.pane.optframe.fish_s set "$n6 / [expr {100 - $n6}]"
  }

 }

#end InitializePersonalOptions
}

set ChangePersonalOptions {

proc ChangePersonalOptions {nuttag args} {
 set var "::${nuttag}po"
 upvar #0 $var povar

 if {$nuttag == "ENERC_KCAL"} {
  if {$povar == 2} {
   db eval {update options set autocal = 2}
   set ::ENERC_KCALopt $::ENERC_KCALdv
   .nut.po.pane.optframe.cal_s configure -state normal -textvariable ::ENERC_KCALopt
   .nut.po.pane.optframe.nfc_cb2 configure -text "Balance of Calories"
   .nut.po.pane.optframe.nfc_cb2 invoke
   } elseif {$povar == 0} {
   db eval {update options set autocal = 0}
   set ::ENERC_KCALopt $::ENERC_KCALdv
   .nut.po.pane.optframe.cal_s configure -state normal -textvariable ::ENERC_KCALopt
   .nut.po.pane.optframe.nfc_cb2 configure -text "Balance of Calories"
   .nut.po.pane.optframe.nfc_cb2 invoke
   } else {
   db eval {update options set autocal = 0}
   .nut.po.pane.optframe.cal_s configure -state disabled -textvariable ::ENERC_KCALdv
   set ::ENERC_KCALopt -1
   .nut.po.pane.optframe.fat_cb2 configure -text "DV 30% of Calories"
   .nut.po.pane.optframe.nfc_cb2 configure -text "DV 60% of Calories"
   }
  RefreshWeightLog
  } elseif {$nuttag == "FAT"} {
  if {$povar == 2} {
   set ::FATopt 0.0
   .nut.po.pane.optframe.fat_s configure -state disabled -textvariable ::FATdv
   } elseif {$povar == 0} {
   set ::FATopt $::FATdv
   .nut.po.pane.optframe.fat_s configure -state normal -textvariable ::FATopt
   if {$::CHO_NONFIBopt != 0.0 && $::ENERC_KCALopt >= 0.0} {
    .nut.po.pane.optframe.nfc_cb2 invoke
    }
   } else {
   .nut.po.pane.optframe.fat_s configure -state disabled -textvariable ::FATdv
   set ::FATopt -1
   if {$::CHO_NONFIBopt != 0.0 && $::ENERC_KCALopt >= 0.0} {
    .nut.po.pane.optframe.nfc_cb2 invoke
    }
   }
  } elseif {$nuttag == "PROCNT"} {
  if {$povar == 2} {
   set ::PROCNTopt 0.0
   .nut.po.pane.optframe.prot_s configure -state disabled -textvariable ::PROCNTdv
   } elseif {$povar == 0} {
   set ::PROCNTopt $::PROCNTdv
   .nut.po.pane.optframe.prot_s configure -state normal -textvariable ::PROCNTopt
   } else {
   .nut.po.pane.optframe.prot_s configure -state disabled -textvariable ::PROCNTdv
   set ::PROCNTopt -1
   }
  } elseif {$nuttag == "CHO_NONFIB"} {
  if {$povar == 2} {
   set ::CHO_NONFIBopt 0.0
   .nut.po.pane.optframe.nfc_s configure -state disabled -textvariable ::CHO_NONFIBdv
   .nut.po.pane.optframe.fat_cb2 configure -text "DV 30% of Calories"
   } elseif {$povar == 0} {
   set ::CHO_NONFIBopt $::CHO_NONFIBdv
   .nut.po.pane.optframe.nfc_s configure -state normal -textvariable ::CHO_NONFIBopt
   .nut.po.pane.optframe.fat_cb2 configure -text "Balance of Calories"
   if {$::FATopt != 0.0 && $::ENERC_KCALopt >= 0.0} {
    .nut.po.pane.optframe.fat_cb2 invoke
    }
   } else {
   .nut.po.pane.optframe.nfc_s configure -state disabled -textvariable ::CHO_NONFIBdv
   set ::CHO_NONFIBopt -1
   .nut.po.pane.optframe.fat_cb2 configure -text "Balance of Calories"
   if {$::FATopt != 0.0 && $::ENERC_KCALopt >= 0.0} {
    .nut.po.pane.optframe.fat_cb2 invoke
    }
   }
  } elseif {$nuttag == "FIBTG"} {
  if {$povar == 2} {
   set ::FIBTGopt 0.0
   .nut.po.pane.optframe.fiber_s configure -state disabled -textvariable ::FIBTGdv
   } elseif {$povar == 0} {
   set ::FIBTGopt $::FIBTGdv
   .nut.po.pane.optframe.fiber_s configure -state normal -textvariable ::FIBTGopt
   } else {
   .nut.po.pane.optframe.fiber_s configure -state disabled -textvariable ::FIBTGdv
   set ::FIBTGopt -1
   }
  } elseif {$nuttag == "FASAT"} {
  if {$povar == 2} {
   set ::FASATopt 0.0
   .nut.po.pane.optframe.sat_s configure -state disabled -textvariable ::FASATdv
   } elseif {$povar == 0} {
   set ::FASATopt $::FASATdv
   .nut.po.pane.optframe.sat_s configure -state normal -textvariable ::FASATopt
   } else {
   .nut.po.pane.optframe.sat_s configure -state disabled -textvariable ::FASATdv
   set ::FASATopt -1
   }
  } elseif {$nuttag == "FAPU"} {
  if {$povar == 2} {
   set ::FAPUopt 0.0
   .nut.po.pane.optframe.efa_s configure -state disabled -textvariable ::FAPUdv
   } elseif {$povar == 0} {
   set ::FAPUopt $::FAPUdv
   .nut.po.pane.optframe.efa_s configure -state normal -textvariable ::FAPUopt
   } else {
   .nut.po.pane.optframe.efa_s configure -state disabled -textvariable ::FAPUdv
   set ::FAPUopt -1
   }
  } elseif {$nuttag == "FAPU1"} {
  set ::FAPU1 [string range $::FAPU1po 0 1]
  db eval {update options set FAPU1 = $::FAPU1}
  auto_cal
  } else {
  if {$::vitminpo == 2} {
   set ::${nuttag}opt 0.0
   .nut.po.pane.optframe.vite_s configure -state disabled -textvariable ::${nuttag}dv
   } elseif {$::vitminpo == 0} {
   set ::${nuttag}opt [db eval {select dv_default from nutr_def where Tagname = $nuttag}]
   .nut.po.pane.optframe.vite_s configure -state normal -textvariable ::${nuttag}opt
   } else {
   .nut.po.pane.optframe.vite_s configure -state disabled -textvariable ::${nuttag}dv
   set ::${nuttag}opt -1
   }
  }
 }

#end ChangePersonalOptions
}

set RefreshWeightLog {

proc RefreshWeightLog {args} {
 db eval {select *, "::weightslope" - "::fatslope" as leanslope from weightslope, fatslope} { }
 db eval {select autocal, wlpolarity, wltweak from options} { }
 if {$autocal == 2} {
  if {!$::ALTGUI} {
   grid remove .nut.po.pane.wlogframe.clear
   } else {
   place forget .nut.po.pane.wlogframe.clear
   }
  } else {
  set counter [db eval {select count(*) from wlog where cleardate is null}]
  if {$counter > 1} {
   if {!$::ALTGUI} {
    grid .nut.po.pane.wlogframe.clear
    } else {
    place .nut.po.pane.wlogframe.clear -relx 0.3 -rely 0.79 -relheight 0.06 -relwidth 0.63
    }
   } else {
    if {!$::ALTGUI} {
    grid remove .nut.po.pane.wlogframe.clear
    } else {
    place forget .nut.po.pane.wlogframe.clear
    }
   }
  }
 set measurements_not_entered [db eval { select abs(max(cast (julianday(substr(wldate,1,4) || '-' || substr(wldate,5,2) || '-' || substr(wldate,7,2)) - julianday('now', 'localtime') as int))) from wlog where cleardate is null } ]
 if {$measurements_not_entered == 0} {
  .nut.po.pane.wlogframe.accept configure -state disabled
  .nut.po.pane.wlogframe.weight_s configure -state disabled
  .nut.po.pane.wlogframe.bf_s configure -state disabled
  } else {
.nut.po.pane.wlogframe.accept configure -state normal
  .nut.po.pane.wlogframe.weight_s configure -state normal
  .nut.po.pane.wlogframe.bf_s configure -state normal
  }

 if {$::weightyintercept != 0.0} {
  set ::currentbfp [expr {round(1000.0 * $::fatyintercept / $::weightyintercept) / 10.0}]
  } else {
  set ::currentbfp 0.0
  }
 set ::span [db eval { select abs(min(cast (julianday(substr(wldate,1,4) || '-' || substr(wldate,5,2) || '-' || substr(wldate,7,2)) - julianday('now', 'localtime') as int))) from wlog where cleardate is null } ]
 set CASmode Bulking
 if {($leanslope > 0.0 && $::fatslope > 0.0) || ($wlpolarity == 0 && $::fatslope > 0.0)} {set CASmode Cutting}
 set datapoints [db eval {select count(*) from wlog where cleardate is null}]
 if {$datapoints > 1} {
  set ::wlogsummary "Based on the trend of $datapoints data points so far...\n\nPredicted lean mass today = [expr {round(10.0 * ($::weightyintercept - $::fatyintercept)) / 10.0 }]\n\nPredicted fat mass today = $::fatyintercept\n\nIf the predictions are correct, you [expr {$leanslope >= 0.0 ? "gained" : "lost"}] [expr {abs(round($leanslope * $::span * 1000.0) / 1000.0)}] lean mass over $::span [expr {$::span == 1 ? "day" : "days"}] and [expr {$::fatslope >= 0.0 ? "gained" : "lost"}] [expr {abs(round($::fatslope * $::span * 1000.0) / 1000.0)}] fat mass."
  } else { set ::wlogsummary "" }
 if {$datapoints == 1} {
  db eval {select weight as "::weightyintercept", bodyfat as "::currentbfp" from wlog where cleardate is null} { }
  set ::wlogsummary "$datapoints data [expr {$datapoints == 1 ? "point" : "points"}] so far..."
  }
 }

#end RefreshWeightLog
}

set ClearWeightLog {

proc ClearWeightLog {args} {

db eval {select * from wlog order by wldate desc limit 1} { }
db eval {update wlog set cleardate = $wldate where cleardate is null}
db eval {insert into wlog values ($weight, $bodyfat, $wldate, NULL)}
RefreshWeightLog
}

#end ClearWeightLog
}

set AcceptNewMeasurements {

proc AcceptNewMeasurements {args} {

set today [db eval {select strftime('%Y%m%d', 'now', 'localtime')}]
db eval {insert into wlog values ( $::weightyintercept, $::currentbfp, $today, NULL)}
RefreshWeightLog
db eval {select autocal, "::weightslope", "::fatslope", "::weightslope" - "::fatslope" as leanslope, "::fatyintercept" from options, weightslope, fatslope} { }

if {$autocal == 2} {
 if {$leanslope > 0.0 && $::fatslope > 0.0} {
  set ::ENERC_KCALopt [expr {$::ENERC_KCALopt - 20.0}]
  db eval {update wlog set cleardate = $today where cleardate is NULL}
  set ::currentbfp [expr {round(1000.0 * $::fatyintercept / $::weightyintercept) / 10.0}]
  db eval {insert into wlog values ( $::weightyintercept, $::currentbfp, $today, NULL)}
  auto_cal
  } elseif {$leanslope < 0.0 && $::fatslope < 0.0} {
  set ::ENERC_KCALopt [expr {$::ENERC_KCALopt + 20.0}]
  db eval {update wlog set cleardate = $today where cleardate is NULL}
  set ::currentbfp [expr {round(1000.0 * $::fatyintercept / $::weightyintercept) / 10.0}]
  db eval {insert into wlog values ( $::weightyintercept, $::currentbfp, $today, NULL)}
  auto_cal
  } elseif {$::fatslope > 0.0} {
  db eval {update wlog set cleardate = $today where cleardate is NULL}
  set ::currentbfp [expr {round(1000.0 * $::fatyintercept / $::weightyintercept) / 10.0}]
  db eval {insert into wlog values ( $::weightyintercept, $::currentbfp, $today, NULL)}
  }
 }
RefreshWeightLog
}

#end AcceptNewMeasurements
}

set RefreshMealfoodQuantities {

proc RefreshMealfoodQuantities {args} {
 db eval {drop view if exists pcf}
 if {[db eval "select count(*) from mealfoods where meal_date = [expr {$::currentmeal / 100}] and meal = [expr {$::currentmeal % 100}]"] > 0} {
  set this_meal_date [expr {$::currentmeal / 100}]
  set this_meal [expr {$::currentmeal % 100}]
  set selectstring "select * from ("
  set viewstring "drop view if exists pcf; create temp view pcf as select * from ("
  db eval {select NDB_No from mealfoods where meal_date = $this_meal_date and meal = $this_meal} {
   if {$::GRAMSopt} {
    append selectstring "(select cast (round(mhectograms * 100.0) as integer) as \"::${NDB_No}\" from mealfoods where NDB_No = $NDB_No and meal_date = $this_meal_date and meal = $this_meal), "
    } else {
    append selectstring "(select round(mhectograms / 0.28349523,1) as \"::${NDB_No}\" from mealfoods where NDB_No = $NDB_No and meal_date = $this_meal_date and meal = $this_meal), "
    }
   if {[lindex $::MealfoodPCF [lsearch $::MealfoodStatus $NDB_No]] != "NULL"} {
    if {$::GRAMSopt} {
     append viewstring "(select cast (round(mhectograms * 100.0) as integer) as \"::${NDB_No}\" from mealfoods where NDB_No = $NDB_No and meal_date = $this_meal_date and meal = $this_meal), "
     } else {
     append viewstring "(select round(mhectograms / 0.28349523,1) as \"::${NDB_No}\" from mealfoods where NDB_No = $NDB_No and meal_date = $this_meal_date and meal = $this_meal), "
     }
    } else {
    append viewstring "(select NULL), "
    }
   }
  set selectstring [string trimright $selectstring " "]
  set selectstring [string trimright $selectstring ","]
  append selectstring ")"
  db eval $selectstring { }
  set viewstring [string trimright $viewstring " "]
  set viewstring [string trimright $viewstring ","]
  append viewstring ")"
  db eval $viewstring { }
  }
 }

#end RefreshMealfoodQuantities
}

set MealfoodDelete {

proc MealfoodDelete {seq ndb dbdelete} {

 ${::rmMenu}.menu tag configure foodwidget${seq} -elide 1
 if {[lsearch -exact $::MealfoodStatus $ndb] != $seq} {return}
 set prevtag [lindex $::MealfoodPCF $seq]
 if {$prevtag != "NULL"} {
  trace remove variable ::${prevtag}dv write "PCF ${seq} ${ndb}"
  trace remove variable ::${prevtag}rm write "PCF ${seq} ${ndb}"
  set ::MealfoodPCF [lreplace $::MealfoodPCF $seq $seq "NULL"]
  RefreshMealfoodQuantities
  }
 ::trace remove variable ::PCFchoice${ndb} write "setPCF ${seq} ${ndb}"
 unset ::PCFchoice${ndb} ::${ndb}
 set ::MealfoodStatus [lreplace $::MealfoodStatus $seq $seq Hidden]
 ${::rmMenu}.menu.foodPCF${seq} configure  -style rm.TCombobox
 ${::rmMenu}.menu.foodspin${seq} configure  -state readonly
 set lastone [expr {$::MealfoodSequence - 1}]
 if {[lindex $::MealfoodStatus $lastone] == "Hidden"} {
  set ::MealfoodStatus [lreplace $::MealfoodStatus $lastone $lastone Available]
  }
 while {[lindex $::MealfoodStatus $lastone] == "Available" && $lastone > 0} {
  incr lastone -1
  if {[lindex $::MealfoodStatus $lastone] == "Hidden"} {
   set ::MealfoodStatus [lreplace $::MealfoodStatus $lastone $lastone Available]
   }
  }
 if {$dbdelete} {
  db eval {delete from mealfoods where meal_date = $::currentmeal / 100 and meal = $::currentmeal % 100 and NDB_No = $ndb}
  if {[db eval {select count(*) from mealfoods where meal_date = $::currentmeal / 100 and meal = $::currentmeal % 100}] > 0} {
   db eval {select * from rm} { }
   } else {
   db eval {select * from rm_zero} { }
   }
  after 300 update_am
  }

 }

#end MealfoodDelete
}

set MealfoodSetWeight {

proc MealfoodSetWeight {newval ndb ndbVarName args} {

if {![string is double -strict $newval]} {
 set newval 0.0
 {*}"set ::${ndb} $newval"
 } else {
 after 300 [list MealfoodSetWeightLater $newval $ndb $ndbVarName]
 }

}

#end MealfoodSetWeight
}

set MealfoodSetWeightLater {

proc MealfoodSetWeightLater {newval ndb ndbVarName} {

 upvar 0 $ndbVarName ndbvar
 if {$newval == $ndbvar} {
  if {$::GRAMSopt} {
   set whectograms [expr {$ndbvar / 100.0}]
   } else {
   set whectograms [expr {$ndbvar * 0.28349523}]
   }
  db eval {update mealfoods set mhectograms = $whectograms where NDB_No = $ndb and meal_date = $::currentmeal / 100 and meal = $::currentmeal % 100}
  db eval {select * from rm} { }
  update_am
  }

 }

#end MealfoodSetWeightLater
}

set MealfoodWidget {

proc MealfoodWidget {Shrt_Desc NDB_No} {

 set noThereThere [lsearch -exact $::MealfoodStatus $NDB_No]
 if {$noThereThere > -1} {return $noThereThere}
 if {$noThereThere == -1} {
  set seq ${::MealfoodSequence}
  incr ::MealfoodSequence
  lappend ::MealfoodStatus $NDB_No
  lappend ::MealfoodPCF "NULL"
  lappend ::MealfoodPCFfactor 0.0
  ttk::button ${::rmMenu}.menu.foodbutton${seq} -text $Shrt_Desc -command [list rm2vf $seq] -width 46 -style vf.TButton
  tk::spinbox ${::rmMenu}.menu.foodspin${seq} -textvariable ::${NDB_No} -width 5 -justify right -from -9999 -to 9999 -increment 1 -cursor [. cget -cursor] -buttonbackground "#FF9428" -disabledforeground "#000000" -readonlybackground "#FFE3CA" -state readonly -command "MealfoodSetWeight %s ${NDB_No} ::${NDB_No}"
  if {! $::GRAMSopt} {
   ${::rmMenu}.menu.foodspin${seq} configure -from -999.9 -to 999.9 -increment 0.1
   }
  ttk::combobox ${::rmMenu}.menu.foodPCF${seq} -textvariable ::PCFchoice${NDB_No} -state readonly -values $::PCFchoices -style rm.TCombobox -width 20 -justify center
  ttk::button ${::rmMenu}.menu.fooddel${seq} -text "DEL" -width 3 -command "MealfoodDelete $seq $NDB_No 1" -style vf.TButton
  ${::rmMenu}.menu configure -state normal
  ${::rmMenu}.menu window create end -window ${::rmMenu}.menu.foodbutton${seq} -pady $::magnify -padx [expr {$::magnify * 3}]
  ${::rmMenu}.menu window create end -window ${::rmMenu}.menu.foodspin${seq} -pady $::magnify -padx [expr {$::magnify * 3}]
  ${::rmMenu}.menu window create end -window ${::rmMenu}.menu.foodPCF${seq} -pady $::magnify -padx [expr {$::magnify * 3}]
  ${::rmMenu}.menu window create end -window ${::rmMenu}.menu.fooddel${seq} -pady $::magnify -padx [expr {$::magnify * 3}]
  ${::rmMenu}.menu insert end "\n"
  set startrange [expr {$seq + 1.0}]
  set endrange [expr {$seq + 2.0}]
  ${::rmMenu}.menu tag add foodwidget${seq} $startrange $endrange
  ${::rmMenu}.menu tag configure foodwidget${seq} -justify center
  ${::rmMenu}.menu configure -state disabled
  } else {
  set seq [lsearch -exact $::MealfoodStatus Available]
  set ::MealfoodStatus [lreplace $::MealfoodStatus $seq $seq $NDB_No]
  ${::rmMenu}.menu.foodbutton${seq} configure -text $Shrt_Desc
  ${::rmMenu}.menu.foodspin${seq} configure -textvariable ::${NDB_No} -command "MealfoodSetWeight %s ${NDB_No} ::${NDB_No}"
  if {! $::GRAMSopt} {
   ${::rmMenu}.menu.foodspin${seq} configure -from -999.9 -to 999.9 -increment 0.1
   } else {
   ${::rmMenu}.menu.foodspin${seq} configure -from -9999 -to 9999 -increment 1
   }
  ${::rmMenu}.menu.foodPCF${seq} configure -textvariable ::PCFchoice${NDB_No}
  ${::rmMenu}.menu.fooddel${seq} configure -command "MealfoodDelete $seq $NDB_No 1"
  ${::rmMenu}.menu tag configure foodwidget${seq} -elide 0
  }
 {*}"set ::PCFchoice${NDB_No} {No Auto Portion Control}"
 ::trace add variable ::PCFchoice${NDB_No} write "setPCF ${seq} ${NDB_No}"
 ${::rmMenu}.menu.foodspin${seq} configure -command "MealfoodSetWeight %s ${NDB_No} ::${NDB_No}"
 set ::MealfoodPCF [lreplace $::MealfoodPCF $seq $seq "NULL"]
 if {$::mealcount == 0} {
  set ::mealcount 1
  set ::meals_to_analyze_am 1
  }
 return $seq
 }

#end MealfoodWidget
}

set NBWamTabChange {

proc NBWamTabChange {} {

 uplevel #0 {
  set tabindex [.nut.am.nbw index [.nut.am.nbw select]]
  if {$tabindex == 0} {.nut.am.herelabel configure -text "Here are \"Daily Value\" average percentages for your previous "} else {.nut.am.herelabel configure -text "Here are average daily nutrient levels for your previous "}
  if {$tabindex != [.nut.rm.nbw index [.nut.rm.nbw select]]} {.nut.rm.nbw select .nut.rm.nbw.screen${tabindex}}
  if {$tabindex != [.nut.vf.nbw index [.nut.vf.nbw select]]} {.nut.vf.nbw select .nut.vf.nbw.screen${tabindex}}
  if {$tabindex != [.nut.ar.nbw index [.nut.ar.nbw select]]} {.nut.ar.nbw select .nut.ar.nbw.screen${tabindex}}
  }

 }

#end NBWamTabChange
}

set NBWrmTabChange {

proc NBWrmTabChange {} {

 uplevel #0 {
  set tabindex [.nut.rm.nbw index [.nut.rm.nbw select]]
  if {$tabindex != [.nut.am.nbw index [.nut.am.nbw select]]} {.nut.am.nbw select .nut.am.nbw.screen${tabindex}}
  if {$tabindex != [.nut.vf.nbw index [.nut.vf.nbw select]]} {.nut.vf.nbw select .nut.vf.nbw.screen${tabindex}}
  if {$tabindex != [.nut.ar.nbw index [.nut.ar.nbw select]]} {.nut.ar.nbw select .nut.ar.nbw.screen${tabindex}}
  }

 }

#end NBWrmTabChange
}

set NBWvfTabChange {

proc NBWvfTabChange {} {

 uplevel #0 {
  set tabindex [.nut.vf.nbw index [.nut.vf.nbw select]]
  if {$tabindex != [.nut.am.nbw index [.nut.am.nbw select]]} {.nut.am.nbw select .nut.am.nbw.screen${tabindex}}
  if {$tabindex != [.nut.rm.nbw index [.nut.rm.nbw select]]} {.nut.rm.nbw select .nut.rm.nbw.screen${tabindex}}
  if {$tabindex != [.nut.ar.nbw index [.nut.ar.nbw select]]} {.nut.ar.nbw select .nut.ar.nbw.screen${tabindex}}
  }

 }

#end NBWvfTabChange
}

set NBWarTabChange {

proc NBWarTabChange {} {

 uplevel #0 {
  set tabindex [.nut.ar.nbw index [.nut.ar.nbw select]]
  if {$tabindex != [.nut.am.nbw index [.nut.am.nbw select]]} {.nut.am.nbw select .nut.am.nbw.screen${tabindex}}
  if {$tabindex != [.nut.rm.nbw index [.nut.rm.nbw select]]} {.nut.rm.nbw select .nut.rm.nbw.screen${tabindex}}
  if {$tabindex != [.nut.vf.nbw index [.nut.vf.nbw select]]} {.nut.vf.nbw select .nut.vf.nbw.screen${tabindex}}
  }

 }

#end NBWarTabChange
}

set NewStoryLater {

proc NewStoryLater {storynut screen args} {
 after idle [list NewStory $storynut $screen]
 }

#end NewStoryLater
}

set NewStory {

proc NewStory {storynut screen} {

 set ::StoryIsStale 0

 if {$storynut != "NULL"} {
  set ::oldstorynut $storynut
  set ::oldstoryscreen $screen
  append storynut "b"
  upvar #0 $storynut ::newstory
  db eval {select Tagname, Units from nutr_def where NutrDesc = $::newstory} { }
  .nut tab .nut.ts -text [list The {*}$::newstory Story]
  .nut.ts.frgraph configure -text [list Graph of daily {*}$::newstory for this analysis period]
  .nut.ts.frgraph.canvas delete all
  .nut add .nut.ts
  .nut select .nut.ts
  .nut.ts.frranking.ranking delete [.nut.ts.frranking.ranking children {}]
  } else {
  db eval {select Tagname, Units from nutr_def where NutrDesc = $::newstory} { }
  .nut.ts.frranking.ranking delete [.nut.ts.frranking.ranking children {}]
  }

 set FdGrp_Cd 0
 db eval {select FdGrp_Cd from fd_group where FdGrp_Desc = $::fdgroupchoice} { }

 foreach col {food field1 field2} {
  .nut.ts.frranking.ranking heading $col -text ""
  }
 set savecursor [.nut.ts cget -cursor]
 .nut.ts configure -cursor watch
.nut.ts.frgraph.canvas configure -width [winfo width .nut] -height [expr {2 + [winfo height .nut] / 4}]
 update

 if {$::rankchoice == "Foods Ranked per 100 Grams"} {
  if {$FdGrp_Cd == 0} {
   set storydata [db eval "select NDB_No, 100, Shrt_Desc, case when $::GRAMSopt = 1 then monoright('100 g',10) else monoright('3.5 oz',10) end, monoright(round($Tagname,1) || ' $Units',14) from food_des where $Tagname > 0.0 order by $Tagname desc"]
   } else {
   set storydata [db eval "select NDB_No, 100, Shrt_Desc, case when $::GRAMSopt = 1 then monoright('100 g',10) else monoright('3.5 oz',10) end, monoright(round($Tagname,1) || ' $Units',14) from food_des where $Tagname > 0.0 and FdGrp_Cd = $FdGrp_Cd order by $Tagname desc"]
   }
  } elseif {$::rankchoice == "Foods Ranked per 100 Calories"  && $Tagname != "ENERC_KCAL" && $Tagname != "ENERC_KJ"} {
  if {$FdGrp_Cd == 0} {
   set storydata [db eval "select NDB_No, cast (round(10000.0 / ENERC_KCAL) as int), Shrt_Desc, case when $::GRAMSopt = 1 then monoright(cast (round(10000.0 / ENERC_KCAL) as int) || ' g',10) else monoright(round(10000.0 / ENERC_KCAL / 28.349523,1) || ' oz',10) end, monoright(round($Tagname * 100.0 / ENERC_KCAL,1) || ' $Units',14) from food_des where $Tagname * 100.0 / ENERC_KCAL > 0.0 order by $Tagname * 100.0 / ENERC_KCAL desc"]
   } else {
   set storydata [db eval "select NDB_No, cast (round(10000.0 / ENERC_KCAL) as int), Shrt_Desc, case when $::GRAMSopt = 1 then monoright(cast (round(10000.0 / ENERC_KCAL) as int) || ' g',10) else monoright(round(10000.0 / ENERC_KCAL / 28.349523,1) || ' oz',10) end, monoright(round($Tagname * 100.0 / ENERC_KCAL,1) || ' $Units',14) from food_des where $Tagname * 100.0 / ENERC_KCAL > 0.0 and FdGrp_Cd = $FdGrp_Cd order by $Tagname * 100.0 / ENERC_KCAL desc"]
   }
  } elseif {$::rankchoice == "Foods Ranked per Daily Recorded Meals"} {
  if {$FdGrp_Cd == 0} {
   set storydata [db eval "select NDB_No, sumgrams, Shrt_Desc, case when $::GRAMSopt = 1 then monoright(cast (round(sumgrams) as int) || ' g',10) else monoright(round(sumgrams / 28.349523,1) || ' oz',10) end, monoright(round(sumnut,1) || ' $Units',14) from (select mf.meal_date * 100 + mf.meal as meal_id, mf.NDB_No, fd.Shrt_Desc, sum(mf.mhectograms * $Tagname * (select cast (meals_per_day as real) from options) / (select cast (defanal_am as real) from options)) as sumnut, sum(mf.mhectograms * 100 * (select cast (meals_per_day as real) from options) / (select cast (defanal_am as real) from options)) as sumgrams from mealfoods mf join food_des fd on mf.NDB_No = fd.NDB_No and $Tagname > 0.0 and meal_id in (select meal_id from meals order by meal_id desc limit (select defanal_am from options)) group by mf.NDB_No order by sumnut desc)"]
   } else {
   set storydata [db eval "select NDB_No, sumgrams, Shrt_Desc, case when $::GRAMSopt = 1 then monoright(cast (round(sumgrams) as int) || ' g',10) else monoright(round(sumgrams / 28.349523,1) || ' oz',10) end, monoright(round(sumnut,1) || ' $Units',14) from (select mf.meal_date * 100 + mf.meal as meal_id, mf.NDB_No, fd.Shrt_Desc, sum(mf.mhectograms * $Tagname * (select cast (meals_per_day as real) from options) / (select cast (defanal_am as real) from options)) as sumnut, sum(mf.mhectograms * 100 * (select cast (meals_per_day as real) from options) / (select cast (defanal_am as real) from options)) as sumgrams from mealfoods mf join food_des fd on mf.NDB_No = fd.NDB_No and $Tagname > 0.0 and fd.FdGrp_Cd = $FdGrp_Cd and meal_id in (select meal_id from meals order by meal_id desc limit (select defanal_am from options)) group by mf.NDB_No order by sumnut desc)"]
   }
  } elseif {$::rankchoice == "Foods Ranked per one approximate Serving"} {
  if {$FdGrp_Cd == 0} {
   set storydata [db eval "select NDB_No, cast (round(WATER) as int), Shrt_Desc, case when $::GRAMSopt = 1 then monoright(cast (round(WATER) as int) || ' g',10) else monoright(round(WATER / 28.349523,1) || ' oz',10) end, monoright(round($Tagname / 100.0 * WATER,1) || ' $Units',14) from food_des where $Tagname / 100.0 * WATER > 0.0 order by $Tagname / 100.0 * WATER desc"]
   } else {
   set storydata [db eval "select NDB_No, cast (round(WATER) as int), Shrt_Desc, case when $::GRAMSopt = 1 then monoright(cast (round(WATER) as int) || ' g',10) else monoright(round(WATER / 28.349523,1) || ' oz',10) end, monoright(round($Tagname / 100.0 * WATER,1) || ' $Units',14) from food_des where $Tagname / 100.0 * WATER > 0.0 and FdGrp_Cd = $FdGrp_Cd order by $Tagname / 100.0 * WATER desc"]
   }
  }
 if {![info exists storydata]} {set storydata " "}
 foreach col {food field1 field2} name [list Food Quantity $::newstory] {
  .nut.ts.frranking.ranking heading $col -text $name
  .nut.ts.frranking.ranking column $col -width [font measure TkFixedFont $name]
  }
 foreach {ndb grams food field1 field2} $storydata {
  .nut.ts.frranking.ranking insert {} end -id [list $ndb $grams] -values [list $food $field1 $field2]
  foreach col {food field1 field2} {
   set len [font measure TkFixedFont "[set $col]  "]
   }
  }
 .nut.ts configure -cursor $savecursor
 set width [winfo width .nut.ts.frgraph.canvas]
 set height [expr {[winfo height .nut.ts.frgraph.canvas] - 1}]
 .nut.ts.frgraph.canvas delete all


 catch {.nut.ts.frgraph.canvas create line [db eval " select $width * (strftime('%J', substr(meal_id,1,4) || '-' || substr(meal_id,5,2) || '-' || substr(meal_id,7,2)) - (select min(strftime('%J', substr(meal_id,1,4) || '-' || substr(meal_id,5,2) || '-' || substr(meal_id,7,2))) from meals where meal_id >= $::FIRSTMEALts)) / (select max((strftime('%J', substr(meal_id,1,4) || '-' || substr(meal_id,5,2) || '-' || substr(meal_id,7,2)) - (select min(strftime('%J', substr(meal_id,1,4) || '-' || substr(meal_id,5,2) || '-' || substr(meal_id,7,2))) from meals where meal_id >= $::FIRSTMEALts))) from meals where meal_id >= $::FIRSTMEALts) as x, $height - (($height-2) * total($Tagname) / (select max(y) from (select (strftime('%J', substr(meal_id,1,4) || '-' || substr(meal_id,5,2) || '-' || substr(meal_id,7,2)) - (select min(strftime('%J', substr(meal_id,1,4) || '-' || substr(meal_id,5,2) || '-' || substr(meal_id,7,2))) from meals where meal_id >= $::FIRSTMEALts)) / (select max((strftime('%J', substr(meal_id,1,4) || '-' || substr(meal_id,5,2) || '-' || substr(meal_id,7,2)) - (select min(strftime('%J', substr(meal_id,1,4) || '-' || substr(meal_id,5,2) || '-' || substr(meal_id,7,2))) from meals where meal_id >= $::FIRSTMEALts))) from meals where meal_id >= $::FIRSTMEALts) as x, total($Tagname) as y from meals where meal_id >= $::FIRSTMEALts group by x))) as y from meals where meal_id >= $::FIRSTMEALts group by x "] -width [expr {$::magnify * 2}] -fill "#FF7F00"}
 }

#end NewStory
}

set NutTabChange {

proc NutTabChange {} {

 uplevel #0 {
  set pathid [.nut select]
  if { $pathid == ".nut.vf" } {
   } elseif { $pathid == ".nut.am" } {
   } elseif { $pathid == ".nut.rm" } {
   } elseif { $pathid == ".nut.ts" } {
   if {$::StoryIsStale} {
    NewStory $::oldstorynut $::oldstoryscreen
    }
   } elseif { $pathid == ".nut.po" } {
   RefreshWeightLog
   } elseif { $pathid == ".nut.qn" } {
   rename unknown ""
   rename _original_unknown unknown
   destroy .
   }
  }

 }

#end NutTabChange
}

set OunceChangevf {

proc OunceChangevf {args} {

 uplevel #0 {
  if {![string is double -strict $ouncesvf]} { return }
  set gramsvf [expr {$ouncesvf * $ounce2gram}]
  }

 }

#end OunceChangevf
}

set PCF {

proc PCF {seq ndb args} {

 if {! $::BubbleMachineStatus} {
  set ::BubbleMachineStatus 1
  db eval {BEGIN}
  if {!$::ALTGUI} {
   grid remove .nut.rm.fsentry
   grid .nut.rm.bubblemachine
   } else {
   place forget .nut.rm.fsentry
   place .nut.rm.bubblemachine -relx 0.4 -rely 0.19629629  -relheight 0.044444444 -relwidth 0.45
   }
  .nut.rm.bubblemachine start
  set ::lastbubble [after 500 TurnOffTheBubbleMachine]
  } else {
  after cancel $::lastbubble
  set ::lastbubble [after 500 TurnOffTheBubbleMachine]
  }
 set ndbName "::${ndb}"
 set dvName "::[lindex $::MealfoodPCF $seq]dv"
 if {$dvName == "::NULLdv"} {return}
 set rmName "::[lindex $::MealfoodPCF $seq]rm"
 upvar 0 $ndbName ndbvar $dvName dvvar $rmName rmvar
 set factor [lindex $::MealfoodPCFfactor $seq]
 set ::nutvalchange [expr {($dvvar - $rmvar) * 100.0 / $dvvar}]
 if {$::nutvalchange < 0.2 && $::nutvalchange > -0.2} {return}
 if {[expr {($dvvar - $rmvar)}] == 0.0} {return}
 if {($::GRAMSopt && abs($ndbvar) >= 1350.0) || (!$::GRAMSopt && abs($ndbvar) >= 135.0)} {
  if {$ndbvar > 0.0} {
   set looong1 ""
   db eval {select Long_Desc as looong1, food_des.NDB_No as looong1ndb from food_des, mealfoods where food_des.NDB_No = mealfoods.NDB_No and meal_date = $::currentmeal / 100 and meal = $::currentmeal % 100 and mhectograms < 0.0 order by mhectograms asc limit 1} { }
   } else {
   db eval {select Long_Desc as looong1, food_des.NDB_No as looong1ndb from food_des, mealfoods where food_des.NDB_No = mealfoods.NDB_No and meal_date = $::currentmeal / 100 and meal = $::currentmeal % 100 and mhectograms > 0.0 order by mhectograms desc limit 1} { }
   }
  db eval {select Long_Desc as looong from food_des where NDB_No = $ndb} { }
  ${::rmMenu}.menu.foodPCF${seq} current 0
  catch [list badPCF $looong $looong1 NULL 1]
  if {$::GRAMSopt} {set ndbvar 0} else {set ndbvar 0.0}
  db eval {update mealfoods set mhectograms = 0.0 where NDB_No = $ndb and meal_date = $::currentmeal / 100 and meal = $::currentmeal % 100}
  db eval {update weight set Seq = origSeq, whectograms = orighectograms, Amount = origAmount where NDB_No = $ndb}
  setPCF $seq $ndb ::PCFchoice${ndb}
  return
  }
 set upd {update mealfoods set mhectograms = mhectograms + (0.5 * $factor * ($dvvar - $rmvar)) where NDB_No = $ndb and meal_date = $::currentmeal / 100 and meal = $::currentmeal % 100}

 db eval $upd

 after cancel $::lastrmq
 set ::lastrmq [after idle {
  db eval {select * from pcf} { }
  }]

 after cancel $::lastamrm
 set ::lastamrm [after idle {
  db eval {select * from rm} { }
  db eval {select * from am} { }
  }]

 after cancel $::lastac
 set ::lastac [after idle auto_cal]

 }

#end PCF
}

set RecipeSaveAs {

proc RecipeSaveAs {args} {

db eval {delete from recipe}
db eval {select count(*) as foodcount from mealfoods where meal_date = $::currentmeal / 100 and meal = $::currentmeal % 100} { }
if {$foodcount == 0} {
 tk_messageBox -type ok -title $::version -message "A recipe must include at least one food."
 return
 }
db eval {select total(mhectograms) as foodweight from mealfoods where meal_date = $::currentmeal / 100 and meal = $::currentmeal % 100} { }
if {$foodweight <= 0.0} {
 tk_messageBox -type ok -title $::version -message "A recipe must have a weight greater than zero."
 return
 }
db eval {BEGIN}
db eval {insert into recipe select NULL, 9999, NULL, NULL, NULL, 0, NULL, NULL, * from meals where meal_id = $::currentmeal}
db eval {update recipe set NDB_No = case when (select max(NDB_No) from food_des) > 98999 then (select max(NDB_No) from food_des) + 1 else 99000 end, Pro_Factor = case when ifnull(PROT_KCAL, 0.0) > 0.0 and ifnull(PROCNT, 0.0) > 0.0 then PROT_KCAL / PROCNT else 4.0 end, Fat_Factor = case when ifnull(FAT_KCAL, 0.0) > 0.0 and ifnull(FAT, 0.0) > 0.0 then FAT_KCAL / FAT else 9.0 end, CHO_Factor = case when ifnull(CHO_KCAL, 0.0) > 0.0 and ifnull(CHOCDF, 0.0) > 0.0 then CHO_KCAL / CHOCDF else 4.0 end, OMEGA6 = case when OMEGA6 is null then 0.0 else OMEGA6 end, OMEGA3 = case when OMEGA3 is null then 0.0 else OMEGA3 end, SHORT6 = case when SHORT6 is null then 0.0 else SHORT6 end, LONG6 = case when LONG6 is null then 0.0 else LONG6 end, SHORT3 = case when SHORT3 is null then 0.0 else SHORT3 end, LONG3 = case when LONG3 is null then 0.0 else LONG3 end}
set ::RecipeWeight [db eval {select total(mhectograms) from mealfoods where meal_date =  $::currentmeal / 100 and meal = $::currentmeal % 100}]
db eval {delete from mealfoods where meal_date = $::currentmeal / 100 and meal = $::currentmeal % 100}
db eval {COMMIT}
set count -1
foreach mf $::MealfoodStatus {
 incr count
 if {$mf == "Hidden" || $mf == "Available"} {continue}
 MealfoodDelete $count $mf 0
 }
db nullvalue ""
db eval {select * from ar} { }
db nullvalue "\[No Data\]"
.nut hide .nut.rm
.nut add .nut.ar
.nut select .nut.ar
foreach var [info vars ::*ar] {
 set tag [string range $var 2 end-2]
 trace add variable $var write [list RecipeMod $tag]
 }
foreach var [info vars ::*ardv] {
 set tag [string range $var 2 end-4]
 trace add variable $var write [list RecipeModdv $tag]
 }
trace add variable ::CHO_NONFIBar1 write RecipeMod1

set ::RecipeName {}
set ::RecipeServNum {}
set ::RecipeServUnit {}
set ::RecipeServUnitNum {}
set ::RecipeServWeight {}
}

#end RecipeSaveAs
}

set RecipeMod1 {

proc RecipeMod1 {args} {
set ::CHO_NONFIBar $::CHO_NONFIBar1
}

#end RecipeMod1
}

set RecipeModdv {

proc RecipeModdv {tag var args} {
set varstarget ::${tag}ar
set varsdv ::${tag}dv_default
upvar #0 $var thevar $varstarget thevarstarget $varsdv thedv
if {[string is double -strict $thevar]} {
set $varstarget [expr {$thedv * $thevar / 100.0}]
 } else {
set $varstarget {}
 }
}

#end RecipeModdv
}

set RecipeMod {

proc RecipeMod {tag var args} {
upvar #0 $var thevar
db eval {select dv_default from nutr_def where Tagname = $tag} { }
set dvvar ::${tag}ardv
if {[string is double -strict $thevar]} {
 set diff [db eval "select $thevar - ifnull($tag,0.0) from recipe"]
 db eval "update recipe set $tag = $thevar"
 if {$dv_default > 0.0} {
  trace remove variable $dvvar write [list RecipeModdv $tag]
  set $dvvar [expr {int(round($thevar / $dv_default * 100.0))}]
  trace add variable $dvvar write [list RecipeModdv $tag]
  }
 } else {
 set diff [db eval "select 0.0 - ifnull($tag,0.0) from recipe"]
 db eval "update recipe set $tag = NULL"
 if {$dv_default > 0.0} {
  trace remove variable $dvvar write [list RecipeModdv $tag]
  set $dvvar {}
  trace add variable $dvvar write [list RecipeModdv $tag]
  }
 }
if {$tag == "VITE"} {
 trace remove variable ::TOCPHAar write [list RecipeMod TOCPHA]
 if {[string is double -strict $::VITEar]} {
  set ::TOCPHAar [expr {2.0 * $::VITEar / 3.0}]
  db eval {update recipe set TOCPHA = $::TOCPHAar}
  } else {
  set ::TOCPHAar {}
  db eval {update recipe set TOCPHA = NULL}
  }
 trace add variable ::TOCPHAar write [list RecipeMod TOCPHA]
 } elseif {$tag == "TOCPHA"} {
 trace remove variable ::VITEar write [list RecipeMod VITE]
 trace remove variable ::VITEardv write [list RecipeModdv VITE]
 if {[string is double -strict $::TOCPHAar]} {
  set ::VITEar [expr {3.0 * $::TOCPHAar / 2.0}]
  set ::VITEardv [expr {int(round($::VITEar / $::VITEdv_default * 100.0))}]
  db eval {update recipe set VITE = $::VITEar}
  } else {
  db eval {update recipe set VITE = NULL}
  set ::VITEar {}
  set ::VITEardv {}
  }
 trace add variable ::VITEar write [list RecipeMod VITE]
 trace add variable ::VITEardv write [list RecipeModdv VITE]
 } elseif {$tag == "ENERC_KCAL"} {
 trace remove variable ::ENERC_KJar write [list RecipeMod ENERC_KJ]
 if {[string is double -strict $::ENERC_KCALar]} {
  set ::ENERC_KJar [expr {$::ENERC_KCALar * 4.184}]
  db eval {update recipe set ENERC_KJ = $::ENERC_KJar}
  } else {
  set ::ENERC_KJar {}
  db eval {update recipe set ENERC_KJ = NULL}
  }
 trace add variable ::ENERC_KJar write [list RecipeMod ENERC_KJ]
 } elseif {$tag == "ENERC_KJ"} {
 trace remove variable ::ENERC_KCALar write [list RecipeMod ENERC_KCAL]
 trace remove variable ::ENERC_KCALardv write [list RecipeModdv ENERC_KCAL]
 if {[string is double -strict $::ENERC_KJar]} {
  set ::ENERC_KCALar [expr {$::ENERC_KJar / 4.184}]
  set ::ENERC_KCALardv [expr {int(round($::ENERC_KCALar / $::ENERC_KCALdv_default * 100.0))}]
  db eval {update recipe set ENERC_KCAL = $::ENERC_KCALar}
  } else {
  db eval {update recipe set ENERC_KCAL = NULL}
  set ::ENERC_KCALar {}
  set ::ENERC_KCALardv {}
  }
 trace add variable ::ENERC_KCALar write [list RecipeMod ENERC_KCAL]
 trace add variable ::ENERC_KCALardv write [list RecipeModdv ENERC_KCAL]
 } elseif {$tag == "PROCNT"} {
 db eval {update recipe set PROT_KCAL = ifnull(PROCNT, 0.0) * Pro_Factor}
 } elseif {$tag == "FAT"} {
 db eval {update recipe set FAT_KCAL = ifnull(FAT, 0.0) * Fat_Factor}
 } elseif {$tag == "CHOCDF"} {
 db eval {update recipe set CHO_KCAL = ifnull(CHOCDF, 0.0) * CHO_Factor}
 if {[string is double -strict $::CHOCDFar]} {
  if {[expr {$::CHOCDFar - $::FIBTGar}] > 0.0} {
   set ::CHO_NONFIBar [expr {$::CHOCDFar - $::FIBTGar}]
   }
  } else {
  set ::CHO_NONFIBar {}
  }
 } elseif {$tag == "CHO_NONFIB"} {
 trace remove variable ::CHO_NONFIBar1 write RecipeMod1
 if {[string is double -strict $::CHO_NONFIBar]} {
  set ::CHO_NONFIBar1 [expr {int(round($::CHO_NONFIBar))}]
  } else {
  set ::CHO_NONFIBar1 {}
  }
 trace add variable ::CHO_NONFIBar1 write RecipeMod1
 } elseif {$tag == "FIBTG"} {
 if {[string is double -strict $::FIBTGar]} {
  if {[expr {$::CHOCDFar - $::FIBTGar}] > 0.0} {
   set ::CHO_NONFIBar [expr {$::CHOCDFar - $::FIBTGar}]
   }
  } else {
  set ::CHO_NONFIBar {}
  }
 } elseif {$tag == "EPA"} {
 trace remove variable ::F20D5ar write [list RecipeMod F20D5]
 if {[string is double -strict $::EPAar]} {
  if {[string is double -strict $::F20D5ar]} {
   set ::F20D5ar [expr {$::F20D5ar + $diff}]
   } else {
   set ::F20D5ar $diff
   }
  set ::OMEGA3ar [expr {$::OMEGA3ar + $diff}]
  set ::LONG3ar [expr {$::LONG3ar + $diff}]
  if {$::F20D5ar < 0.0} {set ::F20D5ar 0.0}
  if {$::OMEGA3ar < 0.0} {set ::OMEGA3ar 0.0}
  if {$::LONG3ar < 0.0} {set ::LONG3ar 0.0}
  db eval {update recipe set F20D5 = $::F20D5ar, OMEGA3 = $::OMEGA3ar, LONG3 = $::LONG3ar}
  } else {
  set ::F20D5ar {}
  set ::OMEGA3ar [expr {$::OMEGA3ar + $diff}]
  set ::LONG3ar [expr {$::LONG3ar + $diff}]
  if {$::OMEGA3ar < 0.0} {set ::OMEGA3ar 0.0}
  if {$::LONG3ar < 0.0} {set ::LONG3ar 0.0}
  db eval {update recipe set F20D5 = NULL, OMEGA3 = $::OMEGA3ar, LONG3 = $::LONG3ar}
  }
 trace add variable ::F20D5ar write [list RecipeMod F20D5]
 } elseif {$tag == "F20D5"} {
 trace remove variable ::EPAar write [list RecipeMod EPA]
 trace remove variable ::EPAardv write [list RecipeModdv EPA]
 if {[string is double -strict $::F20D5ar]} {
  if {[string is double -strict $::EPAar]} {
   set ::EPAar [expr {$::EPAar + $diff}]
   } else {
   set ::EPAar $diff
   }
  set ::OMEGA3ar [expr {$::OMEGA3ar + $diff}]
  set ::LONG3ar [expr {$::LONG3ar + $diff}]
  if {$::EPAar < 0.0} {set ::EPAar 0.0}
  if {$::OMEGA3ar < 0.0} {set ::OMEGA3ar 0.0}
  if {$::LONG3ar < 0.0} {set ::LONG3ar 0.0}
  set ::EPAardv [expr {int(round($::EPAar / $::EPAdv_default * 100.0))}]
  db eval {update recipe set EPA = $::EPAar, OMEGA3 = $::OMEGA3ar, LONG3 = $::LONG3ar}
  } else {
  set ::EPAar {}
  set ::EPAardv {}
  set ::OMEGA3ar [expr {$::OMEGA3ar + $diff}]
  set ::LONG3ar [expr {$::LONG3ar + $diff}]
  if {$::OMEGA3ar < 0.0} {set ::OMEGA3ar 0.0}
  if {$::LONG3ar < 0.0} {set ::LONG3ar 0.0}
  db eval {update recipe set EPA = NULL, OMEGA3 = $::OMEGA3ar, LONG3 = $::LONG3ar}
  }
 trace add variable ::EPAar write [list RecipeMod EPA]
 trace add variable ::EPAardv write [list RecipeModdv EPA]
 } elseif {$tag == "DHA"} {
 trace remove variable ::F22D6ar write [list RecipeMod F22D6]
 if {[string is double -strict $::DHAar]} {
  if {[string is double -strict $::F22D6ar]} {
   set ::F22D6ar [expr {$::F22D6ar + $diff}]
   } else {
   set ::F22D6ar $diff
   }
  set ::OMEGA3ar [expr {$::OMEGA3ar + $diff}]
  set ::LONG3ar [expr {$::LONG3ar + $diff}]
  if {$::F22D6ar < 0.0} {set ::F22D6ar 0.0}
  if {$::OMEGA3ar < 0.0} {set ::OMEGA3ar 0.0}
  if {$::LONG3ar < 0.0} {set ::LONG3ar 0.0}
  db eval {update recipe set F22D6 = $::F22D6ar, OMEGA3 = $::OMEGA3ar, LONG3 = $::LONG3ar}
  } else {
  set ::F22D6ar {}
  set ::OMEGA3ar [expr {$::OMEGA3ar + $diff}]
  set ::LONG3ar [expr {$::LONG3ar + $diff}]
  if {$::OMEGA3ar < 0.0} {set ::OMEGA3ar 0.0}
  if {$::LONG3ar < 0.0} {set ::LONG3ar 0.0}
  db eval {update recipe set F22D6 = NULL, OMEGA3 = $::OMEGA3ar, LONG3 = $::LONG3ar}
  }
 trace add variable ::F22D6ar write [list RecipeMod F22D6]
 } elseif {$tag == "F22D6"} {
 trace remove variable ::DHAar write [list RecipeMod DHA]
 trace remove variable ::DHAardv write [list RecipeModdv DHA]
 if {[string is double -strict $::F22D6ar]} {
  if {[string is double -strict $::DHAar]} {
   set ::DHAar [expr {$::DHAar + $diff}]
   } else {
   set ::DHAar $diff
   }
  set ::OMEGA3ar [expr {$::OMEGA3ar + $diff}]
  set ::LONG3ar [expr {$::LONG3ar + $diff}]
  if {$::DHAar < 0.0} {set ::DHAar 0.0}
  if {$::OMEGA3ar < 0.0} {set ::OMEGA3ar 0.0}
  if {$::LONG3ar < 0.0} {set ::LONG3ar 0.0}
  set ::DHAardv [expr {int(round($::DHAar / $::DHAdv_default * 100.0))}]
  db eval {update recipe set DHA = $::DHAar, OMEGA3 = $::OMEGA3ar, LONG3 = $::LONG3ar}
  } else {
  set ::DHAar {}
  set ::DHAardv {}
  set ::OMEGA3ar [expr {$::OMEGA3ar + $diff}]
  set ::LONG3ar [expr {$::LONG3ar + $diff}]
  if {$::OMEGA3ar < 0.0} {set ::OMEGA3ar 0.0}
  if {$::LONG3ar < 0.0} {set ::LONG3ar 0.0}
  db eval {update recipe set DHA = NULL, OMEGA3 = $::OMEGA3ar, LONG3 = $::LONG3ar}
  }
 trace add variable ::DHAar write [list RecipeMod DHA]
 trace add variable ::DHAardv write [list RecipeModdv DHA]
 } elseif {$tag == "ALA"} {
 trace remove variable ::F18D3ar write [list RecipeMod F18D3]
 trace remove variable ::F18D3CN3ar write [list RecipeMod F18D3CN3]
 if {[string is double -strict $::ALAar]} {
  if {[string is double -strict $::F18D3ar]} {
   set ::F18D3ar [expr {$::F18D3ar + $diff}]
   } else {
   set ::F18D3ar $diff
   }
  if {[string is double -strict $::F18D3CN3ar]} {
   set ::F18D3CN3ar [expr {$::F18D3CN3ar + $diff}]
   } else {
   set ::F18D3CN3ar $diff
   }
  set ::OMEGA3ar [expr {$::OMEGA3ar + $diff}]
  set ::SHORT3ar [expr {$::SHORT3ar + $diff}]
  if {$::F18D3ar < 0.0} {set ::F18D3ar 0.0}
  if {$::F18D3CN3ar < 0.0} {set ::F18D3CN3ar 0.0}
  if {$::OMEGA3ar < 0.0} {set ::OMEGA3ar 0.0}
  if {$::SHORT3ar < 0.0} {set ::SHORT3ar 0.0}
  db eval {update recipe set F18D3 = $::F18D3ar, F18D3CN3 = $::F18D3CN3ar, OMEGA3 = $::OMEGA3ar, SHORT3 = $::SHORT3ar}
  } else {
  set ::F18D3CN3ar {}
  set ::F18D3ar [expr {$::F18D3ar + $diff}]
  set ::OMEGA3ar [expr {$::OMEGA3ar + $diff}]
  set ::SHORT3ar [expr {$::SHORT3ar + $diff}]
  if {$::F18D3ar < 0.0} {set ::F18D3ar 0.0}
  if {$::OMEGA3ar < 0.0} {set ::OMEGA3ar 0.0}
  if {$::SHORT3ar < 0.0} {set ::SHORT3ar 0.0}
  db eval {update recipe set F18D3CN3 = NULL, F18D3 = $::F18D3ar, OMEGA3 = $::OMEGA3ar, SHORT3 = $::SHORT3ar}
  }
 trace add variable ::F18D3ar write [list RecipeMod F18D3]
 trace add variable ::F18D3CN3ar write [list RecipeMod F18D3CN3]
 } elseif {$tag == "F18D3CN3"} {
 trace remove variable ::ALAar write [list RecipeMod ALA]
 trace remove variable ::ALAardv write [list RecipeModdv ALA]
 trace remove variable ::F18D3ar write [list RecipeMod F18D3]
 if {[string is double -strict $::F18D3CN3ar]} {
  if {[string is double -strict $::ALAar]} {
   set ::ALAar [expr {$::ALAar + $diff}]
   } else {
   set ::ALAar $diff
   }
  if {[string is double -strict $::F18D3ar]} {
   set ::F18D3ar [expr {$::F18D3ar + $diff}]
   } else {
   set ::F18D3ar $diff
   }
  set ::OMEGA3ar [expr {$::OMEGA3ar + $diff}]
  set ::SHORT3ar [expr {$::SHORT3ar + $diff}]
  if {$::ALAar < 0.0} {set ::ALAar 0.0}
  if {$::F18D3ar < 0.0} {set ::F18D3ar 0.0}
  if {$::OMEGA3ar < 0.0} {set ::OMEGA3ar 0.0}
  if {$::SHORT3ar < 0.0} {set ::SHORT3ar 0.0}
  set ::ALAardv [expr {int(round($::ALAar / $::ALAdv_default * 100.0))}]
  db eval {update recipe set ALA = $::ALAar, F18D3 = $::F18D3ar, OMEGA3 = $::OMEGA3ar, SHORT3 = $::SHORT3ar}
  } else {
  set ::ALAar {}
  set ::ALAardv {}
  set ::F18D3ar [expr {$::F18D3ar + $diff}]
  set ::OMEGA3ar [expr {$::OMEGA3ar + $diff}]
  set ::SHORT3ar [expr {$::SHORT3ar + $diff}]
  if {$::F18D3ar < 0.0} {set ::F18D3ar 0.0}
  if {$::OMEGA3ar < 0.0} {set ::OMEGA3ar 0.0}
  if {$::SHORT3ar < 0.0} {set ::SHORT3ar 0.0}
  db eval {update recipe set ALA = NULL, F18D3 = $::F18D3ar, OMEGA3 = $::OMEGA3ar, SHORT3 = $::SHORT3ar}
  }
 trace add variable ::ALAar write [list RecipeMod ALA]
 trace add variable ::ALAardv write [list RecipeModdv ALA]
 trace add variable ::F18D3ar write [list RecipeMod F18D3]
 } elseif {$tag == "AA"} {
 trace remove variable ::F20D4ar write [list RecipeMod F20D4]
 trace remove variable ::F20D4N6ar write [list RecipeMod F20D4N6]
 if {[string is double -strict $::AAar]} {
  if {[string is double -strict $::F20D4ar]} {
   set ::F20D4ar [expr {$::F20D4ar + $diff}]
   } else {
   set ::F20D4ar $diff
   }
  if {[string is double -strict $::F20D4N6ar]} {
   set ::F20D4N6ar [expr {$::F20D4N6ar + $diff}]
   } else {
   set ::F20D4N6ar $diff
   }
  set ::OMEGA6ar [expr {$::OMEGA6ar + $diff}]
  set ::LONG6ar [expr {$::LONG6ar + $diff}]
  if {$::F20D4ar < 0.0} {set ::F20D4ar 0.0}
  if {$::F20D4N6ar < 0.0} {set ::F20D4N6ar 0.0}
  if {$::OMEGA6ar < 0.0} {set ::OMEGA6ar 0.0}
  if {$::LONG6ar < 0.0} {set ::LONG6ar 0.0}
  db eval {update recipe set F20D4 = $::F20D4ar, F20D4N6 = $::F20D4N6ar, OMEGA6 = $::OMEGA6ar, LONG6 = $::LONG6ar}
  } else {
  set ::F20D4N6ar {}
  set ::F20D4ar [expr {$::F20D4ar + $diff}]
  set ::OMEGA6ar [expr {$::OMEGA6ar + $diff}]
  set ::LONG6ar [expr {$::LONG6ar + $diff}]
  if {$::F20D4ar < 0.0} {set ::F20D4ar 0.0}
  if {$::OMEGA6ar < 0.0} {set ::OMEGA6ar 0.0}
  if {$::LONG6ar < 0.0} {set ::LONG6ar 0.0}
  db eval {update recipe set F20D4N6 = NULL, F20D4 = $::F20D4ar, OMEGA6 = $::OMEGA6ar, LONG6 = $::LONG6ar}
  }
 trace add variable ::F20D4ar write [list RecipeMod F20D4]
 trace add variable ::F20D4N6ar write [list RecipeMod F20D4N6]
 } elseif {$tag == "F20D4N6"} {
 trace remove variable ::AAar write [list RecipeMod AA]
 trace remove variable ::AAardv write [list RecipeModdv AA]
 trace remove variable ::F20D4ar write [list RecipeMod F20D4]
 if {[string is double -strict $::F20D4N6ar]} {
  if {[string is double -strict $::AAar]} {
   set ::AAar [expr {$::AAar + $diff}]
   } else {
   set ::AAar $diff
   }
  if {[string is double -strict $::F20D4ar]} {
   set ::F20D4ar [expr {$::F20D4ar + $diff}]
   } else {
   set ::F20D4ar $diff
   }
  set ::OMEGA6ar [expr {$::OMEGA6ar + $diff}]
  set ::LONG6ar [expr {$::LONG6ar + $diff}]
  if {$::AAar < 0.0} {set ::AAar 0.0}
  if {$::F20D4ar < 0.0} {set ::F20D4ar 0.0}
  if {$::OMEGA6ar < 0.0} {set ::OMEGA6ar 0.0}
  if {$::LONG6ar < 0.0} {set ::LONG6ar 0.0}
  set ::AAardv [expr {int(round($::AAar / $::AAdv_default * 100.0))}]
  db eval {update recipe set AA = $::AAar, F20D4 = $::F20D4ar, OMEGA6 = $::OMEGA6ar, LONG6 = $::LONG6ar}
  } else {
  set ::AAar {}
  set ::AAardv {}
  set ::F20D4ar [expr {$::F20D4ar + $diff}]
  set ::OMEGA6ar [expr {$::OMEGA6ar + $diff}]
  set ::LONG6ar [expr {$::LONG6ar + $diff}]
  if {$::F20D4ar < 0.0} {set ::F20D4ar 0.0}
  if {$::OMEGA6ar < 0.0} {set ::OMEGA6ar 0.0}
  if {$::LONG6ar < 0.0} {set ::LONG6ar 0.0}
  db eval {update recipe set AA = NULL, F20D4 = $::F20D4ar, OMEGA6 = $::OMEGA6ar, LONG6 = $::LONG6ar}
  }
 trace add variable ::AAar write [list RecipeMod AA]
 trace add variable ::AAardv write [list RecipeModdv AA]
 trace add variable ::F20D4ar write [list RecipeMod F20D4]
 } elseif {$tag == "LA"} {
 trace remove variable ::F18D2ar write [list RecipeMod F18D2]
 trace remove variable ::F18D2CN6ar write [list RecipeMod F18D2CN6]
 if {[string is double -strict $::LAar]} {
  if {[string is double -strict $::F18D2ar]} {
   set ::F18D2ar [expr {$::F18D2ar + $diff}]
   } else {
   set ::F18D2ar $diff
   }
  if {[string is double -strict $::F18D2CN6ar]} {
   set ::F18D2CN6ar [expr {$::F18D2CN6ar + $diff}]
   } else {
   set ::F18D2CN6ar $diff
   }
  set ::OMEGA6ar [expr {$::OMEGA6ar + $diff}]
  set ::SHORT6ar [expr {$::SHORT6ar + $diff}]
  if {$::F18D2ar < 0.0} {set ::F18D2ar 0.0}
  if {$::F18D2CN6ar < 0.0} {set ::F18D2CN6ar 0.0}
  if {$::OMEGA6ar < 0.0} {set ::OMEGA6ar 0.0}
  if {$::SHORT6ar < 0.0} {set ::SHORT6ar 0.0}
  db eval {update recipe set F18D2 = $::F18D2ar, F18D2CN6 = $::F18D2CN6ar, OMEGA6 = $::OMEGA6ar, SHORT6 = $::SHORT6ar}
  } else {
  set ::F18D2CN6ar {}
  set ::F18D2ar [expr {$::F18D2ar + $diff}]
  set ::OMEGA6ar [expr {$::OMEGA6ar + $diff}]
  set ::SHORT6ar [expr {$::SHORT6ar + $diff}]
  if {$::F18D2ar < 0.0} {set ::F18D2ar 0.0}
  if {$::OMEGA6ar < 0.0} {set ::OMEGA6ar 0.0}
  if {$::SHORT6ar < 0.0} {set ::SHORT6ar 0.0}
  db eval {update recipe set F18D2CN6 = NULL, F18D2 = $::F18D2ar, OMEGA6 = $::OMEGA6ar, SHORT6 = $::SHORT6ar}
  }
 trace add variable ::F18D2ar write [list RecipeMod F18D2]
 trace add variable ::F18D2CN6ar write [list RecipeMod F18D2CN6]
 } elseif {$tag == "F18D2CN6"} {
 trace remove variable ::LAar write [list RecipeMod LA]
 trace remove variable ::LAardv write [list RecipeModdv LA]
 trace remove variable ::F18D2ar write [list RecipeMod F18D2]
 if {[string is double -strict $::F18D2CN6ar]} {
  if {[string is double -strict $::LAar]} {
   set ::LAar [expr {$::LAar + $diff}]
   } else {
   set ::LAar $diff
   }
  if {[string is double -strict $::F18D2ar]} {
   set ::F18D2ar [expr {$::F18D2ar + $diff}]
   } else {
   set ::F18D2ar $diff
   }
  set ::OMEGA6ar [expr {$::OMEGA6ar + $diff}]
  set ::SHORT6ar [expr {$::SHORT6ar + $diff}]
  if {$::LAar < 0.0} {set ::LAar 0.0}
  if {$::F18D2ar < 0.0} {set ::F18D2ar 0.0}
  if {$::OMEGA6ar < 0.0} {set ::OMEGA6ar 0.0}
  if {$::SHORT6ar < 0.0} {set ::SHORT6ar 0.0}
  set ::LAardv [expr {int(round($::LAar / $::LAdv_default * 100.0))}]
  db eval {update recipe set LA = $::LAar, F18D2 = $::F18D2ar, OMEGA6 = $::OMEGA6ar, SHORT6 = $::SHORT6ar}
  } else {
  set ::LAar {}
  set ::LAardv {}
  set ::F18D2ar [expr {$::F18D2ar + $diff}]
  set ::OMEGA6ar [expr {$::OMEGA6ar + $diff}]
  set ::SHORT6ar [expr {$::SHORT6ar + $diff}]
  if {$::F18D2ar < 0.0} {set ::F18D2ar 0.0}
  if {$::OMEGA6ar < 0.0} {set ::OMEGA6ar 0.0}
  if {$::SHORT6ar < 0.0} {set ::SHORT6ar 0.0}
  db eval {update recipe set LA = NULL, F18D2 = $::F18D2ar, OMEGA6 = $::OMEGA6ar, SHORT6 = $::SHORT6ar}
  }
 trace add variable ::LAar write [list RecipeMod LA]
 trace add variable ::LAardv write [list RecipeModdv LA]
 trace add variable ::F18D2ar write [list RecipeMod F18D2]
 }
db eval {select n6hufa(SHORT3,SHORT6,LONG3,LONG6,FASAT,FAMS,FATRN,FAPU,ENERC_KCAL,0) as "::FAPU1ar", case when ENERC_KCAL > 0.0 then cast(round(100.0 * PROT_KCAL / ENERC_KCAL) as integer) || ' / ' || cast(round(100.0 * CHO_KCAL / ENERC_KCAL) as integer) || ' / ' || cast(round(100.0 * FAT_KCAL / ENERC_KCAL) as integer) else '0 / 0 / 0' end as "::ENERC_KCAL1ar", cast (round(CHO_NONFIB, 0) as int) as "::CHO_NONFIBar1" from recipe} { }
}

#end RecipeMod
}

set RecipeCancel {

proc RecipeCancel {args} {
.nut hide .nut.ar
.nut add .nut.rm
.nut select .nut.rm
set ::RecipeName {}
set ::RecipeServNum {}
set ::RecipeServUnit {}
set ::RecipeServUnitNum {}
set ::RecipeServWeight {}
db eval {delete from recipe}
foreach var [info vars ::*ar] {
 set tag [string range $var 2 end-2]
 trace remove variable $var write [list RecipeMod $tag]
 }
foreach var [info vars ::*ardv] {
 set tag [string range $var 2 end-4]
 trace remove variable $var write [list RecipeModdv $tag]
 }
trace remove variable ::CHO_NONFIBar1 write RecipeMod1

if {[db eval {select count(*) from mealfoods where meal_date = $::currentmeal / 100 and meal = $::currentmeal % 100}] > 0} {
 db eval {select * from rm} { }
 } else {
 db eval {select * from rm_zero} { }
 }
after 300 update_am
}

#end RecipeCancel
}

set RecipeDone {

proc RecipeDone {args} {
set ::RecipeName [string trimright $::RecipeName " "]
if {$::RecipeName == {}} {
 tk_messageBox -type ok -title $::version -message "The recipe name must not be blank."
 return
 }
db eval {update recipe set Long_Desc = $::RecipeName, Shrt_Desc = substr($::RecipeName,1,60)}
set count [db eval {select count(*) from food_des where Long_Desc = (select Long_Desc from recipe) or Shrt_Desc = (select Shrt_Desc from recipe)}]
if {$count > 0} {
 tk_messageBox -type ok -title $::version -message "This recipe name is a duplicate of a food name in the table."
 return
 }
if {![string is double -strict $::RecipeServNum]} {
 tk_messageBox -type ok -title $::version -message "\"Number of servings recipe makes\" must be a decimal number greater than zero."
 return
 } elseif {$::RecipeServNum <= 0.0} {
 tk_messageBox -type ok -title $::version -message "\"Number of servings recipe makes\" must be a decimal number greater than zero."
 return
 }
if {$::RecipeServUnit == {}} {
 tk_messageBox -type ok -title $::version -message "The \"Serving Unit\" must not be blank."
 return
 }
if {![string is double -strict $::RecipeServUnitNum]} {
 tk_messageBox -type ok -title $::version -message "\"Number of units in one serving\" must be a decimal number greater than zero."
 return
 } elseif {$::RecipeServUnitNum <= 0.0} {
 tk_messageBox -type ok -title $::version -message "\"Number of units in one serving\" must be a decimal number greater than zero."
 return
 }
if {[string is double -strict $::RecipeServWeight]} {
 if {$::GRAMSopt} {
  set newweight [expr {$::RecipeServWeight * $::RecipeServNum / 100.0}]
  } else {
  set newweight [expr {$::RecipeServWeight * $::RecipeServNum * .28349523}]
  }
 set diff [expr {100.0 * ($newweight - $::RecipeWeight)}]
 db eval {update recipe set WATER = case when WATER + $diff < 0.0 then 0.0 else WATER + $diff end}
 set ::RecipeWeight $newweight
 }
set recipe100 [db eval {select sql from sql_statements where sqlname = 'recipe100'}]
db eval {*}$recipe100
set ndb [db eval {select NDB_No from recipe}]
db eval {insert into food_des select * from recipe}
db eval {insert into weight select $ndb, 99, 100, 'grams', 1, 99, 100, 1}
db eval {insert into weight select $ndb, 1, $::RecipeServUnitNum, $::RecipeServUnit, $::RecipeWeight / $::RecipeServNum, 1, $::RecipeServUnitNum, $::RecipeWeight / $::RecipeServNum}
RecipeCancel
FoodChoicevf_alt $ndb 0.0 0
}

#end RecipeDone
}

set ServingChange {

proc ServingChange {args} {

 uplevel #0 {
  db eval {update weight set Seq = origSeq, whectograms = orighectograms, Amount = origAmount where NDB_No = $NDB_Novf}
  db eval {update or ignore weight set Seq = "0" where NDB_No = $NDB_Novf and Msre_Desc = $Msre_Descvf}
  dropoutvf
  db eval {select * from vf where NDB_Novf = $NDB_Novf limit 1} { }
  tuneinvf
  set servingsizes [db eval {select distinct Msre_Desc from weight where NDB_No = $NDB_Novf limit 100 offset 1}]
  .nut.vf.cb configure -values $servingsizes
  }

 }

#end ServingChange
}

set SetDefanal {

proc SetDefanal {args} {

 if {[string equal $::meals_to_analyze_am ""]} {return}
 if {$::SetDefanalPreviousValue != $::meals_to_analyze_am} {
  after cancel $::LastSetDefanal
  set ::LastSetDefanal [after 110 [list SetDefanalLater $::meals_to_analyze_am]]
  }
 set ::SetDefanalPreviousValue $::meals_to_analyze_am

 }

#end SetDefanal
}

set SetDefanalLater {

proc SetDefanalLater {newval} {

if {$newval == $::meals_to_analyze_am} {
 if {![string is integer -strict $::meals_to_analyze_am]} { set ::meals_to_analyze_am $::defanal_am}
 if {[string is integer -strict $::meals_to_analyze_am] && [expr {$::meals_to_analyze_am > $::mealcount}]} {
  set ::meals_to_analyze_am $::mealcount
  return
  }
 if {$::mealcount > 0} {
  db eval {update options set defanal_am = $::meals_to_analyze_am; select update_am()}
  }
 }
}

#end SetDefanalLater
}

set SetMealRange_am {

proc SetMealRange_am {args} {

 uplevel #0 {
  if { $::FIRSTMEALam == $::LASTMEALam } {
   set mealrange "Meal $::FIRSTMEALam"
   .nut.am.meallabel configure -text " meal:"
   } else {
   set mealrange "Meals $::FIRSTMEALam through $::LASTMEALam"
   .nut.am.meallabel configure -text " meals:"
   }
  }

 }

#end SetMealRange_am
}

set SetMPD {

proc SetMPD {mpd} {

set complete_mealjoin [db eval {select sql from sql_statements where sqlname = 'complete_mealjoin'}]
set update_mealfoods_trigger [db eval {select sql from sql_statements where sqlname = 'update_mealfoods_trigger'}]
set insert_mealfoods_trigger [db eval {select sql from sql_statements where sqlname = 'insert_mealfoods_trigger'}]
set delete_mealfoods_trigger [db eval {select sql from sql_statements where sqlname = 'delete_mealfoods_trigger'}]
set delete1_mealfoods_trigger [db eval {select sql from sql_statements where sqlname = 'delete1_mealfoods_trigger'}]

db eval {BEGIN TRANSACTION}
db eval {drop trigger update_mealfoods}
db eval {drop trigger insert_mealfoods}
db eval {drop trigger delete_mealfoods}
db eval {drop trigger delete1_mealfoods}

db eval {insert into archive_mealfoods select *, $::meals_per_day from mealfoods}
db eval {delete from mealfoods}
db eval {delete from meals}
db eval {insert into mealfoods select meal_date, meal, NDB_No, mhectograms from archive_mealfoods where meals_per_day = $mpd}
db eval {delete from archive_mealfoods where meals_per_day = $mpd}
db eval {*}$complete_mealjoin
db eval {*}$update_mealfoods_trigger
db eval {*}$insert_mealfoods_trigger
db eval {*}$delete_mealfoods_trigger
db eval {*}$delete1_mealfoods_trigger
db eval {update options set meals_per_day = $mpd}
db eval {COMMIT}

set oldmpd $::meals_per_day
set ::meals_per_day $mpd
update_am
SetMealBase
.nut.rm.setmpd.m delete 0 end
if {$::meals_per_day != 1} {
 .nut.rm.setmpd.m add command -label "Set 1 meal per day" -command [list SetMPD 1]
 } else {
 .nut.rm.setmpd.m add command -label "Set 1 meal per day" -command [list SetMPD 1] -state disabled
 }
for {set i 2} {$i < 20} {incr i} {
 if {$i != $::meals_per_day} {
  .nut.rm.setmpd.m add command -label "Set $i meals per day" -command [list SetMPD $i]
  } else {
  .nut.rm.setmpd.m add command -label "Set $i meals per day" -command [list SetMPD $i] -state disabled
  }
 }

tk_messageBox -type ok -title $::version -message "Meals per day changed from $oldmpd to $::meals_per_day.  Existing meals were archived and will be copied back into the active table if meals per day is ever changed back to $oldmpd."
}

#end SetMPD
}

set SwitchToAnalysis {

proc SwitchToAnalysis {args} {

 .nut.rm.analysismeal configure -text "Menu" -command SwitchToMenu
 if {!$::ALTGUI} {
  grid remove $::rmMainPane
  grid remove .nut.rm.grams
  grid remove .nut.rm.ounces
 #grid remove .nut.rm.recipebutton
  set ::rmMainPane .nut.rm.nbw
  grid $::rmMainPane
  } else {
  place forget $::rmMainPane
  place forget .nut.rm.grams
  place forget .nut.rm.ounces
 #place forget .nut.rm.recipebutton
  set ::rmMainPane .nut.rm.nbw
  place $::rmMainPane -relx 0.0 -rely 0.25 -relheight 0.75 -relwidth 1.0
  }
 }

#end SwitchToAnalysis
}

set SwitchToMenu {

proc SwitchToMenu {args} {

.nut.rm.analysismeal configure -text "Analysis" -command SwitchToAnalysis
if {!$::ALTGUI} {
 grid remove $::rmMainPane
 grid .nut.rm.grams
 grid .nut.rm.ounces
#grid .nut.rm.recipebutton
 set ::rmMainPane .nut.rm.frmenu
 grid $::rmMainPane
 grid remove .nut.rm.searchcancel
 } else {
 place forget $::rmMainPane
 place .nut.rm.grams -relx 0.87 -rely 0.0046296296 -relheight 0.044444444 -relwidth 0.11
 place .nut.rm.ounces -relx 0.87 -rely 0.0490740736 -relheight 0.044444444 -relwidth 0.11
#place .nut.rm.recipebutton -relx 0.0058 -rely 0.185 -relheight 0.045 -relwidth 0.2
 set ::rmMainPane .nut.rm.frmenu
 place $::rmMainPane -relx 0.0 -rely 0.25 -relheight 0.75 -relwidth 1.0
 place forget .nut.rm.searchcancel
 }
 .nut.rm.recipebutton configure -state normal

 }

#end SwitchToMenu
}

set TurnOffTheBubbleMachine {

proc TurnOffTheBubbleMachine {} {

 set ::BubbleMachineStatus 0
 .nut.rm.bubblemachine stop
 db eval {COMMIT}
 if {!$::ALTGUI} {
  grid remove .nut.rm.bubblemachine
  grid .nut.rm.fsentry
  } else {
  place forget .nut.rm.bubblemachine
  place .nut.rm.fsentry -relx 0.4 -rely 0.19629629  -relheight 0.044444444 -relwidth 0.45
  }
 }

#end TurnOffTheBubbleMachine
}

set auto_cal {

proc auto_cal {} {

 if {$::FIBTGopt == 0.0} {set newdv [expr {$::ENERC_KCALdv / 2000.0 * $::FIBTGdv_default}]} elseif {$::FIBTGopt == -1.0 && [string is double -strict $::FIBTGam] && $::FIBTGam > 0.0} {set newdv $::FIBTGam} elseif {$::FIBTGopt > 0.0} {set newdv $::FIBTGopt} else {set newdv $::FIBTGdv_default}
 set newdv [expr {round(10.0 * $newdv) / 10.0}]
 if {$newdv != $::FIBTGdv} {set ::FIBTGdv $newdv}

 if {[string is double -strict $::PROCNTam] && $::PROCNTam > 0.0 && $::PROT_KCALam > 0.0} {set PROTcalpergram [expr {$::PROT_KCALam / $::PROCNTam}]} else {set PROTcalpergram 4.0}
 if {[string is double -strict $::CHOCDFam] && $::CHOCDFam > 0.0 && $::CHO_KCALam > 0.0} {set CHOCDFcalpergram [expr {$::CHO_KCALam / $::CHOCDFam}]} else {set CHOCDFcalpergram 4.0}
 if {[string is double -strict $::FATam] && $::FATam > 0.0 && $::FAT_KCALam > 0.0} {set FATcalpergram [expr {$::FAT_KCALam / $::FATam}]} else {set FATcalpergram 9.0}
 if {[string is double -strict $::ALCam]} {set alccals [expr {6.93 * $::ALCam}]} else {set alccals 0.0}

 if {![string is double -strict $::FATam]} {set fat 0.0} else {set fat $::FATam}
 if {![string is double -strict $::FASATam]} {set sat 0.0} else {set sat $::FASATam}
 if {![string is double -strict $::FAMSam]} {set mono 0.0} else {set mono $::FAMSam}
 if {![string is double -strict $::FATRNam]} {set trans 0.0} else {set trans $::FATRNam}
 if {![string is double -strict $::FAPUam]} {set pufa 0.0} else {set pufa $::FAPUam}
 if {![string is double -strict $::SHORT3am]} {set short3 0.0} else {set short3 $::SHORT3am}
 if {![string is double -strict $::SHORT6am]} {set short6 0.0} else {set short6 $::SHORT6am}
 if {![string is double -strict $::LONG3am]} {set long3 0.0} else {set long3 $::LONG3am}
 if {![string is double -strict $::LONG6am]} {set long6 0.0} else {set long6 $::LONG6am}
 if {$fat > 0.0} {set fa2fat [expr {($sat + $mono + $pufa) / $fat}]} else {set fa2fat 0.95}

 if {$::ENERC_KCALopt == 0.0 && $::PROCNTopt == 0.0} {set newdv $::PROCNTdv_default} elseif {$::PROCNTopt == 0.0} {set newdv [expr {$::ENERC_KCALdv / 2000.0 * $::PROCNTdv_default}]} elseif {$::PROCNTopt == -1.0 && [string is double -strict $::PROCNTam] && $::PROCNTam > 0.0} {set newdv $::PROCNTam} elseif {$::PROCNTopt > 0.0} {set newdv $::PROCNTopt}
 set newdv [expr {round(10.0 * $newdv) / 10.0}]
 if {$newdv != $::PROCNTdv} {set ::PROCNTdv $newdv}

 if {$::CHO_NONFIBopt != 0.0} {
  if {$::CHO_NONFIBopt > 0.0} {set newdv $::CHO_NONFIBopt} elseif {[string is double -strict $::CHO_NONFIBam] && $::CHO_NONFIBam > 0.0} {set newdv $::CHO_NONFIBam} else {set newdv $::CHO_NONFIBdv_default}
  if {$newdv != $::CHO_NONFIBdv} {set ::CHO_NONFIBdv $newdv}
  set newdv [expr {$::CHO_NONFIBdv + $::FIBTGdv}]
  set newdv [expr {round(10.0 * $newdv) / 10.0}]
  if {$newdv != $::CHOCDFdv} {set ::CHOCDFdv $newdv}
  }

 if {$::FATopt == -1.0 && [string is double -strict $::FATam] && $::FATam > 0.0} {set newdv $::FATam} elseif {$::FATopt == -1.0 && [string is double -strict $::FATam] && $::FATam == 0.0} {set newdv $::FATdv_default} elseif {$::FATopt > 0.0} {set newdv $::FATopt} elseif {$::FATopt == 0.0 && $::CHO_NONFIBopt == 0.0} {set newdv [expr {0.3 * $::ENERC_KCALdv / $FATcalpergram}]} else {set newdv [expr {($::ENERC_KCALdv - $alccals - ($::PROCNTdv * $PROTcalpergram) - ($::CHOCDFdv * $CHOCDFcalpergram)) / $FATcalpergram}]}
 set newdv [expr {round(10.0 * $newdv) / 10.0}]
 if {$newdv != $::FATdv} {set ::FATdv $newdv}

 if {$::CHO_NONFIBopt == 0.0} {
  set newdv [expr {($::ENERC_KCALdv - $alccals - ($::PROCNTdv * $PROTcalpergram) - ($::FATdv * $FATcalpergram)) / $CHOCDFcalpergram}]
  if {$newdv != $::CHOCDFdv} {set ::CHOCDFdv $newdv}
  set newdv [expr {$::CHOCDFdv - $::FIBTGdv}]
  set newdv [expr {round(10.0 * $newdv) / 10.0}]
  if {$newdv != $::CHO_NONFIBdv} {set ::CHO_NONFIBdv $newdv}
  }

 if {$::FASATopt == -1.0 && [string is double -strict $::FASATam] && $::FASATam > 0.0} {set newdv $::FASATam} elseif {$::FASATopt == -1.0} {set newdv $::FASATdv_default} elseif {$::FASATopt > 0.0} {set newdv $::FASATopt} elseif {$::FASATopt == 0.0 && $::ENERC_KCALopt == 0.0} {set newdv $::FASATdv_default} else {set newdv [expr {0.1 * $::ENERC_KCALdv / $FATcalpergram * $fa2fat}]}
 set newdv [expr {round(10.0 * $newdv) / 10.0}]
 if {$newdv != $::FASATdv} {set ::FASATdv $newdv}

 if {$::FAPUopt == -1.0 && [string is double -strict $::FAPUam] && $::FAPUam > 0.0} {set newdv $::FAPUam} elseif {$::FAPUopt == -1.0} {set newdv $::FAPUdv_default} elseif {$::FAPUopt > 0.0} {set newdv $::FAPUopt} elseif {$::FAPUopt == 0.0 && $::ENERC_KCALopt == 0.0} {set newdv $::FAPUdv_default} else {set newdv [expr {0.04 * $::ENERC_KCALdv / $FATcalpergram * $fa2fat}]}
 set newdv [expr {round(10.0 * $newdv) / 10.0}]
 if {$newdv != $::FAPUdv} {set ::FAPUdv $newdv}

 if {[string is double -strict $::FAPUam] && $::FAPUam > 0.0} {set pufareductionfactor [expr {$::FAPUam / $::FAPUdv}]} else {set pufareductionfactor 1.0}
 if {$pufareductionfactor < 1.0} {set pufareductionfactor 1.0}
 set short6 [expr {$short6 / $pufareductionfactor}]
 set long6 [expr {$long6 / $pufareductionfactor}]

 set newdv [expr {($::FATdv * $fa2fat) - $::FASATdv - $::FAPUdv}]
 set newdv [expr {round(10.0 * $newdv) / 10.0}]
 if {$newdv != $::FAMSdv} {set ::FAMSdv $newdv}

 set current [n6hufa $short3 $short6 $long3 $long6 $::FASATdv $::FAMSdv $trans $::FAPUdv $::ENERC_KCALdv 1]

 if {$current == 0.0} { return }

 if {$current < $::FAPU1} {
  if {[string is double -strict $::ALAam] && $::ALAam > 0.0} {set short3decr [expr {-0.01 * $::ALAam}]} else {set short3decr 0.0}
  if {[string is double -strict $::EPAam] && $::EPAam > 0.0} {set long3decr [expr {-0.01 * $::EPAam}]} else {set long3decr 0.0}
  if {[string is double -strict $::DHAam] && $::DHAam > 0.0} {set long3decr [expr {$long3decr + (-0.01 * $::DHAam)}]}
  if {$short3decr == 0.0 && $long3decr == 0.0} { return }
  set iter 1.0
  while {$::FAPU1 > [n6hufa [expr {$short3 + ($iter * $short3decr)}] $short6 [expr {$long3 + ($iter * $long3decr)}] $long6 $::FASATdv $::FAMSdv $trans $::FAPUdv $::ENERC_KCALdv 1]} {
   set iter [expr {$iter + 1.0}]
   if {$iter >= 100.0} {break}
   }
  set iter [expr {$iter - 1.0}]
  if {$iter > 99.9} {set iter 99.9}
  if {[string is double -strict $::OMEGA6am] && $::OMEGA6am > 0.0} {set ::OMEGA6dv [expr {$::OMEGA6am / $pufareductionfactor}]} else {set ::OMEGA6dv $::OMEGA6dv_default}
  if {[string is double -strict $::LAam] && $::LAam > 0.0} {set ::LAdv [expr {$::LAam / $pufareductionfactor}]} else {set ::LAdv $::LAdv_default}
  if {[string is double -strict $::AAam] && $::AAam > 0.0} {set ::AAdv [expr {$::AAam / $pufareductionfactor}]} else {set ::AAdv $::AAdv_default}
  if {[string is double -strict $::OMEGA3am] && $::OMEGA3am > 0.0} {set ::OMEGA3dv [expr {$::OMEGA3am - ($iter * 0.01 * $::OMEGA3am)}]} else {set ::OMEGA3dv $::OMEGA3dv_default}
  if {[string is double -strict $::ALAam] && $::ALAam > 0.0} {set ::ALAdv [expr {$::ALAam - ($iter * 0.01 * $::ALAam)}]} else {set ::ALAdv $::ALAdv_default}
  if {[string is double -strict $::EPAam] && $::EPAam > 0.0} {set ::EPAdv [expr {$::EPAam - ($iter * 0.01 * $::EPAam)}]} else {set ::EPAdv $::EPAdv_default}
  if {[string is double -strict $::DHAam] && $::DHAam > 0.0} {set ::DHAdv [expr {$::DHAam - ($iter * 0.01 * $::DHAam)}]} else {set ::DHAdv $::DHAdv_default}
  }

 if {$current > $::FAPU1} {
  if {[string is double -strict $::LAam] && $::LAam > 0.0} {set short6decr [expr {-0.01 * $::LAam}]} else {set short6decr 0.0}
  if {[string is double -strict $::AAam] && $::AAam > 0.0} {set long6decr [expr {-0.01 * $::AAam}]} else {set long6decr 0.0}
  if {$short6decr == 0.0 && $long6decr == 0.0} { return }
  set iter 1.0
  while {$::FAPU1 < [n6hufa $short3 [expr {$short6 + ($iter * $short6decr)}] $long3 [expr {$long6 + ($iter * $long6decr)}] $::FASATdv $::FAMSdv $trans $::FAPUdv $::ENERC_KCALdv 1]} {
   set iter [expr {$iter + 1.0}]
   if {$iter >= 100.0} {break}
   }
  if {[string is double -strict $::OMEGA3am] && $::OMEGA3am > 0.0} {set ::OMEGA3dv $::OMEGA3am} else {set ::OMEGA3dv $::OMEGA3dv_default}
  if {[string is double -strict $::ALAam] && $::ALAam > 0.0} {set ::ALAdv $::ALAam} else {set ::ALAdv $::ALAdv_default}
  if {[string is double -strict $::EPAam] && $::EPAam > 0.0} {set ::EPAdv $::EPAam} else {set ::EPAdv $::EPAdv_default}
  if {[string is double -strict $::DHAam] && $::DHAam > 0.0} {set ::DHAdv $::DHAam} else {set ::DHAdv $::DHAdv_default}
  if {[string is double -strict $::OMEGA6am] && $::OMEGA6am > 0.0} {set ::OMEGA6dv [expr {($::OMEGA6am / $pufareductionfactor) - ($iter * 0.01 * ($::OMEGA6am / $pufareductionfactor))}]} else {set ::OMEGA6dv $::OMEGA6dv_default}
  if {[string is double -strict $::LAam] && $::LAam > 0.0} {set ::LAdv [expr {($::LAam / $pufareductionfactor) - ($iter * 0.01 * ($::LAam / $pufareductionfactor))}]} else {set ::LAdv $::LAdv_default}
  if {[string is double -strict $::AAam] && $::AAam > 0.0} {set ::AAdv [expr {($::AAam / $pufareductionfactor) - ($iter * 0.01 * ($::AAam / $pufareductionfactor))}]} else {set ::AAdv $::AAdv_default}
  if {$::OMEGA6dv <= 0.0} {set ::OMEGA6dv $::OMEGA6dv_default}
  if {$::LAdv <= 0.0} {set ::LAdv $::LAdv_default}
  if {$::AAdv <= 0.0} {set ::AAdv $::AAdv_default}
  }

 }

#end auto_cal
}

set badPCF {

proc badPCF {food food1 selection message} {

 if {$message == 0} {
  tk_messageBox -type ok -title $::version -message "\"$food\" does not have a value for $selection."
  } elseif {$message == 1} {
  tk_messageBox -type ok -title $::version -message "\"$food\" is too similar in nutrient composition to another food, \"$food1\"."
  } elseif {$message == 2} {
  tk_messageBox -type ok -title $::version -message "$selection is set to \"Adjust to my meals\"."
  }

 }

#end badPCF
}

set dropoutvf {

proc dropoutvf {args} {

 uplevel #0 {
  trace remove variable gramsvf write GramChangevf
  trace remove variable ouncesvf write OunceChangevf
  trace remove variable caloriesvf write CalChangevf
  trace remove variable Amountvf write AmountChangevf
  trace remove variable Msre_Descvf write ServingChange
  }

 }

#end dropoutvf
}

set format_meal_id {

proc format_meal_id {meal_id} {
 if {$meal_id == ""} {return ""}
 set mealno [string range $meal_id 8 9]
 if {$mealno == "08"} {set mealno 8}
 set mealno [expr {int($mealno)}]
 return \"[clock format [clock scan [string range $meal_id 0 7] -format {%Y%m%d}] -format {%a %b %e, %Y #}]${mealno}\"

 }

#end format_meal_id
}

set mealchange {

proc mealchange {args} {

 if {! $::realmealchange} {
 set ::realmealchange 1
 return
 }
 CancelSearch
 if {!$::ALTGUI} {
  grid remove $::rmMainPane
  grid remove .nut.rm.setmpd
  .nut.rm.recipebutton configure -state normal
  set ::rmMainPane .nut.rm.frmenu
  grid $::rmMainPane
  grid .nut.rm.grams
  grid .nut.rm.ounces
  grid .nut.rm.analysismeal
  } else {
  place forget $::rmMainPane
  place forget .nut.rm.setmpd
  .nut.rm.recipebutton configure -state normal
  set ::rmMainPane .nut.rm.frmenu
  place $::rmMainPane -relx 0.0 -rely 0.25 -relheight 0.75 -relwidth 1.0
  place .nut.rm.grams -relx 0.87 -rely 0.0046296296 -relheight 0.044444444 -relwidth 0.11
  place .nut.rm.ounces -relx 0.87 -rely 0.0490740736 -relheight 0.044444444 -relwidth 0.11
  place .nut.rm.analysismeal -relx 0.87 -rely 0.14722222 -relheight 0.044444444 -relwidth 0.11
  }
 set julian [expr { ($::mealoffset / $::meals_per_day) + [clock format [clock scan [expr {$::mealbase / 100}] -format {%Y%m%d}] -format {%J}] }]
 set mealnum [expr { $::mealbase % 100 + $::mealoffset % $::meals_per_day }]
 if {$mealnum > $::meals_per_day} {
  set julian [expr {$julian + 1}]
  set mealnum [expr {$mealnum - $::meals_per_day}]
  }
 set ::currentmeal [clock format [clock scan $julian -format {%J}] -format {%Y%m%d}]
 set ::currentmeal [expr {$::currentmeal * 100 + $mealnum}]
 set ::mealchoice "Meal [format_meal_id $::currentmeal]"
 .nut.rm.scale configure -label $::mealchoice
 if {abs($::mealoffset) == 100} {after 500 recenterscale $::currentmeal}
 set count -1
 foreach mf $::MealfoodStatus {
  incr count
  if {$mf == "Hidden" || $mf == "Available"} {continue}
  MealfoodDelete $count $mf 0
  }
 db eval {update options set lastmeal_rm = $::currentmeal}
 if {[db eval "select count(NDB_No) from mealfoods where meal_date = [expr {$::currentmeal / 100}] and meal = [expr {$::currentmeal % 100}]"] > 0} {
  db eval "select mealfoods.NDB_No, Shrt_Desc from mealfoods, food_des where meal_date = [expr {$::currentmeal / 100}] and meal = [expr {$::currentmeal % 100}] and food_des.NDB_No = mealfoods.NDB_No order by Shrt_Desc" {
   MealfoodWidget $Shrt_Desc $NDB_No
   }
  RefreshMealfoodQuantities
  db eval {select * from rm} { }
  } else {
  db eval {select * from rm_zero} { }
  }
 }

#end mealchange
}

set n6hufa {

proc n6hufa {short3 short6 long3 long6 sat mono trans pufa cals float} {

 if {$short3 == "" &&  $short6 == "" && $long3 == "" && $long6 == ""} {
  if {!$float} {return "\[No Data\]"} else {return 0.0}
  }
 if {![string is double -strict $short3]} {set short3 0.0}
 if {![string is double -strict $short6]} {set short6 0.0}
 if {![string is double -strict $long3]} {set long3 0.0}
 if {![string is double -strict $long6]} {set long6 0.0}
 if {![string is double -strict $sat]} {set sat 0.0}
 if {![string is double -strict $mono]} {set mono 0.0}
 if {![string is double -strict $trans]} {set trans 0.0}
 if {![string is double -strict $pufa]} {set pufa 0.0}
 if {![string is double -strict $cals]} {set cals 0.0}
 if { $cals == 0.0 } {
  if {!$float} {return "0 / 0"} else {return 0.0}
  }
 if { $short3 == 0.0 && $short6 == 0.0 && $long3 == 0.0 && $long6 == 0.0 } {
  if {!$float} {return "\[No Data\]"} else {return 0.0}
  }
 set p3 [expr { 900.0 * $short3 / $cals }]
 set p6 [expr { 900.0 * $short6 / $cals }]
 set h3 [expr { 900.0 * $long3 / $cals }]
 set h6 [expr { 900.0 * $long6 / $cals }]
 set o  [expr { 900.0 * ($sat + $mono + $pufa - $short3 - $short6 - $long3 - $long6) / $cals }]
 if { $p6 == 0.0 } {set p6 0.000000001}
 if { $h6 == 0.0 } {set h6 0.000000001}
 set answer [db eval {select 100.0 / (1.0 + 0.0441/$p6 * (1.0 + $p3/0.0555 + $h3/0.005 + $o/5.0 + $p6/0.175)) + 100.0 / (1.0 + 0.7/$h6 * (1.0 + $h3/3.0))}]
 if { $answer > 90.0 } {
  if {!$float} {return "90 / 10"} else {return 90.0}
  } elseif { $answer < 15.0 } {
  if {!$float} {return "15 / 85"} else {return 15.0}
  } else {
  if {!$float} {
   set answer [expr {round($answer)}]
   return "$answer / [expr {100 - $answer}]"
   } else {
   return $answer
   }
  }

 }

#end n6hufa
}

set recenterscale {

proc recenterscale {currentmeal} {

 set ::mealoffset 0
 set ::mealbase $currentmeal

 }

#end recenterscale
}

set setPCF {

proc setPCF {seqno ndb varNameSel args} {

 upvar 0 $varNameSel selection
 if {$selection != "No Auto Portion Control"} {
  db eval {select Tagname from nutr_def where NutrDesc = $selection} { }
  db eval "select 1.0 / $Tagname / cast ($::meals_per_day as real) as PCFfactor from food_des where NDB_No = $ndb" { }
  if {$PCFfactor == "\[No Data\]"} {
   set saveselection $selection
   db eval {select Long_Desc from food_des where NDB_No = $ndb} { }
   ${::rmMenu}.menu.foodPCF${seqno} current 0
   ${::rmMenu}.menu.foodPCF${seqno} configure  -style rm.TCombobox
   after idle [list badPCF $Long_Desc NULL $saveselection 0]
   return
   }
  set opt [db eval {select nutopt from nutr_def where NutrDesc = $selection}]
  if {$opt == -1} {
   set saveselection $selection
   set Long_Desc {}
   ${::rmMenu}.menu.foodPCF${seqno} current 0
   ${::rmMenu}.menu.foodPCF${seqno} configure  -style rm.TCombobox
   after idle [list badPCF $Long_Desc NULL $saveselection 2]
   return
   }
  set prevseqno [lsearch -exact $::MealfoodPCF $Tagname]
  set prevndb [lindex $::MealfoodStatus $prevseqno]
  if {$prevseqno > -1 && $prevseqno != $seqno} {
   set ::MealfoodPCF [lreplace $::MealfoodPCF $prevseqno $prevseqno "NULL"]
   ${::rmMenu}.menu.foodPCF${prevseqno} current 0
   ${::rmMenu}.menu.foodPCF${prevseqno} configure  -style rm.TCombobox
   ${::rmMenu}.menu.foodspin${prevseqno} configure  -state readonly
   trace remove variable ::${Tagname}dv write "PCF $prevseqno $prevndb"
   trace remove variable ::${Tagname}rm write "PCF $prevseqno $prevndb"
   }
  set oldtag [lindex $::MealfoodPCF $seqno]
  if {$oldtag != "NULL" && $prevseqno != $seqno} {
   trace remove variable ::${oldtag}dv write "PCF $seqno $ndb"
   trace remove variable ::${oldtag}rm write "PCF $seqno $ndb"
   }
  set ::MealfoodPCF [lreplace $::MealfoodPCF $seqno $seqno $Tagname]
  set ::MealfoodPCFfactor [lreplace $::MealfoodPCFfactor $seqno $seqno $PCFfactor]
  ${::rmMenu}.menu.foodPCF${seqno} configure  -style nut.TCombobox
  ${::rmMenu}.menu.foodspin${seqno} configure  -state disabled
  if {$prevseqno != $seqno} {
   trace add variable ::${Tagname}dv write "PCF $seqno $ndb"
   trace add variable ::${Tagname}rm write "PCF $seqno $ndb"
   RefreshMealfoodQuantities
   PCF $seqno $ndb
   }
  } else {
  set oldtag [lindex $::MealfoodPCF $seqno]
  if {$oldtag == "NULL"} {return}
  set ::MealfoodPCF [lreplace $::MealfoodPCF $seqno $seqno "NULL"]
  ${::rmMenu}.menu.foodPCF${seqno} configure  -style rm.TCombobox
  ${::rmMenu}.menu.foodspin${seqno} configure  -state readonly
  trace remove variable ::${oldtag}dv write "PCF $seqno $ndb"
  trace remove variable ::${oldtag}rm write "PCF $seqno $ndb"
  }

 }

#end setPCF
}

set setRefDesc {

proc setRefDesc {ref_desc} {

 if {$ref_desc == ""} {
  .nut.vf.refusemb.m entryconfigure 0 -label "No refuse description provided"
  } else {
  .nut.vf.refusemb.m entryconfigure 0 -label $ref_desc
  }

 }

#end setRefDesc
}

set tuneinvf {

proc tuneinvf {args} {

 uplevel #0 {
  trace add variable gramsvf write GramChangevf
  trace add variable ouncesvf write OunceChangevf
  trace add variable caloriesvf write CalChangevf
  trace add variable Amountvf write AmountChangevf
  trace add variable Msre_Descvf write ServingChange
  }

 }

#end tuneinvf
}

set update_am {

proc update_am {} {
 db eval {select count(meal_id) as "::mealcount" from meals} { }
 if {$::mealcount > 0} {
  .nut.am.mealsb configure -from 1 -to $::mealcount
  db eval {select * from am} { }
  auto_cal
  } else {
  .nut.am.mealsb configure -from 0 -to 0
  set ::mealrange ""
  .nut.am.meallabel configure -text " meals:"
  set ::meals_to_analyze_am 0
  db eval {select * from am_zero} { }
  }
 set ::StoryIsStale 1
 }

#end update_am
}

set pbprog {

proc pbprog {barnum bailey} {
 set ::pbar($barnum) [expr {$::pbar($barnum) + $bailey}]
 update
 }

#end pbprog
}

set pbprog1 {

proc pbprog1 { } {
 incr ::pbprog1counter
 if {$::pbprog1counter % 250 == 0} {
  set ::pbar(5) [expr {$::pbar(5) + 0.10}]
  update
  }
 }

#end pbprog1
}

set theusualPopulateMenu {

proc theusualPopulateMenu { } {

 .nut.rm.theusual.m.add delete 0 end
 .nut.rm.theusual.m.save delete 0 end
 .nut.rm.theusual.m.delete delete 0 end
 set tu_names [db eval {select distinct meal_name from theusual}]
 foreach name $tu_names {
  .nut.rm.theusual.m.add add command -label "Add $name" -command [list theusualAdd $name] -background "#FF9428"
  .nut.rm.theusual.m.save add command -label "Save $name" -command [list theusualSave $name] -background "#FF9428"
  .nut.rm.theusual.m.delete add command -label "Delete $name" -command [list theusualDelete $name] -background "#FF9428"
  }
 .nut.rm.theusual.m.save add separator -background "#FF9428"
 .nut.rm.theusual.m.save add command -label "Save as ..." -command theusualSaveNew -background "#FF9428"
 }

#end theusualPopulateMenu
}

set theusualAdd {

proc theusualAdd {mealname} {
 set addlist [db eval {select t.NDB_No, PCF, Shrt_Desc from theusual t, food_des f using (NDB_No) where meal_name = $mealname order by Shrt_Desc asc}]
 if {[llength $addlist] > 0} {
  if {!$::ALTGUI} {
   grid remove .nut.rm.setmpd
   grid remove .nut.rm.frlistbox
   grid remove .nut.rm.searchcancel
   grid .nut.rm.analysismeal
   } else {
   place forget .nut.rm.setmpd
   place forget .nut.rm.frlistbox
   place forget .nut.rm.searchcancel
   place .nut.rm.analysismeal -relx 0.87 -rely 0.14722222 -relheight 0.044444444 -relwidth 0.11
   }
  SwitchToMenu
  foreach {ndb pcf Shrt_Desc} $addlist {
   db eval {select whectograms from weight where NDB_No = $ndb order by Seq limit 1} {
    db eval {insert or replace into mealfoods values ($::currentmeal / 100, $::currentmeal % 100, $ndb, $whectograms)}
    set seq [MealfoodWidget $Shrt_Desc $ndb]
    ${::rmMenu}.menu.foodPCF${seq} set $pcf
    }
   }
  RefreshMealfoodQuantities
  }
 db eval {select * from rm} { }
 }

#end theusualAdd
}

set theusualSave {

proc theusualSave {mealname} {
 set ndblist [db eval {select NDB_No from mealfoods where meal_date = $::currentmeal / 100 and meal = $::currentmeal % 100}]
 if {[llength $ndblist] > 0} {
  db eval {delete from theusual where meal_name = $mealname}
  foreach ndb $ndblist {
   set pcfName "::PCFchoice$ndb"
   upvar 0 $pcfName pcf
   db eval {insert into theusual values ( $mealname, $ndb, $pcf )}
   }
  }
 }

#end theusualSave
}

set theusualSaveNew {

proc theusualSaveNew {args} {
 if {!$::ALTGUI} {
  grid .nut.rm.newtheusuallabel
  grid .nut.rm.newtheusualentry
  grid .nut.rm.newtheusualbutton
  } else {
  place .nut.rm.newtheusuallabel -relx 0.39 -rely 0.03 -relheight 0.09 -relwidth 0.33
  place .nut.rm.newtheusualentry -relx 0.31 -rely 0.12 -relheight 0.045 -relwidth 0.33
  place .nut.rm.newtheusualbutton -relx 0.65 -rely 0.12 -relheight 0.045 -relwidth 0.07
  }
 }

#end theusualSaveNew
}

set theusualNewName {

proc theusualNewName {args} {
 if {$::newtheusual == ""} {set ::newtheusual default}
 theusualSave $::newtheusual
 if {!$::ALTGUI} {
  grid remove .nut.rm.newtheusuallabel
  grid remove .nut.rm.newtheusualentry
  grid remove .nut.rm.newtheusualbutton
  } else {
  place forget .nut.rm.newtheusuallabel
  place forget .nut.rm.newtheusualentry
  place forget .nut.rm.newtheusualbutton
  }
 set ::newtheusual ""
 }

#end theusualNewName
}

set theusualDelete {

proc theusualDelete {mealname} {
 db eval {delete from theusual where meal_name = $mealname}
 }

#end theusualDelete
}

set monoright {

proc monoright {string len} {
 set whatever "              $string"
 return [string range $whatever end-$len end]
 }

#end monoright
}

set rank2vf {

proc rank2vf {args} {
 set what {*}[.nut.ts.frranking.ranking selection]
 FoodChoicevf_alt [lindex $what 0] [lindex $what 1] 0
 }

#end rank2vf
}

set rm2vf {

proc rm2vf {seq} {
 set ndb [lindex $::MealfoodStatus $seq]
 set qty [db eval {select mhectograms from mealfoods where NDB_No = $ndb and meal_date = $::currentmeal / 100 and meal = $::currentmeal % 100}]
 FoodChoicevf_alt $ndb [expr {$qty * 100.0}] 1
 }

#end rm2vf
}

set changedv_vitmin {

proc changedv_vitmin {nut} {

 if {!$::ALTGUI} {
  grid .nut.po.pane.optframe.vite_l
  grid .nut.po.pane.optframe.vite_s
  grid .nut.po.pane.optframe.vite_cb1
  grid .nut.po.pane.optframe.vite_cb2
  } else {
  place .nut.po.pane.optframe.vite_l -relx 0.0 -rely 0.75 -relheight 0.04444444 -relwidth 0.25
  place .nut.po.pane.optframe.vite_s -relx 0.265 -rely 0.75 -relheight 0.04444444 -relwidth 0.14
  place .nut.po.pane.optframe.vite_cb1 -relx 0.44 -rely 0.75 -relheight 0.04444444 -relwidth 0.23
  place .nut.po.pane.optframe.vite_cb2 -relx 0.69 -rely 0.75 -relheight 0.04444444 -relwidth 0.23
  }

 db eval {select Tagname as tag, Units as un from nutr_def where NutrDesc = $nut} { }
 .nut.po.pane.optframe.vite_l configure -text "$nut $un"
 .nut.po.pane.optframe.vite_cb1 configure -command [list ChangePersonalOptions $tag]
 .nut.po.pane.optframe.vite_cb2 configure -command [list ChangePersonalOptions $tag]
 set dvvar "::${tag}dv"
 set optvar "::${tag}opt"
 upvar #0 $dvvar vitmindv $optvar vitminopt

 if {$vitminopt == -1.0} {
  .nut.po.pane.optframe.vite_s configure -state disabled -textvariable $dvvar
  set ::vitminpo -1
  } elseif {$vitminopt == 0.0} {
  .nut.po.pane.optframe.vite_s configure -state disabled -textvariable $dvvar
  set ::vitminpo 2
  } else {
  .nut.po.pane.optframe.vite_s configure -state normal -textvariable $optvar
  set ::vitminpo 0
  }

 }

#end changedv_vitmin
}

set Main_alt {

set DiskDB [file nativename $DiskDB]

db eval {select max(version) as "::version" from version} { }

db eval {select code from tcl_code where name = 'get_procs_from_db'} {
 eval $code
 }
get_procs_from_db

set need_load 0
if {[file exists "NUTR_DEF.txt"]} {set need_load 1}
set ::THREADS 0
set ::DiskDB $DiskDB
set ::LegacyFileDir $::LegacyFileDir

if {$need_load} {
 if {![catch {package require Thread}]} {
  set ::THREADS 1
  set ::GUI_THREAD [thread::id]
  set ::SQL_THREAD [thread::create " package require sqlite3 ; sqlite3 db $DiskDB; db timeout 10000 ; [info body get_procs_from_db] ; set ::THREADS 1 ; set ::GUI_THREAD $::GUI_THREAD ; set ::DiskDB $DiskDB ; set ::LegacyFileDir $::LegacyFileDir ; thread::wait"]
  }
 }

package require Tk

if {$appSize > 1.3} {set appSize 1.3}
if {$appSize < 0.7} {set appSize 0.7}
set gr 1.6180339887
if {[winfo vrootheight .] * $gr > [winfo vrootwidth .]} {
 set vroothGR [expr {int([winfo vrootwidth .] / $gr)}]
 set vrootwGR [winfo vrootwidth .]
 } else {
 set vroothGR [winfo vrootheight .]
 set vrootwGR [expr {int([winfo vrootheight .] * $gr)}]
 }
set ::magnify [expr {$appSize / 1.3 * $vroothGR / 500.0}]
set ::scrollwidth 8
foreach font [font names] {
 font configure $font -size [expr {int($::magnify * [font configure $font -size])}]
 }
option add *Dialog.msg.wrapLength [expr {400 * $::magnify}]
option add *Dialog.dtl.wrapLength [expr {400 * $::magnify}]

wm geometry . [expr {int($appSize / 1.3 * $vrootwGR)}]x[expr {int($appSize / 1.3 * $vroothGR)}]
wm title . $::version
catch {set im [image create photo -file nuticon.gif]}
catch {wm iconphoto . -default $im}
bind . <Destroy> {
 if {$::THREADS} {
  thread::release $::SQL_THREAD
  }
 rename unknown ""
 rename _original_unknown unknown
 db close
 exit 0
 }

ttk::style theme use default
ttk::style configure lf.Horizontal.TProgressbar -background "#006400"
if {$::magnify > 0.0} {ttk::style configure nut.Treeview -font TkFixedFont -background "#00FF00" -rowheight [expr {int(round($::magnify * 15.0))}]} else {ttk::style configure nut.Treeview -font TkFixedFont -background "#00FF00"}
ttk::style configure am.TFrame -background "#00FFFF"
ttk::style configure am.TLabel -background "#00FFFF"
ttk::style configure am.TNotebook -background "#00FFFF"
ttk::style configure am.TSpinbox -background "#00FFFF"
ttk::style configure ar.TButton -background "#BFD780"
ttk::style configure ar.TFrame -background "#7FBF00"
ttk::style configure ar.TLabel -background "#7FBF00"
ttk::style configure ar.TNotebook -background "#7FBF00"
ttk::style configure ar.TRadiobutton -background "#7FBF00"
ttk::style configure lf.Horizontal.TProgressbar -background "#006400"
ttk::style configure lightmeal.TButton -background "#FF9428"
ttk::style configure meal.Horizontal.TProgressbar -background "#00FF00"
ttk::style configure meal.TButton -background "#FF7F00"
ttk::style configure meal.TMenubutton -background "#FF9428"
ttk::style configure meal.TRadiobutton -background "#FF7F00"
ttk::style configure nut.TCombobox -background "#FF7F00"
ttk::style configure nutbutton.TButton -background "#FFFF00"
ttk::style configure po.TButton -background "#5454FF" -foreground "#FFFF00"
ttk::style configure po.TCheckbutton -background "#5454FF" -foreground "#FFFF00"
ttk::style configure po.TFrame -background "#5454FF"
ttk::style configure po.TLabel -background "#5454FF" -foreground "#FFFF00"
ttk::style configure po.TMenubutton -background "#5454FF" -foreground "#FFFF00"
ttk::style configure po.red.TButton -background "#5454FF" -foreground "#FF0000"
ttk::style configure recipe.TButton -background "#7FBF00"
ttk::style configure rm.TCombobox -background "#FF7F00"
ttk::style configure rm.TFrame -background "#FF7F00"
ttk::style configure rm.TLabel -background "#FF7F00"
ttk::style configure rmright.TLabel -background "#FF7F00" -anchor e
ttk::style configure rm.TNotebook -background "#FF7F00"
ttk::style configure rm.TSpinbox -background "#FF7F00"
ttk::style configure ts.TCheckbutton -background "#00FF00" -foreground "#000000"
ttk::style configure ts.TCombobox -background "#00FF00"
ttk::style configure ts.TFrame -background "#FFFF00"
ttk::style configure ts.TLabel -background "#FFFF00"
ttk::style configure vf.TButton -background "#00FF00"
ttk::style configure vf.TCombobox -background "#00FF00"
ttk::style configure vf.TFrame -background "#00FF00"
ttk::style configure vf.TLabel -background "#00FF00"
ttk::style configure vfleft.TLabel -background "#00FF00" -anchor w
ttk::style configure vfright.TLabel -background "#00FF00" -anchor e
ttk::style configure vftop.TLabel -background "#00FF00" -anchor n
ttk::style configure vf.TNotebook -background "#00FF00"
ttk::style configure vf.TSpinbox -background "#00FF00"
ttk::style map ar.TRadiobutton -indicatorcolor { selected "#FF0000" }
ttk::style map meal.TRadiobutton -indicatorcolor { selected "#FF0000" }
ttk::style map nut.TCombobox -fieldbackground { readonly "#FFFF00" }
ttk::style map nut.TCombobox -selectbackground { readonly "#FFFF00" }
ttk::style map nut.TCombobox -selectforeground { readonly "#000000" }
ttk::style map po.TButton -foreground { active "#000000" }
ttk::style map po.TCheckbutton -foreground { active "#000000" }
ttk::style map po.TCheckbutton -indicatorcolor { selected "#FF0000" }
ttk::style map po.TCombobox -fieldbackground { readonly "#FFFFFF" }
ttk::style map po.TMenubutton -foreground { active "#000000" }
ttk::style map po.red.TButton -foreground { active "#FF0000" }
ttk::style map rm.TCombobox -fieldbackground { readonly "#FF9428" }
ttk::style map rm.TCombobox -selectbackground { readonly "#FF9428" }
ttk::style map rm.TCombobox -selectforeground { readonly "#000000" }
ttk::style map ts.TCheckbutton -background { active "#00FF00" }
ttk::style map ts.TCheckbutton -foreground { active "#000000" }
ttk::style map ts.TCheckbutton -indicatorcolor { selected "#FF0000" }
ttk::style map ts.TCombobox -fieldbackground { readonly "#00FF00" }
ttk::style map ts.TCombobox -selectbackground { readonly "#00FF00" }
ttk::style map ts.TCombobox -selectforeground { readonly "#000000" }
ttk::style map vf.TCombobox -fieldbackground { readonly "#00FF00" }
set background(am) "#00FFFF"
set background(rm) "#FF7F00"
set background(vf) "#00FF00"
set background(ar) "#7FBF00"

trace add variable ::FIRSTMEALam write SetMealRange_am
trace add variable ::LASTMEALam write SetMealRange_am

set ::SetDefanalPreviousValue 0
set ::LastSetDefanal 0
set ::MealfoodSequence 0
set ::MealfoodStatus {}
set ::MealfoodPCF {}
set ::MealfoodPCFfactor {}
set ::lastrmq 0
set ::lastamrm 0
set ::lastac 0
set ::lastbubble 0
set ::BubbleMachineStatus 0
set ::realmealchange 0
set ::newtheusual ""
set gramsvf 0
set ouncesvf 0
set caloriesvf 0
set Amountvf 0
set ::PCFchoices {{No Auto Portion Control} {Protein} {Non-Fiber Carb} {Total Fat} {Vitamin A} {Thiamin} {Riboflavin} {Niacin} {Panto. Acid} {Vitamin B6} {Folate} {Vitamin B12} {Vitamin C} {Vitamin D} {Vitamin E} {Vitamin K1} {Calcium} {Copper} {Iron} {Magnesium} {Manganese} {Phosphorus} {Potassium} {Selenium} {Zinc} {Glycine} {Retinol} {Fiber}}
set ::rmMenu .nut.rm.frmenu

ttk::notebook .nut
place .nut -relx 0.0 -rely 0.0 -relheight 1.0 -relwidth 1.0
frame .nut.am -background "#00FFFF"
frame .nut.rm -background "#FF7F00"
frame .nut.ar -background "#7FBF00"
frame .nut.vf -background "#00FF00"
frame .nut.po -background "#5454FF"
frame .nut.ts -background "#FFFF00"
frame .nut.qn
.nut add .nut.am -text "Analyze Meals"
.nut add .nut.rm -text "Record Meals & Recipes"
.nut add .nut.ar -text "Record Meals & Recipes"
.nut add .nut.vf -text "View Foods"
.nut add .nut.po -text "Personal Options"
.nut add .nut.ts -text "The Story"
.nut add .nut.qn -text "Quit NUT"
.nut hide .nut.ar
.nut hide .nut.ts

pack [ttk::label .nut.qn.label -text "\nNUT has ended."]
bind .nut <<NotebookTabChanged>> NutTabChange

ttk::label .nut.am.herelabel -text "Here are \"Daily Value\" average percentages for your previous " -style am.TLabel -anchor e
spinbox .nut.am.mealsb -width 5 -justify right -from 1 -to 999999 -increment 1 -textvariable ::meals_to_analyze_am -buttonbackground "#00FFFF"
ttk::label .nut.am.meallabel -text " meals:" -style am.TLabel
ttk::label .nut.am.rangelabel -textvariable mealrange -style am.TLabel -anchor center
place .nut.am.herelabel -relx 0.0 -rely 0.088148146  -relheight 0.044444444 -relwidth 0.64
place .nut.am.mealsb -relx 0.64 -rely 0.088148146  -relheight 0.044444444 -relwidth 0.12
place .nut.am.meallabel -relx 0.76 -rely 0.088148146  -relheight 0.044444444 -relwidth 0.12
place .nut.am.rangelabel -relx 0.0 -rely 0.15  -relheight 0.044444444 -relwidth 1.0

scale .nut.rm.scale -background "#FF9428" -width [expr {$::magnify * 11}] -sliderlength [expr {$::magnify * 20}] -showvalue 0 -orient horizontal -variable ::mealoffset -from -100 -to 100 -command mealchange
place .nut.rm.scale -relx 0.0058 -rely 0.0046296296 -relheight 0.1 -relwidth 0.24

menubutton .nut.rm.theusual -text "Customary Meals" -direction right -background "#FF9428" -anchor center -relief raised -menu .nut.rm.theusual.m
place .nut.rm.theusual -relx 0.0058 -rely 0.12 -relheight 0.05 -relwidth 0.2
menu .nut.rm.theusual.m -background "#FF9428" -tearoff 0 -postcommand theusualPopulateMenu
.nut.rm.theusual.m add cascade -label "Add Customary Meal to this meal" -menu .nut.rm.theusual.m.add -background "#FF9428"
.nut.rm.theusual.m add cascade -label "Save this meal as a Customary Meal" -menu .nut.rm.theusual.m.save -background "#FF9428"
.nut.rm.theusual.m add cascade -label "Delete a Customary Meal" -menu .nut.rm.theusual.m.delete -background "#FF9428"
menu .nut.rm.theusual.m.add -tearoff 0
menu .nut.rm.theusual.m.save -tearoff 0
menu .nut.rm.theusual.m.delete -tearoff 0

Button .nut.rm.recipebutton -background "#FF9428" -anchor center -text "Save as a Recipe" -helptext "Saves as a Recipe to supplement and is searchable along with the FDA nutrition database" -relief raised -state disabled -command RecipeSaveAs
place .nut.rm.recipebutton -relx 0.0058 -rely 0.185 -relheight 0.045 -relwidth 0.2

ttk::label .nut.rm.newtheusuallabel -style rm.TLabel -text "Type new Customary Meal name and press Save" -wraplength [expr {$::magnify * 175}] -justify center
#place .nut.rm.newtheusuallabel -relx 0.39 -rely 0.03 -relheight 0.09 -relwidth 0.33

ttk::entry .nut.rm.newtheusualentry -textvariable ::newtheusual
set ::newtheusual ""
#place .nut.rm.newtheusualentry -relx 0.31 -rely 0.12 -relheight 0.045 -relwidth 0.33

Button .nut.rm.newtheusualbutton -anchor center -text "Save" -command theusualNewName
#place .nut.rm.newtheusualbutton -relx 0.65 -rely 0.12 -relheight 0.045 -relwidth 0.07

ttk::radiobutton .nut.rm.grams -text "Grams" -width 6 -variable ::GRAMSopt -value 1 -style meal.TRadiobutton
ttk::radiobutton .nut.rm.ounces -text "Ounces" -width 6 -variable ::GRAMSopt -value 0 -style meal.TRadiobutton
#place .nut.rm.grams -relx 0.87 -rely 0.0046296296 -relheight 0.044444444 -relwidth 0.11
#place .nut.rm.ounces -relx 0.87 -rely 0.0490740736 -relheight 0.044444444 -relwidth 0.11
Button .nut.rm.analysismeal -text "Analysis" -background "#FF9428" -command SwitchToAnalysis -relief raised
#place .nut.rm.analysismeal -relx 0.87 -rely 0.14722222 -relheight 0.044444444 -relwidth 0.11

menubutton .nut.rm.setmpd -background "#FF9428" -text "Delete All Meals and Set Meals Per Day" -relief raised -menu .nut.rm.setmpd.m
place .nut.rm.setmpd -relx 0.667 -rely 0.006 -relheight 0.045 -relwidth 0.33

ttk::label .nut.rm.fslabel -text "Food Search" -style rmright.TLabel
place .nut.rm.fslabel -relx 0.29 -rely 0.19629629  -relheight 0.044444444 -relwidth 0.1
ttk::combobox .nut.rm.fsentry -takefocus 0 -textvariable ::like_this_rm -style rm.TCombobox
place .nut.rm.fsentry -relx 0.4 -rely 0.19629629  -relheight 0.044444444 -relwidth 0.45
ttk::progressbar .nut.rm.bubblemachine -style meal.Horizontal.TProgressbar -orient horizontal -mode indeterminate
#place .nut.rm.bubblemachine -relx 0.4 -rely 0.19629629  -relheight 0.044444444 -relwidth 0.45

Button .nut.rm.searchcancel -text "Cancel" -width 6 -command CancelSearch -background "#00FF00"
#place .nut.rm.searchcancel -relx 0.86 -rely 0.19629629  -relheight 0.044444444 -relwidth 0.09

ttk::frame .nut.rm.frlistbox -style rm.TFrame
#place .nut.rm.frlistbox -relx 0.0 -rely 0.25 -relheight 0.75 -relwidth 1.0
grid propagate .nut.rm.frlistbox 0
grid [tk::listbox .nut.rm.frlistbox.listbox -listvariable foodsrm -yscrollcommand ".nut.rm.frlistbox.scrollv set" -xscrollcommand ".nut.rm.frlistbox.scrollh set" -background "#FF7F00" ] -row 0 -column 0 -sticky nsew
grid [scrollbar .nut.rm.frlistbox.scrollv -width [expr {$::magnify * $::scrollwidth}] -relief sunken -orient vertical -command ".nut.rm.frlistbox.listbox yview"] -row 0 -column 1 -sticky nsew
grid [scrollbar .nut.rm.frlistbox.scrollh -width [expr {$::magnify * $::scrollwidth}] -relief sunken -orient horizontal -command ".nut.rm.frlistbox.listbox xview"] -row 1 -column 0 -sticky nswe
grid rowconfig .nut.rm.frlistbox 0 -weight 1 -minsize 0
grid columnconfig .nut.rm.frlistbox 0 -weight 1 -minsize 0

bind .nut.rm.frlistbox.listbox <<ListboxSelect>> FoodChoicerm
trace add variable ::like_this_rm write FindFoodrm
bind .nut.rm.fsentry <FocusIn> FoodSearchrm

ttk::frame .nut.rm.frmenu -style rm.TFrame
#place .nut.rm.frmenu -relx 0.0 -rely 0.25 -relheight 0.75 -relwidth 1.0
grid propagate .nut.rm.frmenu 0
grid [tk::text .nut.rm.frmenu.menu -yscrollcommand ".nut.rm.frmenu.scrollv set" -state disabled -wrap none -inactiveselectbackground {} -background "#FF7F00" -cursor [. cget -cursor] ] -row 0 -column 0 -sticky nsew
grid [scrollbar .nut.rm.frmenu.scrollv -width [expr {$::magnify * $::scrollwidth}] -relief sunken -orient vertical -command ".nut.rm.frmenu.menu yview"] -row 0 -column 1 -sticky nsew
grid rowconfig .nut.rm.frmenu 0 -weight 1 -minsize 0
grid columnconfig .nut.rm.frmenu 0 -weight 1 -minsize 0

ttk::label .nut.vf.label -textvariable Long_Desc -style vftop.TLabel -wraplength [expr {$::magnify * 250}]
place .nut.vf.label -relx 0.33 -rely 0.015 -relheight 0.12759259 -relwidth 0.33

set ratio_widget_height_to_spacer 9.6
tk::spinbox .nut.vf.sb0 -width 5 -justify right -from -9999 -to 9999 -increment 1 -textvariable gramsvf -buttonbackground "#00FF00"
tk::spinbox .nut.vf.sb1 -width 5 -justify right -from -999 -to 999 -increment 0.1 -textvariable ouncesvf -buttonbackground "#00FF00"
tk::spinbox .nut.vf.sb2 -width 5 -justify right -from -9999 -to 9999 -increment 1 -textvariable caloriesvf -buttonbackground "#00FF00"
tk::spinbox .nut.vf.sb3 -width 5 -justify right -from -999 -to 999 -increment 0.1 -textvariable Amountvf -buttonbackground "#00FF00"
menubutton .nut.vf.refusemb -background "#00FF00" -text "Refuse" -direction below -relief raised -menu .nut.vf.refusemb.m
menu .nut.vf.refusemb.m -tearoff 0 -background "#00FF00"
.nut.vf.refusemb.m add command -label "No refuse description provided"
place .nut.vf.sb0 -relx 0.0458 -rely 0.0046296296 -relheight 0.044444444 -relwidth 0.08
place .nut.vf.sb1 -relx 0.0458 -rely 0.0490740736 -relheight 0.044444444 -relwidth 0.08
place .nut.vf.sb2 -relx 0.0458 -rely 0.098148146  -relheight 0.044444444 -relwidth 0.08
place .nut.vf.sb3 -relx 0.0458 -rely 0.14722222   -relheight 0.044444444 -relwidth 0.08
place .nut.vf.refusemb -relx 0.0458 -rely 0.19629629  -relheight 0.044444444 -relwidth 0.08

ttk::label .nut.vf.sbl0 -text "gm." -style vfleft.TLabel
ttk::label .nut.vf.sbl1 -text "oz." -style vfleft.TLabel
ttk::label .nut.vf.sbl2 -text "cal." -style vfleft.TLabel
ttk::label .nut.vf.refusevalue -textvariable Refusevf -style vfleft.TLabel
set Refusevf "0%"
place .nut.vf.sbl0 -relx 0.133 -rely 0.0046296296 -relheight 0.044444444 -relwidth 0.05
place .nut.vf.sbl1 -relx 0.133 -rely 0.0490740736 -relheight 0.044444444 -relwidth 0.05
place .nut.vf.sbl2 -relx 0.133 -rely 0.098148146  -relheight 0.044444444 -relwidth 0.05
place .nut.vf.refusevalue -relx 0.133 -rely 0.19629629  -relheight 0.044444444 -relwidth 0.05

Button .nut.vf.meal -text "Add to Meal" -state disabled -background "#FF9428" -relief raised -command vf2rm
place .nut.vf.meal -relx 0.78 -rely 0.0490740736 -relheight 0.044444444 -relwidth 0.12
ttk::label .nut.vf.fslabel -text "Food Search" -style vfright.TLabel
place .nut.vf.fslabel -relx 0.29 -rely 0.19629629  -relheight 0.044444444 -relwidth 0.1
ttk::combobox .nut.vf.cb -textvariable Msre_Descvf -state readonly -style vf.TCombobox
place .nut.vf.cb -relx 0.133 -rely 0.14722222  -relheight 0.044444444 -relwidth 0.717
ttk::combobox .nut.vf.fsentry -textvariable like_this_vf -style vf.TCombobox
place .nut.vf.fsentry -relx 0.4 -rely 0.19629629  -relheight 0.044444444 -relwidth 0.45

ttk::frame .nut.vf.frlistbox -style vf.TFrame
#place .nut.vf.frlistbox -relx 0.0 -rely 0.25 -relheight 0.75 -relwidth 1.0
grid propagate .nut.vf.frlistbox 0
grid [tk::listbox .nut.vf.frlistbox.listbox -width 85 -height 22 -listvariable foodsvf -yscrollcommand ".nut.vf.frlistbox.scrollv set" -xscrollcommand ".nut.vf.frlistbox.scrollh set" -background "#00FF00" ] -row 0 -column 0 -sticky nsew
grid [scrollbar .nut.vf.frlistbox.scrollv -width [expr {$::magnify * $::scrollwidth}] -relief sunken -orient vertical -command ".nut.vf.frlistbox.listbox yview"] -row 0 -column 1 -sticky nsew
grid [scrollbar .nut.vf.frlistbox.scrollh -width [expr {$::magnify * $::scrollwidth}] -relief sunken -orient horizontal -command ".nut.vf.frlistbox.listbox xview"] -row 1 -column 0 -sticky nswe
grid rowconfig .nut.vf.frlistbox 0 -weight 1 -minsize 0
grid columnconfig .nut.vf.frlistbox 0 -weight 1 -minsize 0
bind .nut.vf.frlistbox.listbox <<ListboxSelect>> FoodChoicevf

label .nut.ar.name -text "Recipe Name" -background "#7FBF00" -anchor e
place .nut.ar.name -relx 0.0 -rely 0.0046296296 -relheight 0.044444444 -relwidth 0.28
ttk::entry .nut.ar.name_entry -textvariable ::RecipeName
place .nut.ar.name_entry -relx 0.28 -rely 0.0046296296 -relheight 0.044444444 -relwidth 0.55

label .nut.ar.numserv -text "Number of servings recipe makes" -background "#7FBF00" -anchor e
place .nut.ar.numserv -relx 0.0 -rely 0.0490740736 -relheight 0.044444444 -relwidth 0.28
ttk::entry .nut.ar.numserv_entry -textvariable ::RecipeServNum
place .nut.ar.numserv_entry -relx 0.28 -rely 0.0490740736 -relheight 0.044444444 -relwidth 0.1

label .nut.ar.servunit -text "Serving Unit (cup, piece, tbsp, etc.)" -background "#7FBF00" -anchor e
place .nut.ar.servunit -relx 0.0 -rely 0.098148146  -relheight 0.044444444 -relwidth 0.28
ttk::entry .nut.ar.servunit_entry -textvariable ::RecipeServUnit
place .nut.ar.servunit_entry -relx 0.28 -rely 0.098148146  -relheight 0.044444444 -relwidth 0.2

label .nut.ar.servnum -text "Number of units in one serving" -background "#7FBF00" -anchor e
place .nut.ar.servnum -relx 0.0 -rely 0.14722222 -relheight 0.044444444 -relwidth 0.28
ttk::entry .nut.ar.servnum_entry -textvariable ::RecipeServUnitNum
place .nut.ar.servnum_entry -relx 0.28 -rely 0.14722222 -relheight 0.044444444 -relwidth 0.1

label .nut.ar.weight -text "Weight of one serving (if known)" -background "#7FBF00" -anchor e
place .nut.ar.weight -relx 0.0 -rely 0.19629629 -relheight 0.044444444 -relwidth 0.27
ttk::entry .nut.ar.weight_entry -textvariable ::RecipeServWeight
place .nut.ar.weight_entry -relx 0.28 -rely 0.19629629 -relheight 0.044444444 -relwidth 0.1

Button .nut.ar.save -text "Save" -command RecipeDone -background "#00FF00"
place .nut.ar.save -relx 0.87 -rely 0.14722222 -relheight 0.044444444 -relwidth 0.11
Button .nut.ar.cancel -text "Cancel" -command RecipeCancel -background "#BFD780"
place .nut.ar.cancel -relx 0.87 -rely 0.19629629  -relheight 0.044444444 -relwidth 0.11

ttk::radiobutton .nut.ar.grams -text "Grams" -width 6 -variable ::GRAMSopt -value 1 -style ar.TRadiobutton
ttk::radiobutton .nut.ar.ounces -text "Ounces" -width 6 -variable ::GRAMSopt -value 0 -style ar.TRadiobutton
place .nut.ar.grams -relx 0.87 -rely 0.0046296296 -relheight 0.044444444 -relwidth 0.11
place .nut.ar.ounces -relx 0.87 -rely 0.0490740736 -relheight 0.044444444 -relwidth 0.11

ttk::frame .nut.po.pane -style po.TFrame
place .nut.po.pane -relx 0.0 -rely 0.0 -relheight 1.0 -relwidth 1.0
ttk::frame .nut.po.pane.optframe -style po.TFrame
place .nut.po.pane.optframe -relx 0.0 -rely 0.0 -relheight 1.0 -relwidth 0.75
ttk::frame .nut.po.pane.wlogframe -style po.TFrame
place .nut.po.pane.wlogframe -relx 0.75 -rely 0.0 -relheight 1.0 -relwidth 0.25

label .nut.po.pane.wlogframe.weight_l -text "Weight" -anchor e -background "#5454FF" -foreground "#FFFF00"
place .nut.po.pane.wlogframe.weight_l -relx 0.0 -rely 0.03 -relheight 0.04444444 -relwidth 0.45
tk::spinbox .nut.po.pane.wlogframe.weight_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::weightyintercept -disabledforeground "#000000"
place .nut.po.pane.wlogframe.weight_s -relx 0.5 -rely 0.03 -relheight 0.04444444 -relwidth 0.4

label .nut.po.pane.wlogframe.bf_l -text "Body Fat %" -anchor e -background "#5454FF" -foreground "#FFFF00"
place .nut.po.pane.wlogframe.bf_l -relx 0.0 -rely 0.11 -relheight 0.04444444 -relwidth 0.45
tk::spinbox .nut.po.pane.wlogframe.bf_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::currentbfp -disabledforeground "#000000"
place .nut.po.pane.wlogframe.bf_s -relx 0.5 -rely 0.11 -relheight 0.04444444 -relwidth 0.4

Button .nut.po.pane.wlogframe.accept -text "Accept New\nMeasurements" -command AcceptNewMeasurements
place .nut.po.pane.wlogframe.accept -relx 0.36 -rely 0.2 -relheight 0.1 -relwidth 0.55

label .nut.po.pane.wlogframe.summary -wraplength [expr {$::magnify * 150}] -textvariable ::wlogsummary -justify right -anchor ne -background "#5454FF" -foreground "#FFFF00"
place .nut.po.pane.wlogframe.summary -relx 0.0 -rely 0.34 -relheight 0.6 -relwidth 0.93

Button .nut.po.pane.wlogframe.clear -text "Clear Weight Log" -command ClearWeightLog
#place .nut.po.pane.wlogframe.clear -relx 0.3 -rely 0.79 -relheight 0.06 -relwidth 0.63


label .nut.po.pane.optframe.cal_l -text "Calories kc" -anchor e -background "#5454FF" -foreground "#FFFF00"
place .nut.po.pane.optframe.cal_l -relx 0.0 -rely 0.03 -relheight 0.04444444 -relwidth 0.25
tk::spinbox .nut.po.pane.optframe.cal_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::ENERC_KCALopt -disabledforeground "#000000"
place .nut.po.pane.optframe.cal_s -relx 0.265 -rely 0.03 -relheight 0.04444444 -relwidth 0.14
set ::ENERC_KCALpo 0
ttk::checkbutton .nut.po.pane.optframe.cal_cb1 -text "Adjust to my meals" -variable ::ENERC_KCALpo -onvalue -1 -style po.TCheckbutton -command [list ChangePersonalOptions ENERC_KCAL]
place .nut.po.pane.optframe.cal_cb1 -relx 0.44 -rely 0.03 -relheight 0.04444444 -relwidth 0.23
ttk::checkbutton .nut.po.pane.optframe.cal_cb2 -text "Auto-Set" -variable ::ENERC_KCALpo -onvalue 2 -style po.TCheckbutton -command [list ChangePersonalOptions ENERC_KCAL]
place .nut.po.pane.optframe.cal_cb2 -relx 0.69 -rely 0.03 -relheight 0.04444444 -relwidth 0.23

label .nut.po.pane.optframe.fat_l -text "Total Fat g" -anchor e -background "#5454FF" -foreground "#FFFF00"
place .nut.po.pane.optframe.fat_l -relx 0.0 -rely 0.11 -relheight 0.04444444 -relwidth 0.25
tk::spinbox .nut.po.pane.optframe.fat_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::FATopt -disabledforeground "#000000"
place .nut.po.pane.optframe.fat_s -relx 0.265 -rely 0.11 -relheight 0.04444444 -relwidth 0.14
ttk::checkbutton .nut.po.pane.optframe.fat_cb1 -text "Adjust to my meals" -variable ::FATpo -onvalue -1 -style po.TCheckbutton -command [list ChangePersonalOptions FAT]
place .nut.po.pane.optframe.fat_cb1 -relx 0.44 -rely 0.11 -relheight 0.04444444 -relwidth 0.23
ttk::checkbutton .nut.po.pane.optframe.fat_cb2 -text "DV 30% of Calories" -variable ::FATpo -onvalue 2 -style po.TCheckbutton -command [list ChangePersonalOptions FAT]
place .nut.po.pane.optframe.fat_cb2 -relx 0.69 -rely 0.11 -relheight 0.04444444 -relwidth 0.23

label .nut.po.pane.optframe.prot_l -text "Protein g" -anchor e -background "#5454FF" -foreground "#FFFF00"
place .nut.po.pane.optframe.prot_l -relx 0.0 -rely 0.19 -relheight 0.04444444 -relwidth 0.25
tk::spinbox .nut.po.pane.optframe.prot_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::PROCNTopt -disabledforeground "#000000"
place .nut.po.pane.optframe.prot_s -relx 0.265 -rely 0.19 -relheight 0.04444444 -relwidth 0.14
ttk::checkbutton .nut.po.pane.optframe.prot_cb1 -text "Adjust to my meals" -variable ::PROCNTpo -onvalue -1 -style po.TCheckbutton -command [list ChangePersonalOptions PROCNT]
place .nut.po.pane.optframe.prot_cb1 -relx 0.44 -rely 0.19 -relheight 0.04444444 -relwidth 0.23
ttk::checkbutton .nut.po.pane.optframe.prot_cb2 -text "DV 10% of Calories" -variable ::PROCNTpo -onvalue 2 -style po.TCheckbutton -command [list ChangePersonalOptions PROCNT]
place .nut.po.pane.optframe.prot_cb2 -relx 0.69 -rely 0.19 -relheight 0.04444444 -relwidth 0.23

label .nut.po.pane.optframe.nfc_l -text "Non-Fiber Carb g" -anchor e -background "#5454FF" -foreground "#FFFF00"
place .nut.po.pane.optframe.nfc_l -relx 0.0 -rely 0.27 -relheight 0.04444444 -relwidth 0.25
tk::spinbox .nut.po.pane.optframe.nfc_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::CHO_NONFIBopt -disabledforeground "#000000"
place .nut.po.pane.optframe.nfc_s -relx 0.265 -rely 0.27 -relheight 0.04444444 -relwidth 0.14
ttk::checkbutton .nut.po.pane.optframe.nfc_cb1 -text "Adjust to my meals" -variable ::CHO_NONFIBpo -onvalue -1 -style po.TCheckbutton -command [list ChangePersonalOptions CHO_NONFIB]
place .nut.po.pane.optframe.nfc_cb1 -relx 0.44 -rely 0.27 -relheight 0.04444444 -relwidth 0.23
ttk::checkbutton .nut.po.pane.optframe.nfc_cb2 -text "Balance of Calories" -variable ::CHO_NONFIBpo -onvalue 2 -style po.TCheckbutton -command [list ChangePersonalOptions CHO_NONFIB]
place .nut.po.pane.optframe.nfc_cb2 -relx 0.69 -rely 0.27 -relheight 0.04444444 -relwidth 0.23

label .nut.po.pane.optframe.fiber_l -text "Fiber g" -anchor e -background "#5454FF" -foreground "#FFFF00"
place .nut.po.pane.optframe.fiber_l -relx 0.0 -rely 0.35 -relheight 0.04444444 -relwidth 0.25
tk::spinbox .nut.po.pane.optframe.fiber_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::FIBTGopt -disabledforeground "#000000"
place .nut.po.pane.optframe.fiber_s -relx 0.265 -rely 0.35 -relheight 0.04444444 -relwidth 0.14
ttk::checkbutton .nut.po.pane.optframe.fiber_cb1 -text "Adjust to my meals" -variable ::FIBTGpo -onvalue -1 -style po.TCheckbutton -command [list ChangePersonalOptions FIBTG]
place .nut.po.pane.optframe.fiber_cb1 -relx 0.44 -rely 0.35 -relheight 0.04444444 -relwidth 0.23
ttk::checkbutton .nut.po.pane.optframe.fiber_cb2 -text "Daily Value Default" -variable ::FIBTGpo -onvalue 2 -style po.TCheckbutton -command [list ChangePersonalOptions FIBTG]
place .nut.po.pane.optframe.fiber_cb2 -relx 0.69 -rely 0.35 -relheight 0.04444444 -relwidth 0.23

label .nut.po.pane.optframe.sat_l -text "Saturated Fat g" -anchor e -background "#5454FF" -foreground "#FFFF00"
place .nut.po.pane.optframe.sat_l -relx 0.0 -rely 0.43 -relheight 0.04444444 -relwidth 0.25
tk::spinbox .nut.po.pane.optframe.sat_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::FASATopt -disabledforeground "#000000"
place .nut.po.pane.optframe.sat_s -relx 0.265 -rely 0.43 -relheight 0.04444444 -relwidth 0.14
ttk::checkbutton .nut.po.pane.optframe.sat_cb1 -text "Adjust to my meals" -variable ::FASATpo -onvalue -1 -style po.TCheckbutton -command [list ChangePersonalOptions FASAT]
place .nut.po.pane.optframe.sat_cb1 -relx 0.44 -rely 0.43 -relheight 0.04444444 -relwidth 0.23
ttk::checkbutton .nut.po.pane.optframe.sat_cb2 -text "DV 10% of Calories" -variable ::FASATpo -onvalue 2 -style po.TCheckbutton -command [list ChangePersonalOptions FASAT]
place .nut.po.pane.optframe.sat_cb2 -relx 0.69 -rely 0.43 -relheight 0.04444444 -relwidth 0.23

label .nut.po.pane.optframe.efa_l -text "Essential Fatty Acids g" -anchor e -background "#5454FF" -foreground "#FFFF00"
place .nut.po.pane.optframe.efa_l -relx 0.0 -rely 0.51 -relheight 0.04444444 -relwidth 0.25
tk::spinbox .nut.po.pane.optframe.efa_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::FAPUopt -disabledforeground "#000000"
place .nut.po.pane.optframe.efa_s -relx 0.265 -rely 0.51 -relheight 0.04444444 -relwidth 0.14
ttk::checkbutton .nut.po.pane.optframe.efa_cb1 -text "Adjust to my meals" -variable ::FAPUpo -onvalue -1 -style po.TCheckbutton -command [list ChangePersonalOptions FAPU]
place .nut.po.pane.optframe.efa_cb1 -relx 0.44 -rely 0.51 -relheight 0.04444444 -relwidth 0.23
ttk::checkbutton .nut.po.pane.optframe.efa_cb2 -text "4% of Calories" -variable ::FAPUpo -onvalue 2 -style po.TCheckbutton -command [list ChangePersonalOptions FAPU]
place .nut.po.pane.optframe.efa_cb2 -relx 0.69 -rely 0.51 -relheight 0.04444444 -relwidth 0.23

label .nut.po.pane.optframe.fish_l -text "Omega-6/3 Balance" -anchor e -background "#5454FF" -foreground "#FFFF00"
place .nut.po.pane.optframe.fish_l -relx 0.0 -rely 0.59 -relheight 0.04444444 -relwidth 0.25
set ::balvals {}
for {set i 15} {$i < 91} {incr i} {
 lappend ::balvals "$i / [expr {100 - $i}]"
 }
ttk::combobox .nut.po.pane.optframe.fish_s -width 7 -justify right -textvariable ::FAPU1po -values $::balvals -state readonly -style po.TCombobox
trace add variable ::FAPU1po write [list ChangePersonalOptions FAPU1]
place .nut.po.pane.optframe.fish_s -relx 0.265 -rely 0.59 -relheight 0.04444444 -relwidth 0.14

menubutton .nut.po.pane.optframe.dv_mb -background "#5454FF" -foreground "#FFFF00" -relief raised -text "Daily Values for Individual Vitamins and Minerals" -direction right -menu .nut.po.pane.optframe.dv_mb.m
menu .nut.po.pane.optframe.dv_mb.m -tearoff 0
foreach nut {{Vitamin A} Thiamin Riboflavin Niacin {Panto. Acid} {Vitamin B6} Folate {Vitamin B12} {Vitamin C} {Vitamin D} {Vitamin E} {Vitamin K1} Calcium Copper Iron Magnesium Manganese Phosphorus Potassium Selenium Zinc} {
 .nut.po.pane.optframe.dv_mb.m add command -label $nut -command [list changedv_vitmin $nut]
 }
place .nut.po.pane.optframe.dv_mb -relx 0.02 -rely 0.67 -relheight 0.04444444 -relwidth 0.55

label .nut.po.pane.optframe.vite_l -text "vite" -anchor e -background "#5454FF" -foreground "#FFFF00"
#place .nut.po.pane.optframe.vite_l -relx 0.0 -rely 0.75 -relheight 0.04444444 -relwidth 0.25
tk::spinbox .nut.po.pane.optframe.vite_s -width 7 -justify right -from 1 -to 9999 -increment 0.1 -textvariable ::NULLopt -disabledforeground "#000000"
#place .nut.po.pane.optframe.vite_s -relx 0.265 -rely 0.75 -relheight 0.04444444 -relwidth 0.14
ttk::checkbutton .nut.po.pane.optframe.vite_cb1 -text "Adjust to my meals" -variable ::vitminpo -onvalue -1 -style po.TCheckbutton
#place .nut.po.pane.optframe.vite_cb1 -relx 0.44 -rely 0.75 -relheight 0.04444444 -relwidth 0.23
ttk::checkbutton .nut.po.pane.optframe.vite_cb2 -text "Daily Value Default" -variable ::vitminpo -onvalue 2 -style po.TCheckbutton
#place .nut.po.pane.optframe.vite_cb2 -relx 0.69 -rely 0.75 -relheight 0.04444444 -relwidth 0.23

ttk::frame .nut.ts.frranking -style vf.TFrame
place .nut.ts.frranking -relx 0.0 -rely 0.05 -relheight 0.7 -relwidth 1.0
grid propagate .nut.ts.frranking 0

ttk::combobox .nut.ts.rankchoice -state readonly -justify center -style ts.TCombobox
place .nut.ts.rankchoice -relx 0.0 -rely 0.0 -relheight 0.05 -relwidth 0.5
ttk::combobox .nut.ts.fdgroupchoice -textvariable ::fdgroupchoice -state readonly -justify center -style ts.TCombobox
place .nut.ts.fdgroupchoice -relx 0.5 -rely 0.0 -relheight 0.05 -relwidth 0.5

labelframe .nut.ts.frgraph -background "#FFFF00"
place .nut.ts.frgraph -relx 0.0 -rely 0.75 -relheight 0.25 -relwidth 1.0

canvas .nut.ts.frgraph.canvas -relief flat -background "#FFFF00"
place .nut.ts.frgraph.canvas -relx 0.0 -rely 0.0 -relheight 1.0 -relwidth 1.0

grid [ttk::treeview .nut.ts.frranking.ranking -yscrollcommand [list .nut.ts.frranking.vsb set] -style nut.Treeview -columns {food field1 field2} -show headings] -row 0 -column 0 -sticky nsew
.nut.ts.frranking.ranking column 0 -minwidth [expr {int(10 * $vrootwGR * $appSize / 1.3 / 15)}]
.nut.ts.frranking.ranking column 1 -minwidth [expr {int(2 * $vrootwGR * $appSize / 1.3 / 15)}]
.nut.ts.frranking.ranking column 2 -minwidth [expr {int(3 * $vrootwGR * $appSize / 1.3 / 15)}]
grid [scrollbar .nut.ts.frranking.vsb -width [expr {$::magnify * $::scrollwidth}] -relief sunken -orient vertical -command [list .nut.ts.frranking.ranking yview]] -row 0 -column 1 -sticky nsew

grid columnconfigure .nut.ts.frranking 0 -weight 1 -minsize 0
grid rowconfigure .nut.ts.frranking 0 -weight 1 -minsize 0

bind .nut.ts.frranking.ranking <<TreeviewSelect>> rank2vf

tuneinvf

trace add variable like_this_vf write FindFoodvf
bind .nut.vf.fsentry <FocusIn> FoodSearchvf

foreach x {am rm vf ar} {
 ttk::notebook .nut.${x}.nbw -style ${x}.TNotebook
 ttk::frame .nut.${x}.nbw.screen0 -style ${x}.TFrame
 ttk::frame .nut.${x}.nbw.screen1 -style ${x}.TFrame
 ttk::frame .nut.${x}.nbw.screen2 -style ${x}.TFrame
 ttk::frame .nut.${x}.nbw.screen3 -style ${x}.TFrame
 ttk::frame .nut.${x}.nbw.screen4 -style ${x}.TFrame
 ttk::frame .nut.${x}.nbw.screen5 -style ${x}.TFrame
 .nut.${x}.nbw add .nut.${x}.nbw.screen0 -text "Daily Value %"
 .nut.${x}.nbw add .nut.${x}.nbw.screen1 -text "DV Amounts"
 .nut.${x}.nbw add .nut.${x}.nbw.screen2 -text "Carbs & Amino Acids"
 .nut.${x}.nbw add .nut.${x}.nbw.screen3 -text "Miscellaneous"
 .nut.${x}.nbw add .nut.${x}.nbw.screen4 -text "Sat & Mono Fatty Acids"
 .nut.${x}.nbw add .nut.${x}.nbw.screen5 -text "Poly & Trans Fatty Acids"
 place .nut.${x}.nbw -relx 0.0 -rely 0.25 -relheight 0.75 -relwidth 1.0

 set screen 0
 foreach nut {ENERC_KCAL} {
  if {$x != "ar"} {
   button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::caloriebutton -command "NewStory $nut $x" -background "#FFFF00"
   } else {
   button .nut.${x}.nbw.screen${screen}.b${nut} -text "Calories (2000)" -command "NewStory $nut $x" -background "#FFFF00"
   }
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -text "%" -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.005 -rely 0.00625 -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.18 -rely 0.00625 -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.28 -rely 0.00625 -relheight 0.06 -relwidth 0.055
  }
 foreach nut {ENERC_KCAL1} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -text "Prot / Carb / Fat" -command "NewStory ENERC_KCAL $x" -background "#FFFF00"
  label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor center
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.005 -rely 0.0725 -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.18 -rely 0.0725 -relheight 0.06 -relwidth 0.165
  }
 set rely 0.205
 foreach nut {FAT FASAT FAMS FAPU OMEGA6 LA AA OMEGA3 ALA EPA DHA CHOLE} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -text "%" -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.005 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.18 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.28 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely 0.00625
 foreach nut {CHOCDF FIBTG} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -text "%" -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.335 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.51 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.61 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely 0.205
 foreach nut {VITA_IU THIA RIBF NIA PANTAC VITB6A FOL VITB12 VITC VITD VITE VITK1} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -text "%" -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.335 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.51 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.61 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely 0.00625
 foreach nut {PROCNT} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -text "%" -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.665 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.84 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.94 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 foreach nut {CHO_NONFIB} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}1 -justify right
   } else {
    label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}1 -background $background($x) -anchor e

#uncomment this line and comment out the previous if user insists he
#must see CHO_NONFIB percentage of DV instead of grams

#    label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -background $background($x) -anchor e
   }
   label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w

#uncomment this line and comment out the previous if user insists he
#must see CHO_NONFIB percentage of DV instead of grams

#   label .nut.${x}.nbw.screen${screen}.lu${nut} -text "%" -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.665 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.84 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.94 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely [expr {$rely + 0.06625}]
 foreach nut {CA CU FE MG MN P K SE NA ZN} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x}dv -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -text "%" -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.665 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.84 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.94 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely [expr {$rely + 0.06625}]
 foreach nut {FAPU1} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -text "Omega-6/3 Balance" -command "NewStory FAPU $x" -background "#FFFF00"
  label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.665 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.84 -rely $rely -relheight 0.06 -relwidth 0.1
  }
 set screen 1
 foreach nut {ENERC_KCAL} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.005 -rely 0.00625 -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.18 -rely 0.00625 -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.28 -rely 0.00625 -relheight 0.06 -relwidth 0.055
  }
 foreach nut {ENERC_KCAL1} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -text "Prot / Carb / Fat" -command "NewStory ENERC_KCAL $x" -background "#FFFF00"
  label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor center
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.005 -rely 0.0725 -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.18 -rely 0.0725 -relheight 0.06 -relwidth 0.165
  }
 set rely 0.205
 foreach nut {FAT FASAT FAMS FAPU OMEGA6 LA AA OMEGA3 ALA EPA DHA CHOLE} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.005 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.18 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.28 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely 0.00625
 foreach nut {CHOCDF FIBTG} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.335 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.51 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.61 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely 0.205
 foreach nut {VITA_IU THIA RIBF NIA PANTAC VITB6A FOL VITB12 VITC VITD VITE VITK1} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.335 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.51 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.61 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely 0.00625
 foreach nut {PROCNT} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.665 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.84 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.94 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 foreach nut {CHO_NONFIB} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.665 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.84 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.94 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely [expr {$rely + 0.06625}]
 foreach nut {CA CU FE MG MN P K SE NA ZN} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.665 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.84 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.94 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely [expr {$rely + 0.06625}]
 foreach nut {FAPU1} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -text "Omega-6/3 Balance" -command "NewStory FAPU $x" -background "#FFFF00"
  label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor center
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.665 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.84 -rely $rely -relheight 0.06 -relwidth 0.165
  }
 set screen 2
 set rely 0.13875
 foreach nut {CHOCDF FIBTG STARCH SUGAR FRUS GALS GLUS LACS MALS SUCS} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.005 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.18 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.28 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely 0.13875
 foreach nut {PROCNT ADPROT ALA_G ARG_G ASP_G CYS_G GLU_G GLY_G HISTN_G HYP ILE_G} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.335 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.51 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.61 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely 0.13875
 foreach nut {LEU_G LYS_G MET_G PHE_G PRO_G SER_G THR_G TRP_G TYR_G VAL_G} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.665 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.84 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.94 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set screen 3
 set rely 0.0725
 foreach nut {ENERC_KJ ASH WATER CAFFN THEBRN ALC FLD BETN CHOLN FOLAC FOLFD FOLDFE RETOL} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.005 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.18 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.28 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely 0.0725
 foreach nut {VITA_RAE ERGCAL CHOCAL VITD_BOTH VITB12_ADDED VITE_ADDED VITK1D MK4 TOCPHA TOCPHB TOCPHG TOCPHD TOCTRA} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.335 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.51 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.61 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely 0.0725
 foreach nut {TOCTRB TOCTRG TOCTRD CARTA CARTB CRYPX LUT_ZEA LYCPN CHOLE PHYSTR SITSTR CAMD5 STID7} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.665 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.84 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.94 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set screen 4
 set rely 0.00625
 foreach nut {FASAT F4D0 F6D0 F8D0 F10D0 F12D0 F13D0 F14D0 F15D0 F16D0 F17D0 F18D0 F20D0 F22D0 F24D0} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.17 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.345 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.445 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely 0.0725
 foreach nut {FAMS F14D1 F15D1 F16D1 F16D1C F17D1 F18D1 F18D1C F20D1 F22D1 F22D1C F24D1C} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.5 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.675 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.775 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set screen 5
 set rely 0.205
 foreach nut {FAPU F18D2 F18D2CN6 F18D3 F18D3CN3 F18D3CN6 F18D4 F20D2CN6} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.005 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.18 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.28 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely 0.13875
 foreach nut {F20D3 F20D3N3 F20D3N6 F20D4 F20D4N6 F20D5 F21D5 F22D4 F22D5 F22D6} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.335 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.51 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.61 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 set rely 0.0725
 foreach nut {FATRN FATRNM F16D1T F18D1T F18D1TN7 F22D1T FATRNP F18D2I F18D2T F18D2TT F18D2CLA F18D3I} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
  if {$x == "ar"} {
   ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
   label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
  label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.665 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.84 -rely $rely -relheight 0.06 -relwidth 0.1
  place .nut.${x}.nbw.screen${screen}.lu${nut} -relx 0.94 -rely $rely -relheight 0.06 -relwidth 0.055
  set rely [expr {$rely + 0.06625}]
  }
 }

bind .nut.am.nbw <<NotebookTabChanged>> NBWamTabChange
bind .nut.rm.nbw <<NotebookTabChanged>> NBWrmTabChange
bind .nut.vf.nbw <<NotebookTabChanged>> NBWvfTabChange
bind .nut.ar.nbw <<NotebookTabChanged>> NBWarTabChange

if {$need_load == 1} {

 toplevel .loadframe
 wm title .loadframe $::version
 wm withdraw .

# modified from the artistic analog clock by Wolf-Dieter Busch at http://wiki.tcl.tk/1011
 set ::clockscale [expr {$::magnify * 0.42}]
 set cheight 350
 set cwidth  650
grid [canvas .loadframe.c -width [expr {$::magnify * $cwidth}] -height [expr {$::magnify * $cheight}] -highlightthickness 0] -padx [expr {$::clockscale * 20}] -pady [expr {$::clockscale * 20}]

 set PI [expr {asin(1)*2}]
 set sekundenzeigerlaenge [expr {$::clockscale * 85}]
 set minutenzeigerlaenge  [expr {$::clockscale * 75}]
 set stundenzeigerlaenge  [expr {$::clockscale * 60}]

 drawClock
 showTime

 .loadframe.c create text [expr {$::magnify * $cwidth / 2}] [expr {$::clockscale * 100}] -anchor center -text "Updating USDA Nutrient Database"

 ttk::style configure lf.Horizontal.TProgressbar -background "#006400"
 for {set i 1} {$i < 9} {incr i} {
  set ::pbar($i) 0.0
  ttk::progressbar .loadframe.pbar${i} -style lf.Horizontal.TProgressbar -variable pbar($i) -orient horizontal -length [expr {$::magnify * 100}] -mode determinate
  .loadframe.c create window [expr {$::clockscale * 150 + 0.38 * $i * $::clockscale * 200}] [expr {$::clockscale * 160 + 0.38 * $i * $::clockscale * 200}] -anchor w -height [expr {18.0 * $::magnify}] -window .loadframe.pbar${i}
  set p_label_x($i) [expr {$::clockscale * 150 + 0.38 * $i * $::clockscale * 200 + $::magnify * 100 + $::clockscale * 20}]
  set p_label_y($i) [expr {$::clockscale * 160 + 0.38 * $i * $::clockscale * 200}]
  }

 .loadframe.c create text $p_label_x(1) $p_label_y(1) -anchor w -text "Load Nutrient Definitions"
 .loadframe.c create text $p_label_x(2) $p_label_y(2) -anchor w -text "Load Food Groups"
 .loadframe.c create text $p_label_x(3) $p_label_y(3) -anchor w -text "Load Foods"
 .loadframe.c create text $p_label_x(4) $p_label_y(4) -anchor w -text "Load Serving Sizes"
 .loadframe.c create text $p_label_x(5) $p_label_y(5) -anchor w -text "Load Nutrient Values"
 .loadframe.c create text $p_label_x(6) $p_label_y(6) -anchor w -text "Join Nutrient Values to Foods"
 .loadframe.c create text $p_label_x(7) $p_label_y(7) -anchor w -text "Compute Derived Nutrient Values"
 .loadframe.c create text $p_label_x(8) $p_label_y(8) -anchor w -text "Load Legacy Files and Write to Disk"
 update

 if {$::THREADS} {
  thread::send -async $::SQL_THREAD {db eval {select code from tcl_code where name = 'InitialLoad_alt_GUI'} { } ; eval $code}
  thread::release $::SQL_THREAD
  set ::THREADS 0
  } else {
  db eval {select code from tcl_code where name = 'InitialLoad_alt_GUI'} { }
  eval $code
  }
 } else {
 set tablename [db eval {select name from sqlite_master where type='table' and name = "nutr_def"}]
 if { $tablename == "" } {
  tk_messageBox -type ok -title $::version -message "NUT requires the USDA Nutrient Database to be present initially in order to be loaded into SQLite.  Download it in the full ascii version from \"http://www.ars.usda.gov/nutrientdata\" or from \"http://nut.sourceforge.net\" and unzip it in this directory, [pwd]." -detail "Follow this same procedure later when you want to upgrade the USDA database yet retain your personal data.  After USDA files have been loaded into NUT they can be deleted.\n\nIf you really do want to reload a USDA database that you have already loaded, rename the file \"NUTR_DEF.txt.loaded\" to \"NUTR_DEF.txt\"."
  rename unknown ""
  rename _original_unknown unknown
  destroy .
  exit 0
  } else {
  db eval {select code from tcl_code where name = 'Start_NUT_alt_GUI'} { }
  eval $code
  }
 }

#end Main_alt
}

set drawClock {

proc drawClock {} {
    global PI
    global sekundenzeigerlaenge
    global minutenzeigerlaenge
    global stundenzeigerlaenge
    set aussenradius [expr {$::clockscale * 95.0}]
    set innenradius  [expr {$::clockscale * 83.0}]
    # Ziffernblatt
    .loadframe.c create rectangle 2 2 [expr {$::clockscale * 200 - 1}] [expr {$::clockscale * 200.0 - 1}] -fill "#C7C3C7" -outline ""
    .loadframe.c create line 1 [expr {$::clockscale * 200}] [expr {$::clockscale * 200}] [expr {$::clockscale * 200}] [expr {$::clockscale * 200}] 1 -fill black
    .loadframe.c create line 1 [expr {$::clockscale * 200 - 1}] [expr {$::clockscale * 200 - 1}] [expr {$::clockscale * 200 - 1}] [expr {$::clockscale * 200 - 1}] 1 -fill "#8E8A8E"
    .loadframe.c create line 0 [expr {$::clockscale * 200}] 0 0 [expr {$::clockscale * 200}] 0 -fill "#F8F8F8"
    .loadframe.c create line 1 [expr {$::clockscale * 200 - 2}] 1 1 [expr {$::clockscale * 200 - 2}] 1 -fill "#D7D7D7"
    # Zeiger
    .loadframe.c create line [expr {$::clockscale * 100}] [expr {$::clockscale * 100}]     [expr {[expr {$::clockscale * 100}]+$stundenzeigerlaenge}] [expr {$::clockscale * 100}] -tag stundenschatten
    .loadframe.c create line [expr {$::clockscale * 100}] [expr {$::clockscale * 100}] [expr {$::clockscale * 100}] [expr {[expr {$::clockscale * 100}]-$minutenzeigerlaenge}]     -tag minutenschatten
    .loadframe.c create line [expr {$::clockscale * 100}] [expr {$::clockscale * 100}] [expr {$::clockscale * 100}] [expr {[expr {$::clockscale * 100}]+$sekundenzeigerlaenge}]    -tag sekundenschatten
    .loadframe.c create line [expr {$::clockscale * 100}] [expr {$::clockscale * 100}]     [expr {[expr {$::clockscale * 100}]+$stundenzeigerlaenge}] [expr {$::clockscale * 100}] -tag {stundenzeiger zeiger}
    .loadframe.c create line [expr {$::clockscale * 100}] [expr {$::clockscale * 100}] [expr {$::clockscale * 100}] [expr {[expr {$::clockscale * 100}]-$minutenzeigerlaenge}]     -tag {minutenzeiger zeiger}
    .loadframe.c create line [expr {$::clockscale * 100}] [expr {$::clockscale * 100}] [expr {$::clockscale * 100}] [expr {[expr {$::clockscale * 100}]+$sekundenzeigerlaenge}]    -tag {sekundenzeiger zeiger}
    .loadframe.c itemconfigure stundenzeiger    -width [expr {$::clockscale * 11}] -fill "#554444"
    .loadframe.c itemconfigure minutenzeiger    -width [expr {$::clockscale * 8}] -fill "#554444"
    .loadframe.c itemconfigure sekundenzeiger   -width [expr {$::clockscale * 4}] -fill "#FFFF00"
    .loadframe.c itemconfigure stundenschatten  -width [expr {$::clockscale * 11}] -fill "#B0B0B0"
    .loadframe.c itemconfigure minutenschatten  -width [expr {$::clockscale * 8}] -fill "#B0B0B0"
    .loadframe.c itemconfigure sekundenschatten -width [expr {$::clockscale * 4}] -fill "#B0B0B0"
    # Ziffern
    for {set i 0} {$i < 60} {incr i} {
        set r0 [expr {$innenradius + 5}]
        set r1 [expr {$innenradius +10}]
        set x0 [expr {sin($PI/30*(30-$i))*$r0+[expr {$::clockscale * 100}]}]
        set y0 [expr {cos($PI/30*(30-$i))*$r0+[expr {$::clockscale * 100}]}]
        set x1 [expr {sin($PI/30*(30-$i))*$r1+[expr {$::clockscale * 100}]}]
        set y1 [expr {cos($PI/30*(30-$i))*$r1+[expr {$::clockscale * 100}]}]
        if {[expr {$i%5}]} {
        }
    }
    for {set i 0} {$i < 12} {incr i} {
        set x [expr {sin($PI/6*(6-$i))*$innenradius+[expr {$::clockscale * 100}]}]
        set y [expr {cos($PI/6*(6-$i))*$innenradius+[expr {$::clockscale * 100}]}]
        .loadframe.c create text $x $y \
                -text [expr {$i ? $i : 12}] \
                -font TkSmallCaptionFont \
                -fill #000000 \
                -tag ziffer
    }
}

#end drawClock
}

set stundenZeigerAuf {

proc stundenZeigerAuf {std} {
    global PI
    global stundenzeigerlaenge
    set x0 [expr {$::clockscale * 100}]
    set y0 [expr {$::clockscale * 100}]
    set dx [expr {sin ($PI/6*(6-$std))*$stundenzeigerlaenge}]
    set dy [expr {cos ($PI/6*(6-$std))*$stundenzeigerlaenge}]
    set x1 [expr {$x0 + $dx}]
    set y1 [expr {$y0 + $dy}]
    .loadframe.c coords stundenzeiger $x0 $y0 $x1 $y1
    set schattenabstand [expr {$::clockscale * 6}]
    set x0s [expr {$x0 + $schattenabstand}]
    set y0s [expr {$y0 + $schattenabstand}]
    set x1s [expr {$x1 + $schattenabstand}]
    set y1s [expr {$y1 + $schattenabstand}]
    .loadframe.c coords stundenschatten $x0s $y0s $x1s $y1s
}

#end stundenZeigerAuf
}

set minutenZeigerAuf {

proc minutenZeigerAuf {min} {
    global PI
    global minutenzeigerlaenge
    set x0 [expr {$::clockscale * 100}]
    set y0 [expr {$::clockscale * 100}]
    set dx [expr {sin ($PI/30*(30-$min))*$minutenzeigerlaenge}]
    set dy [expr {cos ($PI/30*(30-$min))*$minutenzeigerlaenge}]
    set x1 [expr {$x0 + $dx}]
    set y1 [expr {$y0 + $dy}]
    .loadframe.c coords minutenzeiger $x0 $y0 $x1 $y1
    set schattenabstand [expr {$::clockscale * 8}]
    set x0s [expr {$x0 + $schattenabstand}]
    set y0s [expr {$y0 + $schattenabstand}]
    set x1s [expr {$x1 + $schattenabstand}]
    set y1s [expr {$y1 + $schattenabstand}]
    .loadframe.c coords minutenschatten $x0s $y0s $x1s $y1s
}

#end minutenZeigerAuf
}

set sekundenZeigerAuf {

proc sekundenZeigerAuf {sec} {
    global PI
    global sekundenzeigerlaenge
    set x0 [expr {$::clockscale * 100}]
    set y0 [expr {$::clockscale * 100}]
    set dx [expr {sin ($PI/30*(30-$sec))*$sekundenzeigerlaenge}]
    set dy [expr {cos ($PI/30*(30-$sec))*$sekundenzeigerlaenge}]
    set x1 [expr {$x0 + $dx}]
    set y1 [expr {$y0 + $dy}]
    .loadframe.c coords sekundenzeiger $x0 $y0 $x1 $y1
    set schattenabstand [expr {$::clockscale * 10}]
    set x0s [expr {$x0 + $schattenabstand}]
    set y0s [expr {$y0 + $schattenabstand}]
    set x1s [expr {$x1 + $schattenabstand}]
    set y1s [expr {$y1 + $schattenabstand}]
    .loadframe.c coords sekundenschatten $x0s $y0s $x1s $y1s
}

#end sekundenZeigerAuf
}

set showTime {

proc showTime {} {
    after cancel showTime
    after 1000 showTime
    set secs [clock seconds]
    set l [clock format $secs -format {%H %M %S} ]
    set std [lindex $l 0]
    set min [lindex $l 1]
    set sec [lindex $l 2]
    regsub ^0 $std "" std
    regsub ^0 $min "" min
    regsub ^0 $sec "" sec
    set min [expr {$min + 1.0 * $sec/60}]
    set std [expr {$std + 1.0 * $min/60}]
    stundenZeigerAuf $std
    minutenZeigerAuf $min
    sekundenZeigerAuf $sec
}

#end showTime
}

set InitialLoad_alt_GUI {

sqlite3 dbmem :memory:
dbmem function n6hufa n6hufa
dbmem function setRefDesc setRefDesc
dbmem function format_meal_id format_meal_id

if {[catch {dbmem restore main $::DiskDB}]} {

# Duplicate the schema of appdata1.xyz into the in-memory db database

 db eval {SELECT sql FROM sqlite_master WHERE sql NOT NULL and type = 'table' and name not like '%sqlite_%'} {
  dbmem eval $sql
  }

# Copy data content from appdata1.xyz into memory
 dbmem eval {ATTACH $::DiskDB AS app}
 dbmem eval {SELECT name FROM sqlite_master WHERE type='table'} {
  dbmem eval "INSERT INTO $name SELECT * FROM app.$name"
  }
 dbmem eval {DETACH app}
 }

dbmem eval {PRAGMA synchronous = 0}

if {$::THREADS} {
 dbmem progress 1920 [list thread::send -async $::GUI_THREAD {pbprog_threaded 1 1.0 }]
 } else {
 dbmem progress 1920 {pbprog 1 1.0 }
 }
load_nutr_def

if {$::THREADS} {
 thread::send -async $::GUI_THREAD {set ::pbar(1) 100.0}
 dbmem progress 10 [list thread::send -async $::GUI_THREAD {pbprog_threaded 2 1.0 }]
 } else {
 set ::pbar(1) 100.0
 dbmem progress 10 {pbprog 2 1.0 }
 }
load_fd_group

if {$::THREADS} {
 thread::send -async $::GUI_THREAD {set ::pbar(2) 100.0}
 dbmem progress 8000 [list thread::send -async $::GUI_THREAD {pbprog_threaded 3 1.0 }]
 } else {
 set ::pbar(2) 100.0
 dbmem progress 8000 {pbprog 3 1.0 }
 }
load_food_des1

dbmem eval {select count(*) as count from food_des} {
 if {$count != 0} {
  if {$::THREADS} {
   dbmem progress 32000 [list thread::send -async $::GUI_THREAD {pbprog_threaded 3 1.0 }]
   } else {
   dbmem progress 32000 {pbprog 3 1.0 }
   }
  }
 }
load_food_des2

if {$::THREADS} {
 thread::send -async $::GUI_THREAD {set ::pbar(3) 100.0}
 dbmem progress 9000 [list thread::send -async $::GUI_THREAD {pbprog_threaded 4 1.0 }]
 } else {
 set ::pbar(3) 100.0
 dbmem progress 9000 {pbprog 4 1.0 }
 }
load_weight

if {$::THREADS} {
 thread::send -async $::GUI_THREAD {set ::pbar(4) 100.0 ; pbprog1_threaded}
 dbmem progress 0 ""
 } else {
 set ::pbprog1counter 0
 set ::pbar(4) 100.0
 set ::pbar(5) 0.5
 dbmem progress 26 {pbprog1}
 }
load_nut_data1

if {$::THREADS} {
 dbmem progress 300000 {thread::send -async $::GUI_THREAD {pbprog 5 1.0 }}
 } else {
 dbmem progress 300000 {pbprog 5 1.0 }
 }
load_nut_data2

if {$::THREADS} {
 thread::send -async $::GUI_THREAD {set ::pbar(5) 100.0}
 dbmem progress 240000 {thread::send -async $::GUI_THREAD {pbprog 6 1.0 }}
 } else {
 set ::pbar(5) 100.0
 dbmem progress 120000 {pbprog 6 0.5 }
 }
dbmem eval $::foodjoin

if {$::THREADS} {
 thread::send -async $::GUI_THREAD {set ::pbar(6) 100.0}
 dbmem progress [expr {[dbmem eval {select count(NDB_No) from food_des}] * 120}] {thread::send -async $::GUI_THREAD {pbprog 7 1.0 }}
 } else {
 set ::pbar(6) 100.0
 dbmem progress [expr {[dbmem eval {select count(NDB_No) from food_des}] * 60}] {pbprog 7 0.5 }
 }
ComputeDerivedValues dbmem food_des

if {$::THREADS} {
 thread::send -async $::GUI_THREAD {set ::pbar(7) 100.0 ; .loadframe.pbar8 configure -mode indeterminate ; .loadframe.pbar8 start}
 dbmem progress 0 ""
 } else {
 set ::pbar(7) 100.0
 dbmem progress 4000 {update}
 .loadframe.pbar8 configure -mode indeterminate
 .loadframe.pbar8 start
 }
load_legacy

if {$::THREADS} {
 thread::send -async $::GUI_THREAD {.loadframe.pbar8 stop ; .loadframe.pbar8 configure -mode determinate ; set ::pbar(8) 80.0}
 dbmem progress 0 ""
 } else {
 dbmem progress 0 ""
 .loadframe.pbar8 stop
 .loadframe.pbar8 configure -mode determinate
 set ::pbar(8) 80.0
 update
 }
dbmem eval {analyze main}
dbmem eval {PRAGMA synchronous = 2}
if {[catch {dbmem backup main $::DiskDB}]} {

# Duplicate the schema of appdata1.xyz from the in-memory db database
 set sql_mast [db eval {SELECT name, type FROM sqlite_master where type != 'index'}]
 foreach {name type} $sql_mast {
  db eval "DROP $type if exists $name"
  }
 dbmem eval {SELECT sql FROM sqlite_master WHERE sql NOT NULL and type != 'trigger'} {
  db eval $sql
  }

# Copy data content into appdata1.xyz from memory
 dbmem eval {ATTACH $::DiskDB AS app}
 dbmem eval {SELECT name FROM sqlite_master WHERE type='table'} {
  dbmem eval "INSERT INTO app.$name SELECT * FROM $name"
  }
 dbmem eval {SELECT sql FROM sqlite_master WHERE sql NOT NULL and type = 'trigger'} {
  db eval $sql
  }
 dbmem eval {DETACH app}
 }
dbmem close
if {$::THREADS} {
 thread::send -async $::GUI_THREAD {set ::pbar(8) 90.0}
 } else {
 set ::pbar(8) 90.0
 update
 }
db eval {vacuum}
file rename -force "NUTR_DEF.txt" "NUTR_DEF.txt.loaded"
if {$::THREADS} {
 thread::send -async $::GUI_THREAD {set ::pbar(8) 100.0}
 } else {
 set ::pbar(8) 100.0
 update
 }
if {$::THREADS} {
 thread::send -async $::GUI_THREAD {wm deiconify . ; after cancel showTime ; destroy .loadframe ; db eval {select code from tcl_code where name = 'Start_NUT_alt_GUI'} { } ; eval $code}
 } else {
 wm deiconify .
 after cancel showTime
 destroy .loadframe
 db eval {select code from tcl_code where name = 'Start_NUT_alt_GUI'} { }
 eval $code
 }

#end InitialLoad_alt_GUI
}

set pbprog_threaded {

proc pbprog_threaded {barnum bailey} {
 set ::pbar($barnum) [expr {$::pbar($barnum) + $bailey}]
 }

#end pbprog_threaded
}

set pbprog1_threaded {

proc pbprog1_threaded { } {
 for {set i 0} {$i < 80} {incr i} {
  after [expr {$i * 1000}] {set ::pbar(5) [expr {$::pbar(5) + 0.5}]}
  }
 }

#end pbprog1_threaded
}

set Start_NUT_alt_GUI {

db nullvalue "\[No Data\]"
db eval {select Tagname, NutrDesc, Units from nutr_def} {
 set nut $Tagname
 set ::${nut}b $NutrDesc
 set ::${nut}u $Units
 }

db eval {select count(meal_id) as "::mealcount", case when FAPU1 = 0.0 then 50.0 else FAPU1 end as "::FAPU1", defanal_am from meals, options} {
 if {$defanal_am > 0} {
  set ::meals_to_analyze_am [expr {$defanal_am > $::mealcount ? $::mealcount : $defanal_am}]
  .nut.am.mealsb configure -from 1
  } else {
  set ::meals_to_analyze_am $::mealcount
  if {$::mealcount > 0} {.nut.am.mealsb configure -from 1} else {
   .nut.am.mealsb configure -from 0
   }
  }
 if {$::mealcount > 0} {.nut.am.mealsb configure -to $::mealcount}
 }

::trace add variable ::meals_to_analyze_am write SetDefanal

db eval {select Tagname from nutr_def where dv_default > 0.0} {
 trace add variable ::${Tagname}opt write [list opt_change $Tagname]
 trace add variable ::${Tagname}am write ::${Tagname}dv_change
 trace add variable ::${Tagname}rm write ::${Tagname}new_rm
 trace add variable ::${Tagname}vf write ::${Tagname}new_vf
 trace add variable ::${Tagname}dv write ::${Tagname}new_dv
 }

db eval {select grams as "::GRAMSopt" from options} { }
db eval {select * from nut_opts} { }
db eval {select * from dv_defaults} { }
db eval {select * from dv} { }
db eval {select * from am_zero; select * from rm_zero; select * from vf_zero} { }
if {$::mealcount > 0} {
 update_am
 }

SetMealBase
set ::rmMainPane .nut.rm.nbw

::trace add variable ::GRAMSopt write GO_change

set ::rankchoices { {Foods Ranked per 100 Grams} {Foods Ranked per 100 Calories} {Foods Ranked per one approximate Serving} {Foods Ranked per Daily Recorded Meals} }
set ::fdgroupchoices { {All Food Groups} }
db eval {select count(meal_id) as "::mealcount" from meals} { }
if {$::mealcount > 0} {
 set ::rankchoice {Foods Ranked per Daily Recorded Meals}
 } else {
 set ::rankchoice {Foods Ranked per 100 Grams}
 }
set ::fdgroupchoice {All Food Groups}
.nut.ts.rankchoice configure -textvariable ::rankchoice -values $::rankchoices

db eval {select FdGrp_Desc as fg from fd_group order by FdGrp_Desc} {
 lappend ::fdgroupchoices $fg
 }
.nut.ts.fdgroupchoice configure -values $::fdgroupchoices
trace add variable ::rankchoice write [list NewStoryLater NULL ts]
trace add variable ::fdgroupchoice write [list NewStoryLater NULL ts]

menu .nut.rm.setmpd.m -tearoff 0 -background "#FF9428"
if {$::meals_per_day != 1} {
 .nut.rm.setmpd.m add command -label "Set 1 meal per day" -command [list SetMPD 1]
 } else {
 .nut.rm.setmpd.m add command -label "Set 1 meal per day" -command [list SetMPD 1] -state disabled
 }
for {set i 2} {$i < 20} {incr i} {
 if {$i != $::meals_per_day} {
  .nut.rm.setmpd.m add command -label "Set $i meals per day" -command [list SetMPD $i]
  } else {
  .nut.rm.setmpd.m add command -label "Set $i meals per day" -command [list SetMPD $i] -state disabled
  }
 }

if {$::mealcount == 0} {
 db eval {select FAPU1 as "::FAPU1" from options} { }
 auto_cal
 }
after 2000 InitializePersonalOptions

#end Start_NUT_alt_GUI
}

set opt_change {

proc opt_change {tag args} {

set var "::${tag}opt"
upvar #0 $var optvar
if {[string is double $optvar]} {
 db eval {update nutr_def set nutopt = $optvar where Tagname = $tag}
 auto_cal
 }
if {$tag in {ENERC_KCAL CA FE MG P K NA ZN CU MN SE VITA_IU VITD VITC THIA RIBF NIA PANTAC VITB6A FOL VITB12 VITK1 VITE}} {
 ::${tag}dv_change
 }
}

#end opt_change
}

set SetMealBase {

proc SetMealBase {args} {
db eval {select meals_per_day as "::meals_per_day" from options} { }
set ::mealnumbase_time [expr {int(([db eval {select julianday('now','localtime') + 0.5}] - [clock format [clock seconds] -format {%J}] + (1.0 / $::meals_per_day)) * $::meals_per_day)}]
set ::mealdatebase_time [clock format [clock seconds] -format {%Y%m%d}]
set ::mealbase_time [expr {$::mealdatebase_time * 100 + $::mealnumbase_time}]
if {$::mealcount > 0} {
 db eval {select max(meal_id) / 100 as "::mealdatebase_max", max(meal_id) % 100 + 1 "::mealnumbase_max" from meals} { }
 if {$::mealnumbase_max > $::meals_per_day} {
  set ::mealnumbase_max [expr {$::mealnumbase_max - $::meals_per_day}]
  set ::mealdatebase_max [expr {1 + [clock format [clock scan $::mealdatebase_max -format {%Y%m%d}] -format {%J}]}]
  set ::mealdatebase_max [clock format [clock scan $::mealdatebase_max -format {%J}] -format {%Y%m%d}]
  }
 set ::mealbase_max [expr {$::mealdatebase_max * 100 + $::mealnumbase_max}]
 } else {
 set ::mealbase_max 0
 }
if {$::mealbase_time >= $::mealbase_max} {
 set ::mealbase $::mealbase_time
 set ::mealchoice "Meal [format_meal_id $::mealbase_time]"
 } else {
 set ::mealbase $::mealbase_max
 set ::mealchoice "Meal [format_meal_id $::mealbase_max]"
 }
set ::currentmeal $::mealbase
db eval {update options set lastmeal_rm = $::currentmeal}
.nut.rm.scale configure -label $::mealchoice
}

#end SetMealBase
}

set GO_change {

proc GO_change {args} {

 db eval {update options set grams = $::GRAMSopt}
 RefreshMealfoodQuantities
 set ::StoryIsStale 1
 if {$::GRAMSopt == 1} {
  for {set i 0} {$i < $::MealfoodSequence} {incr i} {
   ${::rmMenu}.menu.foodspin${i} configure -format {%0.0f} -from -9999 -to 9999 -increment 1
   }
  } elseif {$::GRAMSopt == 0} {
  for {set i 0} {$i < $::MealfoodSequence} {incr i} {
   ${::rmMenu}.menu.foodspin${i} configure -format {%0.1f} -from -999.9 -to 999.9 -increment 0.1
   }
  }
 }

#end GO_change
}

set get_procs_from_db {

proc get_procs_from_db {args} {

# Save the original one so we can chain to it
rename unknown _original_unknown

# Provide our own implementation
proc unknown args {
 set pname [lindex $args 0]
 set arglist [lrange $args 1 end]
 set count [db eval {select count(*) from tcl_code where name = $pname}]
 if {$count == 1} {
  set pcode [db eval {select code from tcl_code where name = $pname}]
  uplevel 1 {*}$pcode
  $pname {*}$arglist
  } else {
  uplevel 1 [list _original_unknown {*}$args]
  }
 }

db function format_meal_id format_meal_id
db function n6hufa n6hufa
db function update_am update_am
db function setRefDesc setRefDesc
db function monoright monoright

}

#end get_procs_from_db
}

set ::PROCNTdv_change {

proc ::PROCNTdv_change {args} {
 if {[string is double -strict $::PROCNTam]} {
  set ::PROCNTamdv [expr {round(100.0 * $::PROCNTam / $::PROCNTdv)}]
  } else { set ::PROCNTamdv "\[No Data\]"
  }
 }

#end ::PROCNTdv_change
}

set ::PROCNTnew_dv {

proc ::PROCNTnew_dv {args} {
 if {[string is double -strict $::PROCNTam]} {
  set ::PROCNTamdv [expr {round(100.0 * $::PROCNTam / $::PROCNTdv)}]
  } else { set ::PROCNTamdv "\[No Data\]"
  }
 if {[string is double -strict $::PROCNTrm]} {
  set ::PROCNTrmdv [expr {round(100.0 * $::PROCNTrm / $::PROCNTdv)}]
  } else { set ::PROCNTrmdv "\[No Data\]"
  }
 if {[string is double -strict $::PROCNTvf]} {
  set ::PROCNTvfdv [expr {round(100.0 * $::PROCNTvf / $::PROCNTdv)}]
  } else { set ::PROCNTvfdv "\[No Data\]"
  }
 }

#end ::PROCNTnew_dv
}

set ::PROCNTnew_rm {

proc ::PROCNTnew_rm {args} {
 if {[string is double -strict $::PROCNTrm]} {
  set ::PROCNTrmdv [expr {round(100.0 * $::PROCNTrm / $::PROCNTdv)}]
  } else { set ::PROCNTrmdv "\[No Data\]"
  }
 }

#end ::PROCNTnew_rm
}

set ::PROCNTnew_vf {

proc ::PROCNTnew_vf {args} {
 if {[string is double -strict $::PROCNTvf]} {
  set ::PROCNTvfdv [expr {round(100.0 * $::PROCNTvf / $::PROCNTdv)}]
  } else { set ::PROCNTvfdv "\[No Data\]"
  }
 }

#end ::PROCNTnew_vf
}

set ::FATdv_change {

proc ::FATdv_change {args} {
 if {[string is double -strict $::FATam]} {
  set ::FATamdv [expr {round(100.0 * $::FATam / $::FATdv)}]
  } else { set ::FATamdv "\[No Data\]"
  }
 }

#end ::FATdv_change
}

set ::FATnew_dv {

proc ::FATnew_dv {args} {
 if {[string is double -strict $::FATam]} {
  set ::FATamdv [expr {round(100.0 * $::FATam / $::FATdv)}]
  } else { set ::FATamdv "\[No Data\]"
  }
 if {[string is double -strict $::FATrm]} {
  set ::FATrmdv [expr {round(100.0 * $::FATrm / $::FATdv)}]
  } else { set ::FATrmdv "\[No Data\]"
  }
 if {[string is double -strict $::FATvf]} {
  set ::FATvfdv [expr {round(100.0 * $::FATvf / $::FATdv)}]
  } else { set ::FATvfdv "\[No Data\]"
  }
 }

#end ::FATnew_dv
}

set ::FATnew_rm {

proc ::FATnew_rm {args} {
 if {[string is double -strict $::FATrm]} {
  set ::FATrmdv [expr {round(100.0 * $::FATrm / $::FATdv)}]
  } else { set ::FATrmdv "\[No Data\]"
  }
 }

#end ::FATnew_rm
}

set ::FATnew_vf {

proc ::FATnew_vf {args} {
 if {[string is double -strict $::FATvf]} {
  set ::FATvfdv [expr {round(100.0 * $::FATvf / $::FATdv)}]
  } else { set ::FATvfdv "\[No Data\]"
  }
 }

#end ::FATnew_vf
}

set ::CHOCDFdv_change {

proc ::CHOCDFdv_change {args} {
 if {[string is double -strict $::CHOCDFam]} {
  set ::CHOCDFamdv [expr {round(100.0 * $::CHOCDFam / $::CHOCDFdv)}]
  } else { set ::CHOCDFamdv "\[No Data\]"
  }
 }

#end ::CHOCDFdv_change
}

set ::CHOCDFnew_dv {

proc ::CHOCDFnew_dv {args} {
 if {[string is double -strict $::CHOCDFam]} {
  set ::CHOCDFamdv [expr {round(100.0 * $::CHOCDFam / $::CHOCDFdv)}]
  } else { set ::CHOCDFamdv "\[No Data\]"
  }
 if {[string is double -strict $::CHOCDFrm]} {
  set ::CHOCDFrmdv [expr {round(100.0 * $::CHOCDFrm / $::CHOCDFdv)}]
  } else { set ::CHOCDFrmdv "\[No Data\]"
  }
 if {[string is double -strict $::CHOCDFvf]} {
  set ::CHOCDFvfdv [expr {round(100.0 * $::CHOCDFvf / $::CHOCDFdv)}]
  } else { set ::CHOCDFvfdv "\[No Data\]"
  }
 }

#end ::CHOCDFnew_dv
}

set ::CHOCDFnew_rm {

proc ::CHOCDFnew_rm {args} {
 if {[string is double -strict $::CHOCDFrm]} {
  set ::CHOCDFrmdv [expr {round(100.0 * $::CHOCDFrm / $::CHOCDFdv)}]
  } else { set ::CHOCDFrmdv "\[No Data\]"
  }
 }

#end ::CHOCDFnew_rm
}

set ::CHOCDFnew_vf {

proc ::CHOCDFnew_vf {args} {
 if {[string is double -strict $::CHOCDFvf]} {
  set ::CHOCDFvfdv [expr {round(100.0 * $::CHOCDFvf / $::CHOCDFdv)}]
  } else { set ::CHOCDFvfdv "\[No Data\]"
  }
 }

#end ::CHOCDFnew_vf
}

set ::ENERC_KCALdv_change {

proc ::ENERC_KCALdv_change {args} {
 if {$::ENERC_KCALopt == 0.0} {set newdv $::ENERC_KCALdv_default} elseif { $::ENERC_KCALopt > 0.0} {set newdv $::ENERC_KCALopt} else {set newdv $::ENERC_KCALam}
 if {$newdv == 0.0} {set newdv $::ENERC_KCALdv_default}
 set newdv [expr {round(10.0 * $newdv) / 10.0}]
 if {$newdv != $::ENERC_KCALdv} { set ::ENERC_KCALdv $newdv }
 if {[string is double -strict $::ENERC_KCALam]} {
  set ::ENERC_KCALamdv [expr {round(100.0 * $::ENERC_KCALam / $::ENERC_KCALdv)}]
  } else { set ::ENERC_KCALamdv "\[No Data\]" }
 }

#end ::ENERC_KCALdv_change
}

set ::ENERC_KCALnew_dv {

proc ::ENERC_KCALnew_dv {args} {
 set ::caloriebutton "Calories ([expr {round($::ENERC_KCALdv)}])"
 if {[string is double -strict $::ENERC_KCALam]} {
  set ::ENERC_KCALamdv [expr {round(100.0 * $::ENERC_KCALam / $::ENERC_KCALdv)}]
  } else { set ::ENERC_KCALamdv "\[No Data\]"
  }
 if {[string is double -strict $::ENERC_KCALrm]} {
  set ::ENERC_KCALrmdv [expr {round(100.0 * $::ENERC_KCALrm / $::ENERC_KCALdv)}]
  } else { set ::ENERC_KCALrmdv "\[No Data\]"
  }
 if {[string is double -strict $::ENERC_KCALvf]} {
  set ::ENERC_KCALvfdv [expr {round(100.0 * $::ENERC_KCALvf / $::ENERC_KCALdv)}]
  } else { set ::ENERC_KCALvfdv "\[No Data\]"
  }
 }

#end ::ENERC_KCALnew_dv
}

set ::ENERC_KCALnew_rm {

proc ::ENERC_KCALnew_rm {args} {
 if {[string is double -strict $::ENERC_KCALrm]} {
  set ::ENERC_KCALrmdv [expr {round(100.0 * $::ENERC_KCALrm / $::ENERC_KCALdv)}]
  } else { set ::ENERC_KCALrmdv "\[No Data\]"
  }
 }

#end ::ENERC_KCALnew_rm
}

set ::ENERC_KCALnew_vf {

proc ::ENERC_KCALnew_vf {args} {
 if {[string is double -strict $::ENERC_KCALvf]} {
  set ::ENERC_KCALvfdv [expr {round(100.0 * $::ENERC_KCALvf / $::ENERC_KCALdv)}]
  } else { set ::ENERC_KCALvfdv "\[No Data\]"
  }
 }

#end ::ENERC_KCALnew_vf
}

set ::FIBTGdv_change {

proc ::FIBTGdv_change {args} {
 if {[string is double -strict $::FIBTGam]} {
  set ::FIBTGamdv [expr {round(100.0 * $::FIBTGam / $::FIBTGdv)}]
  } else { set ::FIBTGamdv "\[No Data\]"
  }
 }

#end ::FIBTGdv_change
}

set ::FIBTGnew_dv {

proc ::FIBTGnew_dv {args} {
 if {[string is double -strict $::FIBTGam]} {
  set ::FIBTGamdv [expr {round(100.0 * $::FIBTGam / $::FIBTGdv)}]
  } else { set ::FIBTGamdv "\[No Data\]"
  }
 if {[string is double -strict $::FIBTGrm]} {
  set ::FIBTGrmdv [expr {round(100.0 * $::FIBTGrm / $::FIBTGdv)}]
  } else { set ::FIBTGrmdv "\[No Data\]"
  }
 if {[string is double -strict $::FIBTGvf]} {
  set ::FIBTGvfdv [expr {round(100.0 * $::FIBTGvf / $::FIBTGdv)}]
  } else { set ::FIBTGvfdv "\[No Data\]"
  }
 }

#end ::FIBTGnew_dv
}

set ::FIBTGnew_rm {

proc ::FIBTGnew_rm {args} {
 if {[string is double -strict $::FIBTGrm]} {
  set ::FIBTGrmdv [expr {round(100.0 * $::FIBTGrm / $::FIBTGdv)}]
  } else { set ::FIBTGrmdv "\[No Data\]"
  }
 }

#end ::FIBTGnew_rm
}

set ::FIBTGnew_vf {

proc ::FIBTGnew_vf {args} {
 if {[string is double -strict $::FIBTGvf]} {
  set ::FIBTGvfdv [expr {round(100.0 * $::FIBTGvf / $::FIBTGdv)}]
  } else { set ::FIBTGvfdv "\[No Data\]"
  }
 }

#end ::FIBTGnew_vf
}

set ::CAdv_change {

proc ::CAdv_change {args} {
 if {$::CAopt == 0.0} {set newdv $::CAdv_default} elseif { $::CAopt > 0.0} {set newdv $::CAopt} else {set newdv $::CAam}
 if {$newdv == 0.0} {set newdv $::CAdv_default}
 if {$newdv != $::CAdv} { set ::CAdv $newdv }
 if {[string is double -strict $::CAam]} {
  set ::CAamdv [expr {round(100.0 * $::CAam / $::CAdv)}]
  } else { set ::CAamdv "\[No Data\]"
  }
 }

#end ::CAdv_change
}

set ::CAnew_dv {

proc ::CAnew_dv {args} {
 if {[string is double -strict $::CAam]} {
  set ::CAamdv [expr {round(100.0 * $::CAam / $::CAdv)}]
  } else { set ::CAamdv "\[No Data\]"
  }
 if {[string is double -strict $::CArm]} {
  set ::CArmdv [expr {round(100.0 * $::CArm / $::CAdv)}]
  } else { set ::CArmdv "\[No Data\]"
  }
 if {[string is double -strict $::CAvf]} {
  set ::CAvfdv [expr {round(100.0 * $::CAvf / $::CAdv)}]
  } else { set ::CAvfdv "\[No Data\]"
  }
 }

#end ::CAnew_dv
}

set ::CAnew_rm {

proc ::CAnew_rm {args} {
 if {[string is double -strict $::CArm]} {
  set ::CArmdv [expr {round(100.0 * $::CArm / $::CAdv)}]
  } else { set ::CArmdv "\[No Data\]"
  }
 }

#end ::CAnew_rm
}

set ::CAnew_vf {

proc ::CAnew_vf {args} {
 if {[string is double -strict $::CAvf]} {
  set ::CAvfdv [expr {round(100.0 * $::CAvf / $::CAdv)}]
  } else { set ::CAvfdv "\[No Data\]"
  }
 }

#end ::CAnew_vf
}

set ::FEdv_change {

proc ::FEdv_change {args} {
 if {$::FEopt == 0.0} {set newdv $::FEdv_default} elseif { $::FEopt > 0.0} {set newdv $::FEopt} else {set newdv $::FEam}
 if {$newdv == 0.0} {set newdv $::FEdv_default}
 if {$newdv != $::FEdv} { set ::FEdv $newdv }
 if {[string is double -strict $::FEam]} {
  set ::FEamdv [expr {round(100.0 * $::FEam / $::FEdv)}]
  } else { set ::FEamdv "\[No Data\]"
  }
 }

#end ::FEdv_change
}

set ::FEnew_dv {

proc ::FEnew_dv {args} {
 if {[string is double -strict $::FEam]} {
  set ::FEamdv [expr {round(100.0 * $::FEam / $::FEdv)}]
  } else { set ::FEamdv "\[No Data\]"
  }
 if {[string is double -strict $::FErm]} {
  set ::FErmdv [expr {round(100.0 * $::FErm / $::FEdv)}]
  } else { set ::FErmdv "\[No Data\]"
  }
 if {[string is double -strict $::FEvf]} {
  set ::FEvfdv [expr {round(100.0 * $::FEvf / $::FEdv)}]
  } else { set ::FEvfdv "\[No Data\]"
  }
 }

#end ::FEnew_dv
}

set ::FEnew_rm {

proc ::FEnew_rm {args} {
 if {[string is double -strict $::FErm]} {
  set ::FErmdv [expr {round(100.0 * $::FErm / $::FEdv)}]
  } else { set ::FErmdv "\[No Data\]"
  }
 }

#end ::FEnew_rm
}

set ::FEnew_vf {

proc ::FEnew_vf {args} {
 if {[string is double -strict $::FEvf]} {
  set ::FEvfdv [expr {round(100.0 * $::FEvf / $::FEdv)}]
  } else { set ::FEvfdv "\[No Data\]"
  }
 }

#end ::FEnew_vf
}

set ::MGdv_change {

proc ::MGdv_change {args} {
 if {$::MGopt == 0.0} {set newdv $::MGdv_default} elseif { $::MGopt > 0.0} {set newdv $::MGopt} else {set newdv $::MGam}
 if {$newdv == 0.0} {set newdv $::MGdv_default}
 if {$newdv != $::MGdv} { set ::MGdv $newdv }
 if {[string is double -strict $::MGam]} {
  set ::MGamdv [expr {round(100.0 * $::MGam / $::MGdv)}]
  } else { set ::MGamdv "\[No Data\]"
  }
 }

#end ::MGdv_change
}

set ::MGnew_dv {

proc ::MGnew_dv {args} {
 if {[string is double -strict $::MGam]} {
  set ::MGamdv [expr {round(100.0 * $::MGam / $::MGdv)}]
  } else { set ::MGamdv "\[No Data\]"
  }
 if {[string is double -strict $::MGrm]} {
  set ::MGrmdv [expr {round(100.0 * $::MGrm / $::MGdv)}]
  } else { set ::MGrmdv "\[No Data\]"
  }
 if {[string is double -strict $::MGvf]} {
  set ::MGvfdv [expr {round(100.0 * $::MGvf / $::MGdv)}]
  } else { set ::MGvfdv "\[No Data\]"
  }
 }

#end ::MGnew_dv
}

set ::MGnew_rm {

proc ::MGnew_rm {args} {
 if {[string is double -strict $::MGrm]} {
  set ::MGrmdv [expr {round(100.0 * $::MGrm / $::MGdv)}]
  } else { set ::MGrmdv "\[No Data\]"
  }
 }

#end ::MGnew_rm
}

set ::MGnew_vf {

proc ::MGnew_vf {args} {
 if {[string is double -strict $::MGvf]} {
  set ::MGvfdv [expr {round(100.0 * $::MGvf / $::MGdv)}]
  } else { set ::MGvfdv "\[No Data\]"
  }
 }

#end ::MGnew_vf
}

set ::Pdv_change {

proc ::Pdv_change {args} {
 if {$::Popt == 0.0} {set newdv $::Pdv_default} elseif { $::Popt > 0.0} {set newdv $::Popt} else {set newdv $::Pam}
 if {$newdv == 0.0} {set newdv $::Pdv_default}
 if {$newdv != $::Pdv} { set ::Pdv $newdv }
 if {[string is double -strict $::Pam]} {
  set ::Pamdv [expr {round(100.0 * $::Pam / $::Pdv)}]
  } else { set ::Pamdv "\[No Data\]"
  }
 }

#end ::Pdv_change
}

set ::Pnew_dv {

proc ::Pnew_dv {args} {
 if {[string is double -strict $::Pam]} {
  set ::Pamdv [expr {round(100.0 * $::Pam / $::Pdv)}]
  } else { set ::Pamdv "\[No Data\]"
  }
 if {[string is double -strict $::Prm]} {
  set ::Prmdv [expr {round(100.0 * $::Prm / $::Pdv)}]
  } else { set ::Prmdv "\[No Data\]"
  }
 if {[string is double -strict $::Pvf]} {
  set ::Pvfdv [expr {round(100.0 * $::Pvf / $::Pdv)}]
  } else { set ::Pvfdv "\[No Data\]"
  }
 }

#end ::Pnew_dv
}

set ::Pnew_rm {

proc ::Pnew_rm {args} {
 if {[string is double -strict $::Prm]} {
  set ::Prmdv [expr {round(100.0 * $::Prm / $::Pdv)}]
  } else { set ::Prmdv "\[No Data\]"
  }
 }

#end ::Pnew_rm
}

set ::Pnew_vf {

proc ::Pnew_vf {args} {
 if {[string is double -strict $::Pvf]} {
  set ::Pvfdv [expr {round(100.0 * $::Pvf / $::Pdv)}]
  } else { set ::Pvfdv "\[No Data\]"
  }
 }

#end ::Pnew_vf
}

set ::Kdv_change {

proc ::Kdv_change {args} {
 if {$::Kopt == 0.0} {set newdv $::Kdv_default} elseif { $::Kopt > 0.0} {set newdv $::Kopt} else {set newdv $::Kam}
 if {$newdv == 0.0} {set newdv $::Kdv_default}
 if {$newdv != $::Kdv} { set ::Kdv $newdv }
 if {[string is double -strict $::Kam]} {
  set ::Kamdv [expr {round(100.0 * $::Kam / $::Kdv)}]
  } else { set ::Kamdv "\[No Data\]"
  }
 }

#end ::Kdv_change
}

set ::Knew_dv {

proc ::Knew_dv {args} {
 if {[string is double -strict $::Kam]} {
  set ::Kamdv [expr {round(100.0 * $::Kam / $::Kdv)}]
  } else { set ::Kamdv "\[No Data\]"
  }
 if {[string is double -strict $::Krm]} {
  set ::Krmdv [expr {round(100.0 * $::Krm / $::Kdv)}]
  } else { set ::Krmdv "\[No Data\]"
  }
 if {[string is double -strict $::Kvf]} {
  set ::Kvfdv [expr {round(100.0 * $::Kvf / $::Kdv)}]
  } else { set ::Kvfdv "\[No Data\]"
  }
 }

#end ::Knew_dv
}

set ::Knew_rm {

proc ::Knew_rm {args} {
 if {[string is double -strict $::Krm]} {
  set ::Krmdv [expr {round(100.0 * $::Krm / $::Kdv)}]
  } else { set ::Krmdv "\[No Data\]"
  }
 }

#end ::Knew_rm
}

set ::Knew_vf {

proc ::Knew_vf {args} {
 if {[string is double -strict $::Kvf]} {
  set ::Kvfdv [expr {round(100.0 * $::Kvf / $::Kdv)}]
  } else { set ::Kvfdv "\[No Data\]"
  }
 }

#end ::Knew_vf
}

set ::NAdv_change {

proc ::NAdv_change {args} {
 if {$::NAopt == 0.0} {set newdv $::NAdv_default} elseif { $::NAopt > 0.0} {set newdv $::NAopt} else {set newdv $::NAam}
 if {$newdv == 0.0} {set newdv $::NAdv_default}
 if {$newdv != $::NAdv} { set ::NAdv $newdv }
 if {[string is double -strict $::NAam]} {
  set ::NAamdv [expr {round(100.0 * $::NAam / $::NAdv)}]
  } else { set ::NAamdv "\[No Data\]"
  }
 }

#end ::NAdv_change
}

set ::NAnew_dv {

proc ::NAnew_dv {args} {
 if {[string is double -strict $::NAam]} {
  set ::NAamdv [expr {round(100.0 * $::NAam / $::NAdv)}]
  } else { set ::NAamdv "\[No Data\]"
  }
 if {[string is double -strict $::NArm]} {
  set ::NArmdv [expr {round(100.0 * $::NArm / $::NAdv)}]
  } else { set ::NArmdv "\[No Data\]"
  }
 if {[string is double -strict $::NAvf]} {
  set ::NAvfdv [expr {round(100.0 * $::NAvf / $::NAdv)}]
  } else { set ::NAvfdv "\[No Data\]"
  }
 }

#end ::NAnew_dv
}

set ::NAnew_rm {

proc ::NAnew_rm {args} {
 if {[string is double -strict $::NArm]} {
  set ::NArmdv [expr {round(100.0 * $::NArm / $::NAdv)}]
  } else { set ::NArmdv "\[No Data\]"
  }
 }

#end ::NAnew_rm
}

set ::NAnew_vf {

proc ::NAnew_vf {args} {
 if {[string is double -strict $::NAvf]} {
  set ::NAvfdv [expr {round(100.0 * $::NAvf / $::NAdv)}]
  } else { set ::NAvfdv "\[No Data\]"
  }
 }

#end ::NAnew_vf
}

set ::ZNdv_change {

proc ::ZNdv_change {args} {
 if {$::ZNopt == 0.0} {set newdv $::ZNdv_default} elseif { $::ZNopt > 0.0} {set newdv $::ZNopt} else {set newdv $::ZNam}
 if {$newdv == 0.0} {set newdv $::ZNdv_default}
 if {$newdv != $::ZNdv} { set ::ZNdv $newdv }
 if {[string is double -strict $::ZNam]} {
  set ::ZNamdv [expr {round(100.0 * $::ZNam / $::ZNdv)}]
  } else { set ::ZNamdv "\[No Data\]"
  }
 }

#end ::ZNdv_change
}

set ::ZNnew_dv {

proc ::ZNnew_dv {args} {
 if {[string is double -strict $::ZNam]} {
  set ::ZNamdv [expr {round(100.0 * $::ZNam / $::ZNdv)}]
  } else { set ::ZNamdv "\[No Data\]"
  }
 if {[string is double -strict $::ZNrm]} {
  set ::ZNrmdv [expr {round(100.0 * $::ZNrm / $::ZNdv)}]
  } else { set ::ZNrmdv "\[No Data\]"
  }
 if {[string is double -strict $::ZNvf]} {
  set ::ZNvfdv [expr {round(100.0 * $::ZNvf / $::ZNdv)}]
  } else { set ::ZNvfdv "\[No Data\]"
  }
 }

#end ::ZNnew_dv
}

set ::ZNnew_rm {

proc ::ZNnew_rm {args} {
 if {[string is double -strict $::ZNrm]} {
  set ::ZNrmdv [expr {round(100.0 * $::ZNrm / $::ZNdv)}]
  } else { set ::ZNrmdv "\[No Data\]"
  }
 }

#end ::ZNnew_rm
}

set ::ZNnew_vf {

proc ::ZNnew_vf {args} {
 if {[string is double -strict $::ZNvf]} {
  set ::ZNvfdv [expr {round(100.0 * $::ZNvf / $::ZNdv)}]
  } else { set ::ZNvfdv "\[No Data\]"
  }
 }

#end ::ZNnew_vf
}

set ::CUdv_change {

proc ::CUdv_change {args} {
 if {$::CUopt == 0.0} {set newdv $::CUdv_default} elseif { $::CUopt > 0.0} {set newdv $::CUopt} else {set newdv $::CUam}
 if {$newdv == 0.0} {set newdv $::CUdv_default}
 if {$newdv != $::CUdv} { set ::CUdv $newdv }
 if {[string is double -strict $::CUam]} {
  set ::CUamdv [expr {round(100.0 * $::CUam / $::CUdv)}]
  } else { set ::CUamdv "\[No Data\]"
  }
 }

#end ::CUdv_change
}

set ::CUnew_dv {

proc ::CUnew_dv {args} {
 if {[string is double -strict $::CUam]} {
  set ::CUamdv [expr {round(100.0 * $::CUam / $::CUdv)}]
  } else { set ::CUamdv "\[No Data\]"
  }
 if {[string is double -strict $::CUrm]} {
  set ::CUrmdv [expr {round(100.0 * $::CUrm / $::CUdv)}]
  } else { set ::CUrmdv "\[No Data\]"
  }
 if {[string is double -strict $::CUvf]} {
  set ::CUvfdv [expr {round(100.0 * $::CUvf / $::CUdv)}]
  } else { set ::CUvfdv "\[No Data\]"
  }
 }

#end ::CUnew_dv
}

set ::CUnew_rm {

proc ::CUnew_rm {args} {
 if {[string is double -strict $::CUrm]} {
  set ::CUrmdv [expr {round(100.0 * $::CUrm / $::CUdv)}]
  } else { set ::CUrmdv "\[No Data\]"
  }
 }

#end ::CUnew_rm
}

set ::CUnew_vf {

proc ::CUnew_vf {args} {
 if {[string is double -strict $::CUvf]} {
  set ::CUvfdv [expr {round(100.0 * $::CUvf / $::CUdv)}]
  } else { set ::CUvfdv "\[No Data\]"
  }
 }

#end ::CUnew_vf
}

set ::MNdv_change {

proc ::MNdv_change {args} {
 if {$::MNopt == 0.0} {set newdv $::MNdv_default} elseif { $::MNopt > 0.0} {set newdv $::MNopt} else {set newdv $::MNam}
 if {$newdv == 0.0} {set newdv $::MNdv_default}
 if {$newdv != $::MNdv} { set ::MNdv $newdv }
 if {[string is double -strict $::MNam]} {
  set ::MNamdv [expr {round(100.0 * $::MNam / $::MNdv)}]
  } else { set ::MNamdv "\[No Data\]"
  }
 }

#end ::MNdv_change
}

set ::MNnew_dv {

proc ::MNnew_dv {args} {
 if {[string is double -strict $::MNam]} {
  set ::MNamdv [expr {round(100.0 * $::MNam / $::MNdv)}]
  } else { set ::MNamdv "\[No Data\]"
  }
 if {[string is double -strict $::MNrm]} {
  set ::MNrmdv [expr {round(100.0 * $::MNrm / $::MNdv)}]
  } else { set ::MNrmdv "\[No Data\]"
  }
 if {[string is double -strict $::MNvf]} {
  set ::MNvfdv [expr {round(100.0 * $::MNvf / $::MNdv)}]
  } else { set ::MNvfdv "\[No Data\]"
  }
 }

#end ::MNnew_dv
}

set ::MNnew_rm {

proc ::MNnew_rm {args} {
 if {[string is double -strict $::MNrm]} {
  set ::MNrmdv [expr {round(100.0 * $::MNrm / $::MNdv)}]
  } else { set ::MNrmdv "\[No Data\]"
  }
 }

#end ::MNnew_rm
}

set ::MNnew_vf {

proc ::MNnew_vf {args} {
 if {[string is double -strict $::MNvf]} {
  set ::MNvfdv [expr {round(100.0 * $::MNvf / $::MNdv)}]
  } else { set ::MNvfdv "\[No Data\]"
  }
 }

#end ::MNnew_vf
}

set ::SEdv_change {

proc ::SEdv_change {args} {
 if {$::SEopt == 0.0} {set newdv $::SEdv_default} elseif { $::SEopt > 0.0} {set newdv $::SEopt} else {set newdv $::SEam}
 if {$newdv == 0.0} {set newdv $::SEdv_default}
 if {$newdv != $::SEdv} { set ::SEdv $newdv }
 if {[string is double -strict $::SEam]} {
  set ::SEamdv [expr {round(100.0 * $::SEam / $::SEdv)}]
  } else { set ::SEamdv "\[No Data\]"
  }
 }

#end ::SEdv_change
}

set ::SEnew_dv {

proc ::SEnew_dv {args} {
 if {[string is double -strict $::SEam]} {
  set ::SEamdv [expr {round(100.0 * $::SEam / $::SEdv)}]
  } else { set ::SEamdv "\[No Data\]"
  }
 if {[string is double -strict $::SErm]} {
  set ::SErmdv [expr {round(100.0 * $::SErm / $::SEdv)}]
  } else { set ::SErmdv "\[No Data\]"
  }
 if {[string is double -strict $::SEvf]} {
  set ::SEvfdv [expr {round(100.0 * $::SEvf / $::SEdv)}]
  } else { set ::SEvfdv "\[No Data\]"
  }
 }

#end ::SEnew_dv
}

set ::SEnew_rm {

proc ::SEnew_rm {args} {
 if {[string is double -strict $::SErm]} {
  set ::SErmdv [expr {round(100.0 * $::SErm / $::SEdv)}]
  } else { set ::SErmdv "\[No Data\]"
  }
 }

#end ::SEnew_rm
}

set ::SEnew_vf {

proc ::SEnew_vf {args} {
 if {[string is double -strict $::SEvf]} {
  set ::SEvfdv [expr {round(100.0 * $::SEvf / $::SEdv)}]
  } else { set ::SEvfdv "\[No Data\]"
  }
 }

#end ::SEnew_vf
}

set ::VITA_IUdv_change {

proc ::VITA_IUdv_change {args} {
 if {$::VITA_IUopt == 0.0} {set newdv $::VITA_IUdv_default} elseif { $::VITA_IUopt > 0.0} {set newdv $::VITA_IUopt} else {set newdv $::VITA_IUam}
 if {$newdv == 0.0} {set newdv $::VITA_IUdv_default}
 if {$newdv != $::VITA_IUdv} { set ::VITA_IUdv $newdv }
 if {[string is double -strict $::VITA_IUam]} {
  set ::VITA_IUamdv [expr {round(100.0 * $::VITA_IUam / $::VITA_IUdv)}]
  } else { set ::VITA_IUamdv "\[No Data\]"
  }
 }

#end ::VITA_IUdv_change
}

set ::VITA_IUnew_dv {

proc ::VITA_IUnew_dv {args} {
 if {[string is double -strict $::VITA_IUam]} {
  set ::VITA_IUamdv [expr {round(100.0 * $::VITA_IUam / $::VITA_IUdv)}]
  } else { set ::VITA_IUamdv "\[No Data\]"
  }
 if {[string is double -strict $::VITA_IUrm]} {
  set ::VITA_IUrmdv [expr {round(100.0 * $::VITA_IUrm / $::VITA_IUdv)}]
  } else { set ::VITA_IUrmdv "\[No Data\]"
  }
 if {[string is double -strict $::VITA_IUvf]} {
  set ::VITA_IUvfdv [expr {round(100.0 * $::VITA_IUvf / $::VITA_IUdv)}]
  } else { set ::VITA_IUvfdv "\[No Data\]"
  }
 }

#end ::VITA_IUnew_dv
}

set ::VITA_IUnew_rm {

proc ::VITA_IUnew_rm {args} {
 if {[string is double -strict $::VITA_IUrm]} {
  set ::VITA_IUrmdv [expr {round(100.0 * $::VITA_IUrm / $::VITA_IUdv)}]
  } else { set ::VITA_IUrmdv "\[No Data\]"
  }
 }

#end ::VITA_IUnew_rm
}

set ::VITA_IUnew_vf {

proc ::VITA_IUnew_vf {args} {
 if {[string is double -strict $::VITA_IUvf]} {
  set ::VITA_IUvfdv [expr {round(100.0 * $::VITA_IUvf / $::VITA_IUdv)}]
  } else { set ::VITA_IUvfdv "\[No Data\]"
  }
 }

#end ::VITA_IUnew_vf
}

set ::VITDdv_change {

proc ::VITDdv_change {args} {
 if {$::VITDopt == 0.0} {set newdv $::VITDdv_default} elseif { $::VITDopt > 0.0} {set newdv $::VITDopt} else {set newdv $::VITDam}
 if {$newdv == 0.0} {set newdv $::VITDdv_default}
 if {$newdv != $::VITDdv} { set ::VITDdv $newdv }
 if {[string is double -strict $::VITDam]} {
  set ::VITDamdv [expr {round(100.0 * $::VITDam / $::VITDdv)}]
  } else { set ::VITDamdv "\[No Data\]"
  }
 }

#end ::VITDdv_change
}

set ::VITDnew_dv {

proc ::VITDnew_dv {args} {
 if {[string is double -strict $::VITDam]} {
  set ::VITDamdv [expr {round(100.0 * $::VITDam / $::VITDdv)}]
  } else { set ::VITDamdv "\[No Data\]"
  }
 if {[string is double -strict $::VITDrm]} {
  set ::VITDrmdv [expr {round(100.0 * $::VITDrm / $::VITDdv)}]
  } else { set ::VITDrmdv "\[No Data\]"
  }
 if {[string is double -strict $::VITDvf]} {
  set ::VITDvfdv [expr {round(100.0 * $::VITDvf / $::VITDdv)}]
  } else { set ::VITDvfdv "\[No Data\]"
  }
 }

#end ::VITDnew_dv
}

set ::VITDnew_rm {

proc ::VITDnew_rm {args} {
 if {[string is double -strict $::VITDrm]} {
  set ::VITDrmdv [expr {round(100.0 * $::VITDrm / $::VITDdv)}]
  } else { set ::VITDrmdv "\[No Data\]"
  }
 }

#end ::VITDnew_rm
}

set ::VITDnew_vf {

proc ::VITDnew_vf {args} {
 if {[string is double -strict $::VITDvf]} {
  set ::VITDvfdv [expr {round(100.0 * $::VITDvf / $::VITDdv)}]
  } else { set ::VITDvfdv "\[No Data\]"
  }
 }

#end ::VITDnew_vf
}

set ::VITCdv_change {

proc ::VITCdv_change {args} {
 if {$::VITCopt == 0.0} {set newdv $::VITCdv_default} elseif { $::VITCopt > 0.0} {set newdv $::VITCopt} else {set newdv $::VITCam}
 if {$newdv == 0.0} {set newdv $::VITCdv_default}
 if {$newdv != $::VITCdv} { set ::VITCdv $newdv }
 if {[string is double -strict $::VITCam]} {
  set ::VITCamdv [expr {round(100.0 * $::VITCam / $::VITCdv)}]
  } else { set ::VITCamdv "\[No Data\]"
  }
 }

#end ::VITCdv_change
}

set ::VITCnew_dv {

proc ::VITCnew_dv {args} {
 if {[string is double -strict $::VITCam]} {
  set ::VITCamdv [expr {round(100.0 * $::VITCam / $::VITCdv)}]
  } else { set ::VITCamdv "\[No Data\]"
  }
 if {[string is double -strict $::VITCrm]} {
  set ::VITCrmdv [expr {round(100.0 * $::VITCrm / $::VITCdv)}]
  } else { set ::VITCrmdv "\[No Data\]"
  }
 if {[string is double -strict $::VITCvf]} {
  set ::VITCvfdv [expr {round(100.0 * $::VITCvf / $::VITCdv)}]
  } else { set ::VITCvfdv "\[No Data\]"
  }
 }

#end ::VITCnew_dv
}

set ::VITCnew_rm {

proc ::VITCnew_rm {args} {
 if {[string is double -strict $::VITCrm]} {
  set ::VITCrmdv [expr {round(100.0 * $::VITCrm / $::VITCdv)}]
  } else { set ::VITCrmdv "\[No Data\]"
  }
 }

#end ::VITCnew_rm
}

set ::VITCnew_vf {

proc ::VITCnew_vf {args} {
 if {[string is double -strict $::VITCvf]} {
  set ::VITCvfdv [expr {round(100.0 * $::VITCvf / $::VITCdv)}]
  } else { set ::VITCvfdv "\[No Data\]"
  }
 }

#end ::VITCnew_vf
}

set ::THIAdv_change {

proc ::THIAdv_change {args} {
 if {$::THIAopt == 0.0} {set newdv $::THIAdv_default} elseif { $::THIAopt > 0.0} {set newdv $::THIAopt} else {set newdv $::THIAam}
 if {$newdv == 0.0} {set newdv $::THIAdv_default}
 if {$newdv != $::THIAdv} { set ::THIAdv $newdv }
 if {[string is double -strict $::THIAam]} {
  set ::THIAamdv [expr {round(100.0 * $::THIAam / $::THIAdv)}]
  } else { set ::THIAamdv "\[No Data\]"
  }
 }

#end ::THIAdv_change
}

set ::THIAnew_dv {

proc ::THIAnew_dv {args} {
 if {[string is double -strict $::THIAam]} {
  set ::THIAamdv [expr {round(100.0 * $::THIAam / $::THIAdv)}]
  } else { set ::THIAamdv "\[No Data\]"
  }
 if {[string is double -strict $::THIArm]} {
  set ::THIArmdv [expr {round(100.0 * $::THIArm / $::THIAdv)}]
  } else { set ::THIArmdv "\[No Data\]"
  }
 if {[string is double -strict $::THIAvf]} {
  set ::THIAvfdv [expr {round(100.0 * $::THIAvf / $::THIAdv)}]
  } else { set ::THIAvfdv "\[No Data\]"
  }
 }

#end ::THIAnew_dv
}

set ::THIAnew_rm {

proc ::THIAnew_rm {args} {
 if {[string is double -strict $::THIArm]} {
  set ::THIArmdv [expr {round(100.0 * $::THIArm / $::THIAdv)}]
  } else { set ::THIArmdv "\[No Data\]"
  }
 }

#end ::THIAnew_rm
}

set ::THIAnew_vf {

proc ::THIAnew_vf {args} {
 if {[string is double -strict $::THIAvf]} {
  set ::THIAvfdv [expr {round(100.0 * $::THIAvf / $::THIAdv)}]
  } else { set ::THIAvfdv "\[No Data\]"
  }
 }

#end ::THIAnew_vf
}

set ::RIBFdv_change {

proc ::RIBFdv_change {args} {
 if {$::RIBFopt == 0.0} {set newdv $::RIBFdv_default} elseif { $::RIBFopt > 0.0} {set newdv $::RIBFopt} else {set newdv $::RIBFam}
 if {$newdv == 0.0} {set newdv $::RIBFdv_default}
 if {$newdv != $::RIBFdv} { set ::RIBFdv $newdv }
 if {[string is double -strict $::RIBFam]} {
  set ::RIBFamdv [expr {round(100.0 * $::RIBFam / $::RIBFdv)}]
  } else { set ::RIBFamdv "\[No Data\]"
  }
 }

#end ::RIBFdv_change
}

set ::RIBFnew_dv {

proc ::RIBFnew_dv {args} {
 if {[string is double -strict $::RIBFam]} {
  set ::RIBFamdv [expr {round(100.0 * $::RIBFam / $::RIBFdv)}]
  } else { set ::RIBFamdv "\[No Data\]"
  }
 if {[string is double -strict $::RIBFrm]} {
  set ::RIBFrmdv [expr {round(100.0 * $::RIBFrm / $::RIBFdv)}]
  } else { set ::RIBFrmdv "\[No Data\]"
  }
 if {[string is double -strict $::RIBFvf]} {
  set ::RIBFvfdv [expr {round(100.0 * $::RIBFvf / $::RIBFdv)}]
  } else { set ::RIBFvfdv "\[No Data\]"
  }
 }

#end ::RIBFnew_dv
}

set ::RIBFnew_rm {

proc ::RIBFnew_rm {args} {
 if {[string is double -strict $::RIBFrm]} {
  set ::RIBFrmdv [expr {round(100.0 * $::RIBFrm / $::RIBFdv)}]
  } else { set ::RIBFrmdv "\[No Data\]"
  }
 }

#end ::RIBFnew_rm
}

set ::RIBFnew_vf {

proc ::RIBFnew_vf {args} {
 if {[string is double -strict $::RIBFvf]} {
  set ::RIBFvfdv [expr {round(100.0 * $::RIBFvf / $::RIBFdv)}]
  } else { set ::RIBFvfdv "\[No Data\]"
  }
 }

#end ::RIBFnew_vf
}

set ::NIAdv_change {

proc ::NIAdv_change {args} {
 if {$::NIAopt == 0.0} {set newdv $::NIAdv_default} elseif { $::NIAopt > 0.0} {set newdv $::NIAopt} else {set newdv $::NIAam}
 if {$newdv == 0.0} {set newdv $::NIAdv_default}
 if {$newdv != $::NIAdv} { set ::NIAdv $newdv }
 if {[string is double -strict $::NIAam]} {
  set ::NIAamdv [expr {round(100.0 * $::NIAam / $::NIAdv)}]
  } else { set ::NIAamdv "\[No Data\]"
  }
 }

#end ::NIAdv_change
}

set ::NIAnew_dv {

proc ::NIAnew_dv {args} {
 if {[string is double -strict $::NIAam]} {
  set ::NIAamdv [expr {round(100.0 * $::NIAam / $::NIAdv)}]
  } else { set ::NIAamdv "\[No Data\]"
  }
 if {[string is double -strict $::NIArm]} {
  set ::NIArmdv [expr {round(100.0 * $::NIArm / $::NIAdv)}]
  } else { set ::NIArmdv "\[No Data\]"
  }
 if {[string is double -strict $::NIAvf]} {
  set ::NIAvfdv [expr {round(100.0 * $::NIAvf / $::NIAdv)}]
  } else { set ::NIAvfdv "\[No Data\]"
  }
 }

#end ::NIAnew_dv
}

set ::NIAnew_rm {

proc ::NIAnew_rm {args} {
 if {[string is double -strict $::NIArm]} {
  set ::NIArmdv [expr {round(100.0 * $::NIArm / $::NIAdv)}]
  } else { set ::NIArmdv "\[No Data\]"
  }
 }

#end ::NIAnew_rm
}

set ::NIAnew_vf {

proc ::NIAnew_vf {args} {
 if {[string is double -strict $::NIAvf]} {
  set ::NIAvfdv [expr {round(100.0 * $::NIAvf / $::NIAdv)}]
  } else { set ::NIAvfdv "\[No Data\]"
  }
 }

#end ::NIAnew_vf
}

set ::PANTACdv_change {

proc ::PANTACdv_change {args} {
 if {$::PANTACopt == 0.0} {set newdv $::PANTACdv_default} elseif { $::PANTACopt > 0.0} {set newdv $::PANTACopt} else {set newdv $::PANTACam}
 if {$newdv == 0.0} {set newdv $::PANTACdv_default}
 if {$newdv != $::PANTACdv} { set ::PANTACdv $newdv }
 if {[string is double -strict $::PANTACam]} {
  set ::PANTACamdv [expr {round(100.0 * $::PANTACam / $::PANTACdv)}]
  } else { set ::PANTACamdv "\[No Data\]"
  }
 }

#end ::PANTACdv_change
}

set ::PANTACnew_dv {

proc ::PANTACnew_dv {args} {
 if {[string is double -strict $::PANTACam]} {
  set ::PANTACamdv [expr {round(100.0 * $::PANTACam / $::PANTACdv)}]
  } else { set ::PANTACamdv "\[No Data\]"
  }
 if {[string is double -strict $::PANTACrm]} {
  set ::PANTACrmdv [expr {round(100.0 * $::PANTACrm / $::PANTACdv)}]
  } else { set ::PANTACrmdv "\[No Data\]"
  }
 if {[string is double -strict $::PANTACvf]} {
  set ::PANTACvfdv [expr {round(100.0 * $::PANTACvf / $::PANTACdv)}]
  } else { set ::PANTACvfdv "\[No Data\]"
  }
 }

#end ::PANTACnew_dv
}

set ::PANTACnew_rm {

proc ::PANTACnew_rm {args} {
 if {[string is double -strict $::PANTACrm]} {
  set ::PANTACrmdv [expr {round(100.0 * $::PANTACrm / $::PANTACdv)}]
  } else { set ::PANTACrmdv "\[No Data\]"
  }
 }

#end ::PANTACnew_rm
}

set ::PANTACnew_vf {

proc ::PANTACnew_vf {args} {
 if {[string is double -strict $::PANTACvf]} {
  set ::PANTACvfdv [expr {round(100.0 * $::PANTACvf / $::PANTACdv)}]
  } else { set ::PANTACvfdv "\[No Data\]"
  }
 }

#end ::PANTACnew_vf
}

set ::VITB6Adv_change {

proc ::VITB6Adv_change {args} {
 if {$::VITB6Aopt == 0.0} {set newdv $::VITB6Adv_default} elseif { $::VITB6Aopt > 0.0} {set newdv $::VITB6Aopt} else {set newdv $::VITB6Aam}
 if {$newdv == 0.0} {set newdv $::VITB6Adv_default}
 if {$newdv != $::VITB6Adv} { set ::VITB6Adv $newdv }
 if {[string is double -strict $::VITB6Aam]} {
  set ::VITB6Aamdv [expr {round(100.0 * $::VITB6Aam / $::VITB6Adv)}]
  } else { set ::VITB6Aamdv "\[No Data\]"
  }
 }

#end ::VITB6Adv_change
}

set ::VITB6Anew_dv {

proc ::VITB6Anew_dv {args} {
 if {[string is double -strict $::VITB6Aam]} {
  set ::VITB6Aamdv [expr {round(100.0 * $::VITB6Aam / $::VITB6Adv)}]
  } else { set ::VITB6Aamdv "\[No Data\]"
  }
 if {[string is double -strict $::VITB6Arm]} {
  set ::VITB6Armdv [expr {round(100.0 * $::VITB6Arm / $::VITB6Adv)}]
  } else { set ::VITB6Armdv "\[No Data\]"
  }
 if {[string is double -strict $::VITB6Avf]} {
  set ::VITB6Avfdv [expr {round(100.0 * $::VITB6Avf / $::VITB6Adv)}]
  } else { set ::VITB6Avfdv "\[No Data\]"
  }
 }

#end ::VITB6Anew_dv
}

set ::VITB6Anew_rm {

proc ::VITB6Anew_rm {args} {
 if {[string is double -strict $::VITB6Arm]} {
  set ::VITB6Armdv [expr {round(100.0 * $::VITB6Arm / $::VITB6Adv)}]
  } else { set ::VITB6Armdv "\[No Data\]"
  }
 }

#end ::VITB6Anew_rm
}

set ::VITB6Anew_vf {

proc ::VITB6Anew_vf {args} {
 if {[string is double -strict $::VITB6Avf]} {
  set ::VITB6Avfdv [expr {round(100.0 * $::VITB6Avf / $::VITB6Adv)}]
  } else { set ::VITB6Avfdv "\[No Data\]"
  }
 }

#end ::VITB6Anew_vf
}

set ::FOLdv_change {

proc ::FOLdv_change {args} {
 if {$::FOLopt == 0.0} {set newdv $::FOLdv_default} elseif { $::FOLopt > 0.0} {set newdv $::FOLopt} else {set newdv $::FOLam}
 if {$newdv == 0.0} {set newdv $::FOLdv_default}
 if {$newdv != $::FOLdv} { set ::FOLdv $newdv }
 if {[string is double -strict $::FOLam]} {
  set ::FOLamdv [expr {round(100.0 * $::FOLam / $::FOLdv)}]
  } else { set ::FOLamdv "\[No Data\]"
  }
 }

#end ::FOLdv_change
}

set ::FOLnew_dv {

proc ::FOLnew_dv {args} {
 if {[string is double -strict $::FOLam]} {
  set ::FOLamdv [expr {round(100.0 * $::FOLam / $::FOLdv)}]
  } else { set ::FOLamdv "\[No Data\]"
  }
 if {[string is double -strict $::FOLrm]} {
  set ::FOLrmdv [expr {round(100.0 * $::FOLrm / $::FOLdv)}]
  } else { set ::FOLrmdv "\[No Data\]"
  }
 if {[string is double -strict $::FOLvf]} {
  set ::FOLvfdv [expr {round(100.0 * $::FOLvf / $::FOLdv)}]
  } else { set ::FOLvfdv "\[No Data\]"
  }
 }

#end ::FOLnew_dv
}

set ::FOLnew_rm {

proc ::FOLnew_rm {args} {
 if {[string is double -strict $::FOLrm]} {
  set ::FOLrmdv [expr {round(100.0 * $::FOLrm / $::FOLdv)}]
  } else { set ::FOLrmdv "\[No Data\]"
  }
 }

#end ::FOLnew_rm
}

set ::FOLnew_vf {

proc ::FOLnew_vf {args} {
 if {[string is double -strict $::FOLvf]} {
  set ::FOLvfdv [expr {round(100.0 * $::FOLvf / $::FOLdv)}]
  } else { set ::FOLvfdv "\[No Data\]"
  }
 }

#end ::FOLnew_vf
}

set ::VITB12dv_change {

proc ::VITB12dv_change {args} {
 if {$::VITB12opt == 0.0} {set newdv $::VITB12dv_default} elseif { $::VITB12opt > 0.0} {set newdv $::VITB12opt} else {set newdv $::VITB12am}
 if {$newdv == 0.0} {set newdv $::VITB12dv_default}
 if {$newdv != $::VITB12dv} { set ::VITB12dv $newdv }
 if {[string is double -strict $::VITB12am]} {
  set ::VITB12amdv [expr {round(100.0 * $::VITB12am / $::VITB12dv)}]
  } else { set ::VITB12amdv "\[No Data\]"
  }
 }

#end ::VITB12dv_change
}

set ::VITB12new_dv {

proc ::VITB12new_dv {args} {
 if {[string is double -strict $::VITB12am]} {
  set ::VITB12amdv [expr {round(100.0 * $::VITB12am / $::VITB12dv)}]
  } else { set ::VITB12amdv "\[No Data\]"
  }
 if {[string is double -strict $::VITB12rm]} {
  set ::VITB12rmdv [expr {round(100.0 * $::VITB12rm / $::VITB12dv)}]
  } else { set ::VITB12rmdv "\[No Data\]"
  }
 if {[string is double -strict $::VITB12vf]} {
  set ::VITB12vfdv [expr {round(100.0 * $::VITB12vf / $::VITB12dv)}]
  } else { set ::VITB12vfdv "\[No Data\]"
  }
 }

#end ::VITB12new_dv
}

set ::VITB12new_rm {

proc ::VITB12new_rm {args} {
 if {[string is double -strict $::VITB12rm]} {
  set ::VITB12rmdv [expr {round(100.0 * $::VITB12rm / $::VITB12dv)}]
  } else { set ::VITB12rmdv "\[No Data\]"
  }
 }

#end ::VITB12new_rm
}

set ::VITB12new_vf {

proc ::VITB12new_vf {args} {
 if {[string is double -strict $::VITB12vf]} {
  set ::VITB12vfdv [expr {round(100.0 * $::VITB12vf / $::VITB12dv)}]
  } else { set ::VITB12vfdv "\[No Data\]"
  }
 }

#end ::VITB12new_vf
}

set ::VITK1dv_change {

proc ::VITK1dv_change {args} {
 if {$::VITK1opt == 0.0} {set newdv $::VITK1dv_default} elseif { $::VITK1opt > 0.0} {set newdv $::VITK1opt} else {set newdv $::VITK1am}
 if {$newdv == 0.0} {set newdv $::VITK1dv_default}
 if {$newdv != $::VITK1dv} { set ::VITK1dv $newdv }
 if {[string is double -strict $::VITK1am]} {
  set ::VITK1amdv [expr {round(100.0 * $::VITK1am / $::VITK1dv)}]
  } else { set ::VITK1amdv "\[No Data\]"
  }
 }

#end ::VITK1dv_change
}

set ::VITK1new_dv {

proc ::VITK1new_dv {args} {
 if {[string is double -strict $::VITK1am]} {
  set ::VITK1amdv [expr {round(100.0 * $::VITK1am / $::VITK1dv)}]
  } else { set ::VITK1amdv "\[No Data\]"
  }
 if {[string is double -strict $::VITK1rm]} {
  set ::VITK1rmdv [expr {round(100.0 * $::VITK1rm / $::VITK1dv)}]
  } else { set ::VITK1rmdv "\[No Data\]"
  }
 if {[string is double -strict $::VITK1vf]} {
  set ::VITK1vfdv [expr {round(100.0 * $::VITK1vf / $::VITK1dv)}]
  } else { set ::VITK1vfdv "\[No Data\]"
  }
 }

#end ::VITK1new_dv
}

set ::VITK1new_rm {

proc ::VITK1new_rm {args} {
 if {[string is double -strict $::VITK1rm]} {
  set ::VITK1rmdv [expr {round(100.0 * $::VITK1rm / $::VITK1dv)}]
  } else { set ::VITK1rmdv "\[No Data\]"
  }
 }

#end ::VITK1new_rm
}

set ::VITK1new_vf {

proc ::VITK1new_vf {args} {
 if {[string is double -strict $::VITK1vf]} {
  set ::VITK1vfdv [expr {round(100.0 * $::VITK1vf / $::VITK1dv)}]
  } else { set ::VITK1vfdv "\[No Data\]"
  }
 }

#end ::VITK1new_vf
}

set ::CHOLEdv_change {

proc ::CHOLEdv_change {args} {
 if {$::CHOLEopt == 0.0} {set newdv $::CHOLEdv_default} elseif { $::CHOLEopt > 0.0} {set newdv $::CHOLEopt} else {set newdv $::CHOLEam}
 if {$newdv == 0.0} {set newdv $::CHOLEdv_default}
 if {$newdv != $::CHOLEdv} { set ::CHOLEdv $newdv }
 if {[string is double -strict $::CHOLEam]} {
  set ::CHOLEamdv [expr {round(100.0 * $::CHOLEam / $::CHOLEdv)}]
  } else { set ::CHOLEamdv "\[No Data\]"
  }
 }

#end ::CHOLEdv_change
}

set ::CHOLEnew_dv {

proc ::CHOLEnew_dv {args} {
 if {[string is double -strict $::CHOLEam]} {
  set ::CHOLEamdv [expr {round(100.0 * $::CHOLEam / $::CHOLEdv)}]
  } else { set ::CHOLEamdv "\[No Data\]"
  }
 if {[string is double -strict $::CHOLErm]} {
  set ::CHOLErmdv [expr {round(100.0 * $::CHOLErm / $::CHOLEdv)}]
  } else { set ::CHOLErmdv "\[No Data\]"
  }
 if {[string is double -strict $::CHOLEvf]} {
  set ::CHOLEvfdv [expr {round(100.0 * $::CHOLEvf / $::CHOLEdv)}]
  } else { set ::CHOLEvfdv "\[No Data\]"
  }
 }

#end ::CHOLEnew_dv
}

set ::CHOLEnew_rm {

proc ::CHOLEnew_rm {args} {
 if {[string is double -strict $::CHOLErm]} {
  set ::CHOLErmdv [expr {round(100.0 * $::CHOLErm / $::CHOLEdv)}]
  } else { set ::CHOLErmdv "\[No Data\]"
  }
 }

#end ::CHOLEnew_rm
}

set ::CHOLEnew_vf {

proc ::CHOLEnew_vf {args} {
 if {[string is double -strict $::CHOLEvf]} {
  set ::CHOLEvfdv [expr {round(100.0 * $::CHOLEvf / $::CHOLEdv)}]
  } else { set ::CHOLEvfdv "\[No Data\]"
  }
 }

#end ::CHOLEnew_vf
}

set ::FASATdv_change {

proc ::FASATdv_change {args} {
 if {[string is double -strict $::FASATam]} {
  set ::FASATamdv [expr {round(100.0 * $::FASATam / $::FASATdv)}]
  } else { set ::FASATamdv "\[No Data\]"
  }
 }

#end ::FASATdv_change
}

set ::FASATnew_dv {

proc ::FASATnew_dv {args} {
 if {[string is double -strict $::FASATam]} {
  set ::FASATamdv [expr {round(100.0 * $::FASATam / $::FASATdv)}]
  } else { set ::FASATamdv "\[No Data\]"
  }
 if {[string is double -strict $::FASATrm]} {
  set ::FASATrmdv [expr {round(100.0 * $::FASATrm / $::FASATdv)}]
  } else { set ::FASATrmdv "\[No Data\]"
  }
 if {[string is double -strict $::FASATvf]} {
  set ::FASATvfdv [expr {round(100.0 * $::FASATvf / $::FASATdv)}]
  } else { set ::FASATvfdv "\[No Data\]"
  }
 }

#end ::FASATnew_dv
}

set ::FASATnew_rm {

proc ::FASATnew_rm {args} {
 if {[string is double -strict $::FASATrm]} {
  set ::FASATrmdv [expr {round(100.0 * $::FASATrm / $::FASATdv)}]
  } else { set ::FASATrmdv "\[No Data\]"
  }
 }

#end ::FASATnew_rm
}

set ::FASATnew_vf {

proc ::FASATnew_vf {args} {
 if {[string is double -strict $::FASATvf]} {
  set ::FASATvfdv [expr {round(100.0 * $::FASATvf / $::FASATdv)}]
  } else { set ::FASATvfdv "\[No Data\]"
  }
 }

#end ::FASATnew_vf
}

set ::FAMSdv_change {

proc ::FAMSdv_change {args} {
 if {[string is double -strict $::FAMSam]} {
  set ::FAMSamdv [expr {round(100.0 * $::FAMSam / $::FAMSdv)}]
  } else { set ::FAMSamdv "\[No Data\]"
  }
 }

#end ::FAMSdv_change
}

set ::FAMSnew_dv {

proc ::FAMSnew_dv {args} {
 if {[string is double -strict $::FAMSam]} {
  set ::FAMSamdv [expr {round(100.0 * $::FAMSam / $::FAMSdv)}]
  } else { set ::FAMSamdv "\[No Data\]"
  }
 if {[string is double -strict $::FAMSrm]} {
  set ::FAMSrmdv [expr {round(100.0 * $::FAMSrm / $::FAMSdv)}]
  } else { set ::FAMSrmdv "\[No Data\]"
  }
 if {[string is double -strict $::FAMSvf]} {
  set ::FAMSvfdv [expr {round(100.0 * $::FAMSvf / $::FAMSdv)}]
  } else { set ::FAMSvfdv "\[No Data\]"
  }
 }

#end ::FAMSnew_dv
}

set ::FAMSnew_rm {

proc ::FAMSnew_rm {args} {
 if {[string is double -strict $::FAMSrm]} {
  set ::FAMSrmdv [expr {round(100.0 * $::FAMSrm / $::FAMSdv)}]
  } else { set ::FAMSrmdv "\[No Data\]"
  }
 }

#end ::FAMSnew_rm
}

set ::FAMSnew_vf {

proc ::FAMSnew_vf {args} {
 if {[string is double -strict $::FAMSvf]} {
  set ::FAMSvfdv [expr {round(100.0 * $::FAMSvf / $::FAMSdv)}]
  } else { set ::FAMSvfdv "\[No Data\]"
  }
 }

#end ::FAMSnew_vf
}

set ::FAPUdv_change {

proc ::FAPUdv_change {args} {
 if {[string is double -strict $::FAPUam]} {
  set ::FAPUamdv [expr {round(100.0 * $::FAPUam / $::FAPUdv)}]
  } else { set ::FAPUamdv "\[No Data\]"
  }
 }

#end ::FAPUdv_change
}

set ::FAPUnew_dv {

proc ::FAPUnew_dv {args} {
 if {[string is double -strict $::FAPUam]} {
  set ::FAPUamdv [expr {round(100.0 * $::FAPUam / $::FAPUdv)}]
  } else { set ::FAPUamdv "\[No Data\]"
  }
 if {[string is double -strict $::FAPUrm]} {
  set ::FAPUrmdv [expr {round(100.0 * $::FAPUrm / $::FAPUdv)}]
  } else { set ::FAPUrmdv "\[No Data\]"
  }
 if {[string is double -strict $::FAPUvf]} {
  set ::FAPUvfdv [expr {round(100.0 * $::FAPUvf / $::FAPUdv)}]
  } else { set ::FAPUvfdv "\[No Data\]"
  }
 }

#end ::FAPUnew_dv
}

set ::FAPUnew_rm {

proc ::FAPUnew_rm {args} {
 if {[string is double -strict $::FAPUrm]} {
  set ::FAPUrmdv [expr {round(100.0 * $::FAPUrm / $::FAPUdv)}]
  } else { set ::FAPUrmdv "\[No Data\]"
  }
 }

#end ::FAPUnew_rm
}

set ::FAPUnew_vf {

proc ::FAPUnew_vf {args} {
 if {[string is double -strict $::FAPUvf]} {
  set ::FAPUvfdv [expr {round(100.0 * $::FAPUvf / $::FAPUdv)}]
  } else { set ::FAPUvfdv "\[No Data\]"
  }
 }

#end ::FAPUnew_vf
}

set ::CHO_NONFIBdv_change {

proc ::CHO_NONFIBdv_change {args} {
 if {[string is double -strict $::CHO_NONFIBam]} {
  set ::CHO_NONFIBamdv [expr {round(100.0 * $::CHO_NONFIBam / $::CHO_NONFIBdv)}]
  set ::CHO_NONFIBam1 [expr {round($::CHO_NONFIBam)}]
  } else {
  set ::CHO_NONFIBamdv "\[No Data\]"
  set ::CHO_NONFIBam1 "\[No Data\]"
  }
 }

#end ::CHO_NONFIBdv_change
}

set ::CHO_NONFIBnew_dv {

proc ::CHO_NONFIBnew_dv {args} {
 if {[string is double -strict $::CHO_NONFIBam]} {
  set ::CHO_NONFIBamdv [expr {round(100.0 * $::CHO_NONFIBam / $::CHO_NONFIBdv)}]
  } else { set ::CHO_NONFIBamdv "\[No Data\]"
  }
 if {[string is double -strict $::CHO_NONFIBrm]} {
  set ::CHO_NONFIBrmdv [expr {round(100.0 * $::CHO_NONFIBrm / $::CHO_NONFIBdv)}]
  } else { set ::CHO_NONFIBrmdv "\[No Data\]"
  }
 if {[string is double -strict $::CHO_NONFIBvf]} {
  set ::CHO_NONFIBvfdv [expr {round(100.0 * $::CHO_NONFIBvf / $::CHO_NONFIBdv)}]
  } else { set ::CHO_NONFIBvfdv "\[No Data\]"
  }
 }

#end ::CHO_NONFIBnew_dv
}

set ::CHO_NONFIBnew_rm {

proc ::CHO_NONFIBnew_rm {args} {
 if {[string is double -strict $::CHO_NONFIBrm]} {
  set ::CHO_NONFIBrmdv [expr {round(100.0 * $::CHO_NONFIBrm / $::CHO_NONFIBdv)}]
  set ::CHO_NONFIBrm1 [expr {round($::CHO_NONFIBrm)}]
  } else {
  set ::CHO_NONFIBrmdv "\[No Data\]"
  set ::CHO_NONFIBrm1 "\[No Data\]"
  }
 }

#end ::CHO_NONFIBnew_rm
}

set ::CHO_NONFIBnew_vf {

proc ::CHO_NONFIBnew_vf {args} {
 if {[string is double -strict $::CHO_NONFIBvf]} {
  set ::CHO_NONFIBvfdv [expr {round(100.0 * $::CHO_NONFIBvf / $::CHO_NONFIBdv)}]
  set ::CHO_NONFIBvf1 [expr {round($::CHO_NONFIBvf)}]
  } else {
  set ::CHO_NONFIBvfdv "\[No Data\]"
  set ::CHO_NONFIBvf1 "\[No Data\]"
  }
 }

#end ::CHO_NONFIBnew_vf
}

set ::LAdv_change {

proc ::LAdv_change {args} {
 if {[string is double -strict $::LAam]} {
  set ::LAamdv [expr {round(100.0 * $::LAam / $::LAdv)}]
  } else { set ::LAamdv "\[No Data\]"
  }
 }

#end ::LAdv_change
}

set ::LAnew_dv {

proc ::LAnew_dv {args} {
 if {[string is double -strict $::LAam]} {
  set ::LAamdv [expr {round(100.0 * $::LAam / $::LAdv)}]
  } else { set ::LAamdv "\[No Data\]"
  }
 if {[string is double -strict $::LArm]} {
  set ::LArmdv [expr {round(100.0 * $::LArm / $::LAdv)}]
  } else { set ::LArmdv "\[No Data\]"
  }
 if {[string is double -strict $::LAvf]} {
  set ::LAvfdv [expr {round(100.0 * $::LAvf / $::LAdv)}]
  } else { set ::LAvfdv "\[No Data\]"
  }
 }

#end ::LAnew_dv
}

set ::LAnew_rm {

proc ::LAnew_rm {args} {
 if {[string is double -strict $::LArm]} {
  set ::LArmdv [expr {round(100.0 * $::LArm / $::LAdv)}]
  } else { set ::LArmdv "\[No Data\]"
  }
 }

#end ::LAnew_rm
}

set ::LAnew_vf {

proc ::LAnew_vf {args} {
 if {[string is double -strict $::LAvf]} {
  set ::LAvfdv [expr {round(100.0 * $::LAvf / $::LAdv)}]
  } else { set ::LAvfdv "\[No Data\]"
  }
 }

#end ::LAnew_vf
}

set ::AAdv_change {

proc ::AAdv_change {args} {
 if {[string is double -strict $::AAam]} {
  set ::AAamdv [expr {round(100.0 * $::AAam / $::AAdv)}]
  } else { set ::AAamdv "\[No Data\]"
  }
 }

#end ::AAdv_change
}

set ::AAnew_dv {

proc ::AAnew_dv {args} {
 if {[string is double -strict $::AAam]} {
  set ::AAamdv [expr {round(100.0 * $::AAam / $::AAdv)}]
  } else { set ::AAamdv "\[No Data\]"
  }
 if {[string is double -strict $::AArm]} {
  set ::AArmdv [expr {round(100.0 * $::AArm / $::AAdv)}]
  } else { set ::AArmdv "\[No Data\]"
  }
 if {[string is double -strict $::AAvf]} {
  set ::AAvfdv [expr {round(100.0 * $::AAvf / $::AAdv)}]
  } else { set ::AAvfdv "\[No Data\]"
  }
 }

#end ::AAnew_dv
}

set ::AAnew_rm {

proc ::AAnew_rm {args} {
 if {[string is double -strict $::AArm]} {
  set ::AArmdv [expr {round(100.0 * $::AArm / $::AAdv)}]
  } else { set ::AArmdv "\[No Data\]"
  }
 }

#end ::AAnew_rm
}

set ::AAnew_vf {

proc ::AAnew_vf {args} {
 if {[string is double -strict $::AAvf]} {
  set ::AAvfdv [expr {round(100.0 * $::AAvf / $::AAdv)}]
  } else { set ::AAvfdv "\[No Data\]"
  }
 }

#end ::AAnew_vf
}

set ::ALAdv_change {

proc ::ALAdv_change {args} {
 if {[string is double -strict $::ALAam]} {
  set ::ALAamdv [expr {round(100.0 * $::ALAam / $::ALAdv)}]
  } else { set ::ALAamdv "\[No Data\]"
  }
 }

#end ::ALAdv_change
}

set ::ALAnew_dv {

proc ::ALAnew_dv {args} {
 if {[string is double -strict $::ALAam]} {
  set ::ALAamdv [expr {round(100.0 * $::ALAam / $::ALAdv)}]
  } else { set ::ALAamdv "\[No Data\]"
  }
 if {[string is double -strict $::ALArm]} {
  set ::ALArmdv [expr {round(100.0 * $::ALArm / $::ALAdv)}]
  } else { set ::ALArmdv "\[No Data\]"
  }
 if {[string is double -strict $::ALAvf]} {
  set ::ALAvfdv [expr {round(100.0 * $::ALAvf / $::ALAdv)}]
  } else { set ::ALAvfdv "\[No Data\]"
  }
 }

#end ::ALAnew_dv
}

set ::ALAnew_rm {

proc ::ALAnew_rm {args} {
 if {[string is double -strict $::ALArm]} {
  set ::ALArmdv [expr {round(100.0 * $::ALArm / $::ALAdv)}]
  } else { set ::ALArmdv "\[No Data\]"
  }
 }

#end ::ALAnew_rm
}

set ::ALAnew_vf {

proc ::ALAnew_vf {args} {
 if {[string is double -strict $::ALAvf]} {
  set ::ALAvfdv [expr {round(100.0 * $::ALAvf / $::ALAdv)}]
  } else { set ::ALAvfdv "\[No Data\]"
  }
 }

#end ::ALAnew_vf
}

set ::EPAdv_change {

proc ::EPAdv_change {args} {
 if {[string is double -strict $::EPAam]} {
  set ::EPAamdv [expr {round(100.0 * $::EPAam / $::EPAdv)}]
  } else { set ::EPAamdv "\[No Data\]"
  }
 }

#end ::EPAdv_change
}

set ::EPAnew_dv {

proc ::EPAnew_dv {args} {
 if {[string is double -strict $::EPAam]} {
  set ::EPAamdv [expr {round(100.0 * $::EPAam / $::EPAdv)}]
  } else { set ::EPAamdv "\[No Data\]"
  }
 if {[string is double -strict $::EPArm]} {
  set ::EPArmdv [expr {round(100.0 * $::EPArm / $::EPAdv)}]
  } else { set ::EPArmdv "\[No Data\]"
  }
 if {[string is double -strict $::EPAvf]} {
  set ::EPAvfdv [expr {round(100.0 * $::EPAvf / $::EPAdv)}]
  } else { set ::EPAvfdv "\[No Data\]"
  }
 }

#end ::EPAnew_dv
}

set ::EPAnew_rm {

proc ::EPAnew_rm {args} {
 if {[string is double -strict $::EPArm]} {
  set ::EPArmdv [expr {round(100.0 * $::EPArm / $::EPAdv)}]
  } else { set ::EPArmdv "\[No Data\]"
  }
 }

#end ::EPAnew_rm
}

set ::EPAnew_vf {

proc ::EPAnew_vf {args} {
 if {[string is double -strict $::EPAvf]} {
  set ::EPAvfdv [expr {round(100.0 * $::EPAvf / $::EPAdv)}]
  } else { set ::EPAvfdv "\[No Data\]"
  }
 }

#end ::EPAnew_vf
}

set ::DHAdv_change {

proc ::DHAdv_change {args} {
 if {[string is double -strict $::DHAam]} {
  set ::DHAamdv [expr {round(100.0 * $::DHAam / $::DHAdv)}]
  } else { set ::DHAamdv "\[No Data\]"
  }
 }

#end ::DHAdv_change
}

set ::DHAnew_dv {

proc ::DHAnew_dv {args} {
 if {[string is double -strict $::DHAam]} {
  set ::DHAamdv [expr {round(100.0 * $::DHAam / $::DHAdv)}]
  } else { set ::DHAamdv "\[No Data\]"
  }
 if {[string is double -strict $::DHArm]} {
  set ::DHArmdv [expr {round(100.0 * $::DHArm / $::DHAdv)}]
  } else { set ::DHArmdv "\[No Data\]"
  }
 if {[string is double -strict $::DHAvf]} {
  set ::DHAvfdv [expr {round(100.0 * $::DHAvf / $::DHAdv)}]
  } else { set ::DHAvfdv "\[No Data\]"
  }
 }

#end ::DHAnew_dv
}

set ::DHAnew_rm {

proc ::DHAnew_rm {args} {
 if {[string is double -strict $::DHArm]} {
  set ::DHArmdv [expr {round(100.0 * $::DHArm / $::DHAdv)}]
  } else { set ::DHArmdv "\[No Data\]"
  }
 }

#end ::DHAnew_rm
}

set ::DHAnew_vf {

proc ::DHAnew_vf {args} {
 if {[string is double -strict $::DHAvf]} {
  set ::DHAvfdv [expr {round(100.0 * $::DHAvf / $::DHAdv)}]
  } else { set ::DHAvfdv "\[No Data\]"
  }
 }

#end ::DHAnew_vf
}

set ::OMEGA6dv_change {

proc ::OMEGA6dv_change {args} {
 if {[string is double -strict $::OMEGA6am]} {
  set ::OMEGA6amdv [expr {round(100.0 * $::OMEGA6am / $::OMEGA6dv)}]
  } else { set ::OMEGA6amdv "\[No Data\]"
  }
 }

#end ::OMEGA6dv_change
}

set ::OMEGA6new_dv {

proc ::OMEGA6new_dv {args} {
 if {[string is double -strict $::OMEGA6am]} {
  set ::OMEGA6amdv [expr {round(100.0 * $::OMEGA6am / $::OMEGA6dv)}]
  } else { set ::OMEGA6amdv "\[No Data\]"
  }
 if {[string is double -strict $::OMEGA6rm]} {
  set ::OMEGA6rmdv [expr {round(100.0 * $::OMEGA6rm / $::OMEGA6dv)}]
  } else { set ::OMEGA6rmdv "\[No Data\]"
  }
 if {[string is double -strict $::OMEGA6vf]} {
  set ::OMEGA6vfdv [expr {round(100.0 * $::OMEGA6vf / $::OMEGA6dv)}]
  } else { set ::OMEGA6vfdv "\[No Data\]"
  }
 }

#end ::OMEGA6new_dv
}

set ::OMEGA6new_rm {

proc ::OMEGA6new_rm {args} {
 if {[string is double -strict $::OMEGA6rm]} {
  set ::OMEGA6rmdv [expr {round(100.0 * $::OMEGA6rm / $::OMEGA6dv)}]
  } else { set ::OMEGA6rmdv "\[No Data\]"
  }
 }

#end ::OMEGA6new_rm
}

set ::OMEGA6new_vf {

proc ::OMEGA6new_vf {args} {
 if {[string is double -strict $::OMEGA6vf]} {
  set ::OMEGA6vfdv [expr {round(100.0 * $::OMEGA6vf / $::OMEGA6dv)}]
  } else { set ::OMEGA6vfdv "\[No Data\]"
  }
 }

#end ::OMEGA6new_vf
}

set ::OMEGA3dv_change {

proc ::OMEGA3dv_change {args} {
 if {[string is double -strict $::OMEGA3am]} {
  set ::OMEGA3amdv [expr {round(100.0 * $::OMEGA3am / $::OMEGA3dv)}]
  } else { set ::OMEGA3amdv "\[No Data\]"
  }
 }

#end ::OMEGA3dv_change
}

set ::OMEGA3new_dv {

proc ::OMEGA3new_dv {args} {
 if {[string is double -strict $::OMEGA3am]} {
  set ::OMEGA3amdv [expr {round(100.0 * $::OMEGA3am / $::OMEGA3dv)}]
  } else { set ::OMEGA3amdv "\[No Data\]"
  }
 if {[string is double -strict $::OMEGA3rm]} {
  set ::OMEGA3rmdv [expr {round(100.0 * $::OMEGA3rm / $::OMEGA3dv)}]
  } else { set ::OMEGA3rmdv "\[No Data\]"
  }
 if {[string is double -strict $::OMEGA3vf]} {
  set ::OMEGA3vfdv [expr {round(100.0 * $::OMEGA3vf / $::OMEGA3dv)}]
  } else { set ::OMEGA3vfdv "\[No Data\]"
  }
 }

#end ::OMEGA3new_dv
}

set ::OMEGA3new_rm {

proc ::OMEGA3new_rm {args} {
 if {[string is double -strict $::OMEGA3rm]} {
  set ::OMEGA3rmdv [expr {round(100.0 * $::OMEGA3rm / $::OMEGA3dv)}]
  } else { set ::OMEGA3rmdv "\[No Data\]"
  }
 }

#end ::OMEGA3new_rm
}

set ::OMEGA3new_vf {

proc ::OMEGA3new_vf {args} {
 if {[string is double -strict $::OMEGA3vf]} {
  set ::OMEGA3vfdv [expr {round(100.0 * $::OMEGA3vf / $::OMEGA3dv)}]
  } else { set ::OMEGA3vfdv "\[No Data\]"
  }
 }

#end ::OMEGA3new_vf
}

set ::VITEdv_change {

proc ::VITEdv_change {args} {
 if {$::VITEopt == 0.0} {set newdv $::VITEdv_default} elseif { $::VITEopt > 0.0} {set newdv $::VITEopt} else {set newdv $::VITEam}
 if {$newdv == 0.0} {set newdv $::VITEdv_default}
 if {$newdv != $::VITEdv} { set ::VITEdv $newdv }
 if {[string is double -strict $::VITEam]} {
  set ::VITEamdv [expr {round(100.0 * $::VITEam / $::VITEdv)}]
  } else { set ::VITEamdv "\[No Data\]"
  }
 }

#end ::VITEdv_change
}

set ::VITEnew_dv {

proc ::VITEnew_dv {args} {
 if {[string is double -strict $::VITEam]} {
  set ::VITEamdv [expr {round(100.0 * $::VITEam / $::VITEdv)}]
  } else { set ::VITEamdv "\[No Data\]"
  }
 if {[string is double -strict $::VITErm]} {
  set ::VITErmdv [expr {round(100.0 * $::VITErm / $::VITEdv)}]
  } else { set ::VITErmdv "\[No Data\]"
  }
 if {[string is double -strict $::VITEvf]} {
  set ::VITEvfdv [expr {round(100.0 * $::VITEvf / $::VITEdv)}]
  } else { set ::VITEvfdv "\[No Data\]"
  }
 }

#end ::VITEnew_dv
}

set ::VITEnew_rm {

proc ::VITEnew_rm {args} {
 if {[string is double -strict $::VITErm]} {
  set ::VITErmdv [expr {round(100.0 * $::VITErm / $::VITEdv)}]
  } else { set ::VITErmdv "\[No Data\]"
  }
 }

#end ::VITEnew_rm
}

set ::VITEnew_vf {

proc ::VITEnew_vf {args} {
 if {[string is double -strict $::VITEvf]} {
  set ::VITEvfdv [expr {round(100.0 * $::VITEvf / $::VITEdv)}]
  } else { set ::VITEvfdv "\[No Data\]"
  }
 }

#end ::VITEnew_vf
}

set ::GLY_Gdv_change {

proc ::GLY_Gdv_change {args} {
 }

#end ::GLY_Gdv_change
}

set ::GLY_Gnew_dv {

proc ::GLY_Gnew_dv {args} {
 }

#end ::GLY_Gnew_dv
}

set ::GLY_Gnew_rm {

proc ::GLY_Gnew_rm {args} {
 }

#end ::GLY_Gnew_rm
}

set ::GLY_Gnew_vf {

proc ::GLY_Gnew_vf {args} {
 }

#end ::GLY_Gnew_vf
}

set ::RETOLdv_change {

proc ::RETOLdv_change {args} {
 }

#end ::RETOLdv_change
}

set ::RETOLnew_dv {

proc ::RETOLnew_dv {args} {
 }

#end ::RETOLnew_dv
}

set ::RETOLnew_rm {

proc ::RETOLnew_rm {args} {
 }

#end ::RETOLnew_rm
}

set ::RETOLnew_vf {

proc ::RETOLnew_vf {args} {
 }

#end ::RETOLnew_vf
}

set load_nutr_def {

proc load_nutr_def {args} {
dbmem eval {create temp table ttnutr_def( Nutr_No text, Units text, Tagname text, NutrDesc text, Num_Dec text, SR_Order int)}
dbmem eval {create temp table tnutr_def( Nutr_No int, Units text, Tagname text, NutrDesc text, Num_Dec text, SR_Order int)}
dbmem eval {create table if not exists nutr_def( Nutr_No int primary key, Units text, Tagname text, NutrDesc text, dv_default real, nutopt real)}

dbmem copy fail ttnutr_def NUTR_DEF.txt "^" ""

dbmem eval {BEGIN}
dbmem eval {insert into tnutr_def select trim(Nutr_No, "~"), trim(Units, "~"), trim(Tagname, "~"), trim(NutrDesc, "~"), NULL, NULL from ttnutr_def}
dbmem eval {update tnutr_def set Tagname = 'ADPROT' where Nutr_No = 257}
dbmem eval {update tnutr_def set Tagname = 'VITD_BOTH' where Nutr_No = 328}
dbmem eval {update tnutr_def set Tagname = 'LUT_ZEA' where Nutr_No = 338}
dbmem eval {update tnutr_def set Tagname = 'VITE_ADDED' where Nutr_No = 573}
dbmem eval {update tnutr_def set Tagname = 'VITB12_ADDED' where Nutr_No = 578}
dbmem eval {update tnutr_def set Tagname = 'F22D1T' where Nutr_No = 664}
dbmem eval {update tnutr_def set Tagname = 'F18D2T' where Nutr_No = 665}
dbmem eval {update tnutr_def set Tagname = 'F18D2I' where Nutr_No = 666}
dbmem eval {update tnutr_def set Tagname = 'F22D1C' where Nutr_No = 676}
dbmem eval {update tnutr_def set Tagname = 'F18D3I' where Nutr_No = 856}
dbmem eval {update tnutr_def set Units = 'mcg' where hex(Units) = 'B567'}
dbmem eval {update tnutr_def set Units = 'kc' where Nutr_No = 208}
dbmem eval {update tnutr_def set NutrDesc = 'Protein' where Nutr_No = 203}
dbmem eval {update tnutr_def set NutrDesc = 'Total Fat' where Nutr_No = 204}
dbmem eval {update tnutr_def set NutrDesc = 'Total Carb' where Nutr_No = 205}
dbmem eval {update tnutr_def set NutrDesc = 'Ash' where Nutr_No = 207}
dbmem eval {update tnutr_def set NutrDesc = 'Calories' where Nutr_No = 208}
dbmem eval {update tnutr_def set NutrDesc = 'Starch' where Nutr_No = 209}
dbmem eval {update tnutr_def set NutrDesc = 'Sucrose' where Nutr_No = 210}
dbmem eval {update tnutr_def set NutrDesc = 'Glucose' where Nutr_No = 211}
dbmem eval {update tnutr_def set NutrDesc = 'Fructose' where Nutr_No = 212}
dbmem eval {update tnutr_def set NutrDesc = 'Lactose' where Nutr_No = 213}
dbmem eval {update tnutr_def set NutrDesc = 'Maltose' where Nutr_No = 214}
dbmem eval {update tnutr_def set NutrDesc = 'Ethyl Alcohol' where Nutr_No = 221}
dbmem eval {update tnutr_def set NutrDesc = 'Water' where Nutr_No = 255}
dbmem eval {update tnutr_def set NutrDesc = 'Adj. Protein' where Nutr_No = 257}
dbmem eval {update tnutr_def set NutrDesc = 'Caffeine' where Nutr_No = 262}
dbmem eval {update tnutr_def set NutrDesc = 'Theobromine' where Nutr_No = 263}
dbmem eval {update tnutr_def set NutrDesc = 'Sugars' where Nutr_No = 269}
dbmem eval {update tnutr_def set NutrDesc = 'Galactose' where Nutr_No = 287}
dbmem eval {update tnutr_def set NutrDesc = 'Fiber' where Nutr_No = 291}
dbmem eval {update tnutr_def set NutrDesc = 'Calcium' where Nutr_No = 301}
dbmem eval {update tnutr_def set NutrDesc = 'Iron' where Nutr_No = 303}
dbmem eval {update tnutr_def set NutrDesc = 'Magnesium' where Nutr_No = 304}
dbmem eval {update tnutr_def set NutrDesc = 'Phosphorus' where Nutr_No = 305}
dbmem eval {update tnutr_def set NutrDesc = 'Potassium' where Nutr_No = 306}
dbmem eval {update tnutr_def set NutrDesc = 'Sodium' where Nutr_No = 307}
dbmem eval {update tnutr_def set NutrDesc = 'Zinc' where Nutr_No = 309}
dbmem eval {update tnutr_def set NutrDesc = 'Copper' where Nutr_No = 312}
dbmem eval {update tnutr_def set NutrDesc = 'Fluoride' where Nutr_No = 313}
dbmem eval {update tnutr_def set NutrDesc = 'Manganese' where Nutr_No = 315}
dbmem eval {update tnutr_def set NutrDesc = 'Selenium' where Nutr_No = 317}
dbmem eval {update tnutr_def set NutrDesc = 'Vitamin A' where Nutr_No = 318}
dbmem eval {update tnutr_def set NutrDesc = 'Retinol' where Nutr_No = 319}
dbmem eval {update tnutr_def set NutrDesc = 'Vit. A, RAE' where Nutr_No = 320}
dbmem eval {update tnutr_def set NutrDesc = 'B-Carotene' where Nutr_No = 321}
dbmem eval {update tnutr_def set NutrDesc = 'A-Carotene' where Nutr_No = 322}
dbmem eval {update tnutr_def set NutrDesc = 'A-Tocopherol' where Nutr_No = 323}
dbmem eval {update tnutr_def set NutrDesc = 'Vitamin D' where Nutr_No = 324}
dbmem eval {update tnutr_def set NutrDesc = 'Vitamin D2' where Nutr_No = 325}
dbmem eval {update tnutr_def set NutrDesc = 'Vitamin D3' where Nutr_No = 326}
dbmem eval {update tnutr_def set NutrDesc = 'Vitamin D2+D3' where Nutr_No = 328}
dbmem eval {update tnutr_def set NutrDesc = 'B-Cryptoxanth.' where Nutr_No = 334}
dbmem eval {update tnutr_def set NutrDesc = 'Lycopene' where Nutr_No = 337}
dbmem eval {update tnutr_def set NutrDesc = 'Lutein+Zeaxan.' where Nutr_No = 338}
dbmem eval {update tnutr_def set NutrDesc = 'B-Tocopherol' where Nutr_No = 341}
dbmem eval {update tnutr_def set NutrDesc = 'G-Tocopherol' where Nutr_No = 342}
dbmem eval {update tnutr_def set NutrDesc = 'D-Tocopherol' where Nutr_No = 343}
dbmem eval {update tnutr_def set NutrDesc = 'A-Tocotrienol' where Nutr_No = 344}
dbmem eval {update tnutr_def set NutrDesc = 'B-Tocotrienol' where Nutr_No = 345}
dbmem eval {update tnutr_def set NutrDesc = 'G-Tocotrienol' where Nutr_No = 346}
dbmem eval {update tnutr_def set NutrDesc = 'D-Tocotrienol' where Nutr_No = 347}
dbmem eval {update tnutr_def set NutrDesc = 'Vitamin C' where Nutr_No = 401}
dbmem eval {update tnutr_def set NutrDesc = 'Thiamin' where Nutr_No = 404}
dbmem eval {update tnutr_def set NutrDesc = 'Riboflavin' where Nutr_No = 405}
dbmem eval {update tnutr_def set NutrDesc = 'Niacin' where Nutr_No = 406}
dbmem eval {update tnutr_def set NutrDesc = 'Panto. Acid' where Nutr_No = 410}
dbmem eval {update tnutr_def set NutrDesc = 'Vitamin B6' where Nutr_No = 415}
dbmem eval {update tnutr_def set NutrDesc = 'Folate' where Nutr_No = 417}
dbmem eval {update tnutr_def set NutrDesc = 'Vitamin B12' where Nutr_No = 418}
dbmem eval {update tnutr_def set NutrDesc = 'Choline' where Nutr_No = 421}
dbmem eval {update tnutr_def set NutrDesc = 'Menaquinone-4' where Nutr_No = 428}
dbmem eval {update tnutr_def set NutrDesc = 'Dihydro-K1' where Nutr_No = 429}
dbmem eval {update tnutr_def set NutrDesc = 'Vitamin K1' where Nutr_No = 430}
dbmem eval {update tnutr_def set NutrDesc = 'Folic Acid' where Nutr_No = 431}
dbmem eval {update tnutr_def set NutrDesc = 'Folate, food' where Nutr_No = 432}
dbmem eval {update tnutr_def set NutrDesc = 'Folate, DFE' where Nutr_No = 435}
dbmem eval {update tnutr_def set NutrDesc = 'Betaine' where Nutr_No = 454}
dbmem eval {update tnutr_def set NutrDesc = 'Tryptophan' where Nutr_No = 501}
dbmem eval {update tnutr_def set NutrDesc = 'Threonine' where Nutr_No = 502}
dbmem eval {update tnutr_def set NutrDesc = 'Isoleucine' where Nutr_No = 503}
dbmem eval {update tnutr_def set NutrDesc = 'Leucine' where Nutr_No = 504}
dbmem eval {update tnutr_def set NutrDesc = 'Lysine' where Nutr_No = 505}
dbmem eval {update tnutr_def set NutrDesc = 'Methionine' where Nutr_No = 506}
dbmem eval {update tnutr_def set NutrDesc = 'Cystine' where Nutr_No = 507}
dbmem eval {update tnutr_def set NutrDesc = 'Phenylalanine' where Nutr_No = 508}
dbmem eval {update tnutr_def set NutrDesc = 'Tyrosine' where Nutr_No = 509}
dbmem eval {update tnutr_def set NutrDesc = 'Valine' where Nutr_No = 510}
dbmem eval {update tnutr_def set NutrDesc = 'Arginine' where Nutr_No = 511}
dbmem eval {update tnutr_def set NutrDesc = 'Histidine' where Nutr_No = 512}
dbmem eval {update tnutr_def set NutrDesc = 'Alanine' where Nutr_No = 513}
dbmem eval {update tnutr_def set NutrDesc = 'Aspartic acid' where Nutr_No = 514}
dbmem eval {update tnutr_def set NutrDesc = 'Glutamic acid' where Nutr_No = 515}
dbmem eval {update tnutr_def set NutrDesc = 'Glycine' where Nutr_No = 516}
dbmem eval {update tnutr_def set NutrDesc = 'Proline' where Nutr_No = 517}
dbmem eval {update tnutr_def set NutrDesc = 'Serine' where Nutr_No = 518}
dbmem eval {update tnutr_def set NutrDesc = 'Hydroxyproline' where Nutr_No = 521}
dbmem eval {update tnutr_def set NutrDesc = 'Vit. E added' where Nutr_No = 573}
dbmem eval {update tnutr_def set NutrDesc = 'Vit. B12 added' where Nutr_No = 578}
dbmem eval {update tnutr_def set NutrDesc = 'Cholesterol' where Nutr_No = 601}
dbmem eval {update tnutr_def set NutrDesc = 'Trans Fat' where Nutr_No = 605}
dbmem eval {update tnutr_def set NutrDesc = 'Sat Fat' where Nutr_No = 606}
dbmem eval {update tnutr_def set NutrDesc = '4:0' where Nutr_No = 607}
dbmem eval {update tnutr_def set NutrDesc = '6:0' where Nutr_No = 608}
dbmem eval {update tnutr_def set NutrDesc = '8:0' where Nutr_No = 609}
dbmem eval {update tnutr_def set NutrDesc = '10:0' where Nutr_No = 610}
dbmem eval {update tnutr_def set NutrDesc = '12:0' where Nutr_No = 611}
dbmem eval {update tnutr_def set NutrDesc = '14:0' where Nutr_No = 612}
dbmem eval {update tnutr_def set NutrDesc = '16:0' where Nutr_No = 613}
dbmem eval {update tnutr_def set NutrDesc = '18:0' where Nutr_No = 614}
dbmem eval {update tnutr_def set NutrDesc = '20:0' where Nutr_No = 615}
dbmem eval {update tnutr_def set NutrDesc = '18:1' where Nutr_No = 617}
dbmem eval {update tnutr_def set NutrDesc = '18:2' where Nutr_No = 618}
dbmem eval {update tnutr_def set NutrDesc = '18:3' where Nutr_No = 619}
dbmem eval {update tnutr_def set NutrDesc = '20:4' where Nutr_No = 620}
dbmem eval {update tnutr_def set NutrDesc = '22:6n-3' where Nutr_No = 621}
dbmem eval {update tnutr_def set NutrDesc = '22:0' where Nutr_No = 624}
dbmem eval {update tnutr_def set NutrDesc = '14:1' where Nutr_No = 625}
dbmem eval {update tnutr_def set NutrDesc = '16:1' where Nutr_No = 626}
dbmem eval {update tnutr_def set NutrDesc = '18:4' where Nutr_No = 627}
dbmem eval {update tnutr_def set NutrDesc = '20:1' where Nutr_No = 628}
dbmem eval {update tnutr_def set NutrDesc = '20:5n-3' where Nutr_No = 629}
dbmem eval {update tnutr_def set NutrDesc = '22:1' where Nutr_No = 630}
dbmem eval {update tnutr_def set NutrDesc = '22:5n-3' where Nutr_No = 631}
dbmem eval {update tnutr_def set NutrDesc = 'Phytosterols' where Nutr_No = 636}
dbmem eval {update tnutr_def set NutrDesc = 'Stigmasterol' where Nutr_No = 638}
dbmem eval {update tnutr_def set NutrDesc = 'Campesterol' where Nutr_No = 639}
dbmem eval {update tnutr_def set NutrDesc = 'BetaSitosterol' where Nutr_No = 641}
dbmem eval {update tnutr_def set NutrDesc = 'Mono Fat' where Nutr_No = 645}
dbmem eval {update tnutr_def set NutrDesc = 'Poly Fat' where Nutr_No = 646}
dbmem eval {update tnutr_def set NutrDesc = '15:0' where Nutr_No = 652}
dbmem eval {update tnutr_def set NutrDesc = '17:0' where Nutr_No = 653}
dbmem eval {update tnutr_def set NutrDesc = '24:0' where Nutr_No = 654}
dbmem eval {update tnutr_def set NutrDesc = '16:1t' where Nutr_No = 662}
dbmem eval {update tnutr_def set NutrDesc = '18:1t' where Nutr_No = 663}
dbmem eval {update tnutr_def set NutrDesc = '22:1t' where Nutr_No = 664}
dbmem eval {update tnutr_def set NutrDesc = '18:2t' where Nutr_No = 665}
dbmem eval {update tnutr_def set NutrDesc = '18:2i' where Nutr_No = 666}
dbmem eval {update tnutr_def set NutrDesc = '18:2t,t' where Nutr_No = 669}
dbmem eval {update tnutr_def set NutrDesc = '18:2CLA' where Nutr_No = 670}
dbmem eval {update tnutr_def set NutrDesc = '24:1c' where Nutr_No = 671}
dbmem eval {update tnutr_def set NutrDesc = '20:2n-6c,c' where Nutr_No = 672}
dbmem eval {update tnutr_def set NutrDesc = '16:1c' where Nutr_No = 673}
dbmem eval {update tnutr_def set NutrDesc = '18:1c' where Nutr_No = 674}
dbmem eval {update tnutr_def set NutrDesc = '18:2n-6c,c' where Nutr_No = 675}
dbmem eval {update tnutr_def set NutrDesc = '22:1c' where Nutr_No = 676}
dbmem eval {update tnutr_def set NutrDesc = '18:3n-6c,c,c' where Nutr_No = 685}
dbmem eval {update tnutr_def set NutrDesc = '17:1' where Nutr_No = 687}
dbmem eval {update tnutr_def set NutrDesc = '20:3' where Nutr_No = 689}
dbmem eval {update tnutr_def set NutrDesc = 'TransMonoenoic' where Nutr_No = 693}
dbmem eval {update tnutr_def set NutrDesc = 'TransPolyenoic' where Nutr_No = 695}
dbmem eval {update tnutr_def set NutrDesc = '13:0' where Nutr_No = 696}
dbmem eval {update tnutr_def set NutrDesc = '15:1' where Nutr_No = 697}
dbmem eval {update tnutr_def set NutrDesc = '18:3n-3c,c,c' where Nutr_No = 851}
dbmem eval {update tnutr_def set NutrDesc = '20:3n-3' where Nutr_No = 852}
dbmem eval {update tnutr_def set NutrDesc = '20:3n-6' where Nutr_No = 853}
dbmem eval {update tnutr_def set NutrDesc = '20:4n-6' where Nutr_No = 855}
dbmem eval {update tnutr_def set NutrDesc = '18:3i' where Nutr_No = 856}
dbmem eval {update tnutr_def set NutrDesc = '21:5' where Nutr_No = 857}
dbmem eval {update tnutr_def set NutrDesc = '22:4' where Nutr_No = 858}
dbmem eval {update tnutr_def set NutrDesc = '18:1n-7t' where Nutr_No = 859}
dbmem eval {insert into tnutr_def values(3000,'kc','PROT_KCAL','Protein Calories','',0)}
dbmem eval {insert into tnutr_def values(3001,'kc','FAT_KCAL','Fat Calories','',0)}
dbmem eval {insert into tnutr_def values(3002,'kc','CHO_KCAL','Carb Calories','',0)}
dbmem eval {insert into tnutr_def values(2000,'g','CHO_NONFIB','Non-Fiber Carb','',0)}
dbmem eval {insert into tnutr_def values(2001,'g','LA','LA','',0)}
dbmem eval {insert into tnutr_def values(2002,'g','AA','AA','',0)}
dbmem eval {insert into tnutr_def values(2003,'g','ALA','ALA','',0)}
dbmem eval {insert into tnutr_def values(2004,'g','EPA','EPA','',0)}
dbmem eval {insert into tnutr_def values(2005,'g','DHA','DHA','',0)}
dbmem eval {insert into tnutr_def values(2006,'g','OMEGA6','Omega-6','',0)}
dbmem eval {insert into tnutr_def values(3003,'g','SHORT6','Short-chain Omega-6','',0)}
dbmem eval {insert into tnutr_def values(3004,'g','LONG6','Long-chain Omega-6','',0)}
dbmem eval {insert into tnutr_def values(2007,'g','OMEGA3','Omega-3','',0)}
dbmem eval {insert into tnutr_def values(3005,'g','SHORT3','Short-chain Omega-3','',0)}
dbmem eval {insert into tnutr_def values(3006,'g','LONG3','Long-chain Omega-3','',0)}
dbmem eval {insert into tnutr_def values(2008,'IU','VITE','Vitamin E','',0)}
dbmem eval {insert or ignore into nutr_def select Nutr_No, Units, Tagname, NutrDesc, 0.0, 0.0 from tnutr_def}
dbmem eval {update nutr_def set dv_default = 2000.0 where Tagname = 'ENERC_KCAL'}
dbmem eval {update nutr_def set dv_default = 50.0 where Tagname = 'PROCNT'}
dbmem eval {update nutr_def set dv_default = 65.0 where Tagname = 'FAT'}
dbmem eval {update nutr_def set dv_default = 300.0 where Tagname = 'CHOCDF'}
dbmem eval {update nutr_def set dv_default = 25.0 where Tagname = 'FIBTG'}
dbmem eval {update nutr_def set dv_default = 275.0 where Tagname = 'CHO_NONFIB'}
dbmem eval {update nutr_def set dv_default = 1000.0 where Tagname = 'CA'}
dbmem eval {update nutr_def set dv_default = 1000.0 where Tagname = 'P'}
dbmem eval {update nutr_def set dv_default = 18.0 where Tagname = 'FE'}
dbmem eval {update nutr_def set dv_default = 2400.0 where Tagname = 'NA'}
dbmem eval {update nutr_def set dv_default = 3500.0 where Tagname = 'K'}
dbmem eval {update nutr_def set dv_default = 400.0 where Tagname = 'MG'}
dbmem eval {update nutr_def set dv_default = 15.0 where Tagname = 'ZN'}
dbmem eval {update nutr_def set dv_default = 2.0 where Tagname = 'CU'}
dbmem eval {update nutr_def set dv_default = 2.0 where Tagname = 'MN'}
dbmem eval {update nutr_def set dv_default = 70.0 where Tagname = 'SE'}
dbmem eval {update nutr_def set dv_default = 5000.0 where Tagname = 'VITA_IU'}
dbmem eval {update nutr_def set dv_default = 30.0 where Tagname = 'VITE'}
dbmem eval {update nutr_def set dv_default = 80.0 where Tagname = 'VITK1'}
dbmem eval {update nutr_def set dv_default = 1.5 where Tagname = 'THIA'}
dbmem eval {update nutr_def set dv_default = 1.7 where Tagname = 'RIBF'}
dbmem eval {update nutr_def set dv_default = 20.0 where Tagname = 'NIA'}
dbmem eval {update nutr_def set dv_default = 10.0 where Tagname = 'PANTAC'}
dbmem eval {update nutr_def set dv_default = 2.0 where Tagname = 'VITB6A'}
dbmem eval {update nutr_def set dv_default = 400.0 where Tagname = 'FOL'}
dbmem eval {update nutr_def set dv_default = 6.0 where Tagname = 'VITB12'}
dbmem eval {update nutr_def set dv_default = 60.0 where Tagname = 'VITC'}
dbmem eval {update nutr_def set dv_default = 20.0 where Tagname = 'FASAT'}
dbmem eval {update nutr_def set dv_default = 300.0 where Tagname = 'CHOLE'}
dbmem eval {update nutr_def set dv_default = 400.0 where Tagname = 'VITD'}
dbmem eval {update nutr_def set dv_default = 8.9 where Tagname = 'FAPU'}
dbmem eval {update nutr_def set dv_default = 0.2 where Tagname = 'AA'}
dbmem eval {update nutr_def set dv_default = 3.8 where Tagname = 'ALA'}
dbmem eval {update nutr_def set dv_default = 0.1 where Tagname = 'EPA'}
dbmem eval {update nutr_def set dv_default = 0.1 where Tagname = 'DHA'}
dbmem eval {update nutr_def set dv_default = 4.7 where Tagname = 'LA'}
dbmem eval {update nutr_def set dv_default = 4.0 where Tagname = 'OMEGA3'}
dbmem eval {update nutr_def set dv_default = 4.9 where Tagname = 'OMEGA6'}
dbmem eval {update nutr_def set dv_default = 32.6 where Tagname = 'FAMS'}
dbmem eval {update nutr_def set dv_default = 7.0 where Tagname = 'GLY_G'}
dbmem eval {update nutr_def set dv_default = 900.0 where Tagname = 'RETOL'}
dbmem eval {COMMIT}
dbmem eval {drop table ttnutr_def}
dbmem eval {drop table tnutr_def}
}

#end load_nutr_def
}

set load_fd_group {

proc load_fd_group {args} {
dbmem eval {create temp table tfd_group( FdGrp_Cd text, FdGrp_Desc text)}
dbmem eval {create table if not exists fd_group(FdGrp_Cd int primary key, FdGrp_Desc text)}
dbmem copy fail tfd_group FD_GROUP.txt "^" ""
set carriagereturn "\r"
dbmem eval {insert or replace into fd_group select trim(FdGrp_Cd, "~"), trim(trim(FdGrp_Desc, $carriagereturn), "~") from tfd_group}
dbmem eval {insert or replace into fd_group values (9999, 'Added Recipes')}
dbmem eval {drop table tfd_group}
}

#end load_fd_group
}

set load_food_des1 {

proc load_food_des1 {args} {
dbmem eval {create temp table tfood_des( NDB_No text, FdGrp_Cd text, Long_Desc text, Shrt_Desc text, ComName text, ManufacName text, Survey text, Ref_desc text, Refuse integer, SciName text, N_Factor real, Pro_Factor real, Fat_Factor real, CHO_Factor real)}
dbmem eval {create table if not exists food_des(NDB_No int primary key, FdGrp_Cd int, Long_Desc text, Shrt_Desc text, Ref_desc text, Refuse integer default 0, Pro_Factor real default 4, Fat_Factor real default 9, CHO_Factor real default 4)}
}

#end load_food_des1
}

set load_food_des2 {

proc load_food_des2 {args} {
dbmem copy fail tfood_des FOOD_DES.txt "^" ""

if {[file exists [file join $::LegacyFileDir "FOOD_DES.txt"]]} {
 dbmem copy fail tfood_des [file nativename [file join $::LegacyFileDir "FOOD_DES.txt"]] "^" ""
 }

dbmem eval {update tfood_des set CHO_Factor = NULL where CHO_Factor = $carriagereturn}
dbmem eval {INSERT OR REPLACE INTO food_des (NDB_No, FdGrp_Cd, Long_Desc, Shrt_Desc, Ref_desc, Refuse, Pro_Factor, Fat_Factor, CHO_Factor) select trim(NDB_No, "~"), trim(FdGrp_Cd, "~"), replace(trim(trim(Long_Desc, "~") || ' (' || trim(SciName, "~") || ')',' ('),' ()',''), upper(substr(trim(Shrt_Desc, "~"),1,1)) || lower(substr(trim(Shrt_Desc, "~"),2)), trim(Ref_desc, "~"), Refuse, Pro_Factor, Fat_Factor, CHO_Factor from tfood_des}
dbmem eval {drop table tfood_des}
dbmem eval {drop index if exists Long_Desc_index}
dbmem eval {create index Long_Desc_index on food_des (Long_Desc)}
dbmem eval {drop index if exists Long_Desc_indexa}
dbmem eval {create index Long_Desc_indexa on food_des (Long_Desc collate nocase asc
)}
dbmem eval {drop view if exists vf}
set ::vfview {CREATE VIEW vf as select n6hufa(SHORT3,SHORT6,LONG3,LONG6,FASAT,FAMS,FATRN,FAPU,ENERC_KCAL,0) as "::FAPU1vf", case when ENERC_KCAL > 0.0 then cast(round(100.0 * PROT_KCAL / ENERC_KCAL) as integer) || ' / ' || cast(round(100.0 * CHO_KCAL / ENERC_KCAL) as integer) || ' / ' || cast(round(100.0 * FAT_KCAL / ENERC_KCAL) as integer) else '0 / 0 / 0' end as "::ENERC_KCAL1vf", food_des.NDB_No as NDB_Novf, Long_Desc, case when Refuse is not null then Refuse || "%" else Refuse end as Refusevf, setRefDesc(Ref_desc)}
dbmem eval {drop view if exists vf}
set ::arview {CREATE VIEW ar as select n6hufa(SHORT3,SHORT6,LONG3,LONG6,FASAT,FAMS,FATRN,FAPU,ENERC_KCAL,0) as "::FAPU1ar", case when ENERC_KCAL > 0.0 then cast(round(100.0 * PROT_KCAL / ENERC_KCAL) as integer) || ' / ' || cast(round(100.0 * CHO_KCAL / ENERC_KCAL) as integer) || ' / ' || cast(round(100.0 * FAT_KCAL / ENERC_KCAL) as integer) else '0 / 0 / 0' end as "::ENERC_KCAL1ar", cast (round(CHO_NONFIB, 0) as int) as "::CHO_NONFIBar1"}
set ::recipe100sql {update recipe set}
dbmem eval {drop view if exists am}
set ::amview {CREATE VIEW am as select format_meal_id(max(meal_id)) as "::LASTMEALam", format_meal_id(min(meal_id)) as "::FIRSTMEALam", min(meal_id) as "::FIRSTMEALts", n6hufa(sum(SHORT3) * meals_per_day / count(meal_id), sum(SHORT6) * meals_per_day / count(meal_id), sum(LONG3) * meals_per_day / count(meal_id), sum(LONG6) * meals_per_day / count(meal_id), sum(FASAT) * meals_per_day / count(meal_id), sum(FAMS) * meals_per_day / count(meal_id), sum(FATRN) * meals_per_day / count(meal_id), sum(FAPU) * meals_per_day / count(meal_id), sum(ENERC_KCAL) * meals_per_day / count(meal_id),0) as "::FAPU1am", case when sum(ENERC_KCAL) * meals_per_day / count(meal_id) > 0.0 then cast(round(100.0 * sum(PROT_KCAL) * meals_per_day / count(meal_id) / (sum(ENERC_KCAL) * meals_per_day / count(meal_id))) as integer) || ' / ' || cast(round(100.0 * sum(CHO_KCAL) * meals_per_day / count(meal_id) / (sum(ENERC_KCAL) * meals_per_day / count(meal_id))) as integer) || ' / ' || cast(round(100.0 * sum(FAT_KCAL) * meals_per_day / count(meal_id) / (sum(ENERC_KCAL) * meals_per_day / count(meal_id))) as integer) else '0 / 0 / 0' end as "::ENERC_KCAL1am"}
dbmem eval {drop view if exists rm}
set ::rmview {CREATE VIEW rm as select n6hufa(SHORT3 * meals_per_day, SHORT6 * meals_per_day, LONG3 * meals_per_day, LONG6 * meals_per_day, FASAT * meals_per_day, FAMS * meals_per_day, FATRN * meals_per_day, FAPU * meals_per_day, ENERC_KCAL * meals_per_day, 0) as "::FAPU1rm", case when ENERC_KCAL * meals_per_day > 0.0 then cast (round(100.0 * PROT_KCAL / ENERC_KCAL) as integer) || ' / ' || cast (round(100.0 * CHO_KCAL / ENERC_KCAL) as integer) || ' / ' || cast (round(100.0 * FAT_KCAL / ENERC_KCAL) as integer) else '0 / 0 / 0' end as "::ENERC_KCAL1rm"}
dbmem eval {update food_des set Shrt_Desc = upper(substr(trim(Long_Desc, "~"),1,1)) || lower(substr(trim(Long_Desc, "~"),2)) where length(Long_Desc) <= 60}
dbmem eval {drop view if exists nut_opts}
set ::nut_optsview {create view nut_opts as select }
dbmem eval {drop view if exists dv_defaults}
set ::dv_defaultsview {create view dv_defaults as select }
dbmem eval {drop view if exists dv}
set ::dvview {create view dv as select }

set food_des_columns [dbmem eval {PRAGMA table_info(food_des)}]
set tagnames [dbmem eval {select Tagname from nutr_def}]
set ::foodjoin {update food_des set }
set ::complete_mealjoin {insert or replace into meals select * from (select meal_date * 100 + meal as meal_id}
set ::update_mealfoods_trigger {CREATE TRIGGER update_mealfoods AFTER UPDATE ON mealfoods BEGIN insert or replace into meals select * from (select meal_date * 100 + meal as meal_id}
set ::insert_mealfoods_trigger {CREATE TRIGGER insert_mealfoods AFTER INSERT ON mealfoods BEGIN insert or replace into meals select * from (select meal_date * 100 + meal as meal_id}
set ::delete_mealfoods_trigger {CREATE TRIGGER delete_mealfoods AFTER DELETE ON mealfoods when (select count(*) from mealfoods where meal_date = OLD.meal_date and meal = OLD.meal) > 0 BEGIN insert or replace into meals select * from (select meal_date * 100 + meal as meal_id}
set ::delete1_mealfoods_trigger {CREATE TRIGGER delete1_mealfoods AFTER DELETE ON mealfoods when (select count(*) from mealfoods where meal_date = OLD.meal_date and meal = OLD.meal) = 0 BEGIN delete from meals where meal_id = OLD.meal_date * 100 + OLD.meal ; end}
set ::am_zero {create view am_zero as select '0 / 0 / 0' as "::ENERC_KCAL1am", '0 / 0' as "::FAPU1am",}
set ::rm_zero {create view rm_zero as select '0 / 0 / 0' as "::ENERC_KCAL1rm", '0 / 0' as "::FAPU1rm",}
set ::vf_zero {create view vf_zero as select '0 / 0 / 0' as "::ENERC_KCAL1vf", '0 / 0' as "::FAPU1vf",}

dbmem eval {drop table if exists meals}
dbmem eval {create table meals (meal_id integer primary key desc)}
foreach tag $tagnames {
 dbmem eval "alter table meals add column $tag real default null"
 if { $tag ni $food_des_columns } {
  dbmem eval "alter table food_des add column $tag real default null"
  }
 append ::am_zero " 0.0 as \"::${tag}am\","
 append ::rm_zero " 0.0 as \"::${tag}rm\","
 append ::vf_zero " 0.0 as \"::${tag}vf\","
 append ::vfview ", round(${tag} * whectograms,1) as \"::${tag}vf\""
 append ::arview ", ${tag} as \"::${tag}ar\""
 append ::recipe100sql " ${tag} = ${tag} / \$::RecipeWeight,"
 append ::amview ", round(sum(${tag}) * meals_per_day / count(meal_id),1) as \"::${tag}am\""
 append ::rmview ", round(${tag} * meals_per_day, 1) as \"::${tag}rm\""
 }
dbmem eval {select Tagname, Nutr_No, dv_default from nutr_def} {
 append ::complete_mealjoin ", sum($Tagname * mhectograms) as $Tagname"
 append ::update_mealfoods_trigger ", sum($Tagname * mhectograms) as $Tagname"
 append ::insert_mealfoods_trigger ", sum($Tagname * mhectograms) as $Tagname"
 append ::delete_mealfoods_trigger ", sum($Tagname * mhectograms) as $Tagname"
 if {$Nutr_No < 1000} {
  append ::foodjoin "$Tagname = case when $Tagname is not null and (select Nutr_Val from tnut_data where food_des.NDB_No = tnut_data.NDB_No and tnut_data.Nutr_No = $Nutr_No) is null then $Tagname else (select Nutr_Val from tnut_data where food_des.NDB_No = tnut_data.NDB_No and tnut_data.Nutr_No = $Nutr_No) end, "
  }
 if {$dv_default != 0.0} {
  append ::nut_optsview "(select nutopt from nutr_def where Tagname = '$Tagname') as \"::${Tagname}opt\", "
  append ::dv_defaultsview "(select dv_default from nutr_def where Tagname = '$Tagname') as \"::${Tagname}dv_default\", "
  append ::dvview "(select dv_default from nutr_def where Tagname = '$Tagname') as \"::${Tagname}dv\", "
  append ::arview ", cast (round(100.0 * ${Tagname} / $dv_default , 0) as int) as \"::${Tagname}ardv\" "
  }
 }
set ::foodjoin [string trimright $::foodjoin]
set ::foodjoin [string trimright $::foodjoin ","]
set ::recipe100sql [string trimright $::recipe100sql ","]
append ::complete_mealjoin { from mealfoods,food_des where mealfoods.NDB_No = food_des.NDB_No group by meal_date,meal)}
append ::update_mealfoods_trigger { from mealfoods,food_des where mealfoods.NDB_No = food_des.NDB_No and meal_date = NEW.meal_date and meal = NEW.meal) ; update weight set whectograms = NEW.mhectograms, Amount = origAmount * NEW.mhectograms / orighectograms where NEW.mhectograms > 0.0 and NDB_No = NEW.NDB_No and Seq = (select min(Seq) from weight where NDB_No = NEW.NDB_No) ; end}
append ::insert_mealfoods_trigger { from mealfoods,food_des where mealfoods.NDB_No = food_des.NDB_No and meal_date = NEW.meal_date and meal = NEW.meal) ; end}
append ::delete_mealfoods_trigger { from mealfoods,food_des where mealfoods.NDB_No = food_des.NDB_No and meal_date = OLD.meal_date and meal = OLD.meal) ; end}
set ::am_zero [string trimright $::am_zero ","]
set ::rm_zero [string trimright $::rm_zero ","]
set ::vf_zero [string trimright $::vf_zero ","]
append ::vfview {, Msre_Desc as Msre_Descvf, cast (round(whectograms * 100.0) as integer) as gramsvf, round(whectograms/0.28349523,1) as ouncesvf, cast (round(ENERC_KCAL*whectograms) as integer) as caloriesvf, round(Amount,1) as Amountvf, 28.349523 as ounce2gram, case when ENERC_KCAL is null or ENERC_KCAL = 0.0 then 0.0 else 100.0/ENERC_KCAL end as cal2gram, 100.0*orighectograms/origAmount as Amount2gram from food_des join weight on food_des.NDB_No = weight.NDB_No and Seq = (select min(Seq) from weight where weight.NDB_No = food_des.NDB_No)}
append ::arview { from recipe}
append ::amview { from (select meals.*, cast (meals_per_day as real) as meals_per_day from meals, options where meal_id <= lastmeal_am limit (select case when defanal_am > 0 then defanal_am else 1000000 end from options))}
append ::rmview { from (select meals.*, cast (meals_per_day as real) as meals_per_day from meals, options where meal_id = lastmeal_rm)}
set ::nut_optsview [string trimright $::nut_optsview " "]
set ::nut_optsview [string trimright $::nut_optsview ","]
set ::dv_defaultsview [string trimright $::dv_defaultsview " "]
set ::dv_defaultsview [string trimright $::dv_defaultsview ","]
set ::dvview [string trimright $::dvview " "]
set ::dvview [string trimright $::dvview ","]
}

#end load_food_des2
}

set load_weight {

proc load_weight {args} {
dbmem eval {create temp table tweight( NDB_No text, Seq text, Amount real, Msre_Desc text, Gm_Wgt real, Num_Data_P int, Std_Dev real)}
dbmem eval {create table if not exists weight( NDB_No int, Seq int, Amount real, Msre_Desc text, whectograms real, origSeq text, origAmount real, orighectograms real, primary key(NDB_No, Seq))}

dbmem copy fail tweight WEIGHT.txt "^" ""

dbmem eval {create temp table tttweight( NDB_No text, Seq text, Amount real, Msre_Desc text, Gm_Wgt real, Num_Data_P int, Std_Dev real)}
if {[file exists [file join $::LegacyFileDir "WEIGHT.txt"]]} {
 dbmem copy fail tttweight [file nativename [file join $::LegacyFileDir "WEIGHT.txt"]] "^" ""
 }

dbmem eval {create temp table ttweight( NDB_No int, Seq int, Amount real, Msre_Desc text, Gm_Wgt real, Num_Data_P int, Std_Dev real, primary key(NDB_No, Seq))}
dbmem eval {insert or replace into ttweight select trim(NDB_No, "~"), trim(Seq, "~"), Amount, trim(Msre_Desc, "~"), Gm_Wgt, Num_Data_P, Std_Dev from tttweight}
dbmem eval {update ttweight set Seq = 98}
dbmem eval {INSERT OR IGNORE INTO weight select NDB_No, 0, Amount, Msre_Desc, Gm_Wgt / 100.0, Seq, Amount, Gm_Wgt / 100.0 from ttweight}
dbmem eval {drop table tttweight}
dbmem eval {drop table ttweight}

dbmem eval {INSERT OR IGNORE INTO weight select trim(NDB_No, "~") , trim(Seq, "~"), Amount, trim(Msre_Desc, "~"), Gm_Wgt / 100.0, trim(Seq, "~"), Amount, Gm_Wgt / 100.0 from tweight}
dbmem eval {insert or ignore into weight select NDB_No, 99, 100, 'grams', 1, 99, 100, 1 from food_des}
dbmem eval {select NDB_No, origSeq from weight where Seq != origSeq} {
 dbmem eval {delete from weight where NDB_No = $NDB_No and Seq = $origSeq}
 }
dbmem eval {drop table tweight}
}

#end load_weight
}

set load_nut_data1 {

proc load_nut_data1 {args} {
dbmem eval {create temp table ttnut_data( NDB_No text, Nutr_No text, Nutr_Val real, Num_Data_Pts int, Std_Error real, Src_Cd text, Deriv_Cd text, Ref_NDB_No text, Add_Nutr_Mark text, Num_Studies int, Min real, Max real, DF int, Low_EB real, Up_EB real, Stat_cmt text, AddMod_Date text, CC text)}
dbmem copy fail ttnut_data NUT_DATA.txt "^" ""
if {[file exists [file join $::LegacyFileDir "NUT_DATA.txt"]]} {
 dbmem copy fail ttnut_data [file nativename [file join $::LegacyFileDir "NUT_DATA.txt"]] "^" ""
 }
}

#end load_nut_data1
}

set load_nut_data2 {

proc load_nut_data2 {args} {
dbmem eval {create temp table tnut_data( NDB_No int, Nutr_No int, Nutr_Val real, primary key(NDB_No, Nutr_No))}
dbmem eval {insert or replace into tnut_data select trim(NDB_No, "~"), trim(Nutr_No, "~"), Nutr_Val from ttnut_data}
dbmem eval {drop table ttnut_data}
}

#end load_nut_data2
}

set load_legacy {

proc load_legacy {args} {
dbmem eval {drop trigger if exists update_mealfoods}
dbmem eval {drop trigger if exists insert_mealfoods}
dbmem eval {drop trigger if exists delete_mealfoods}
dbmem eval {drop trigger if exists delete1_mealfoods}

dbmem eval {create table if not exists options(defanal_am integer default 0, FAPU1 real default 0.0, meals_per_day int default 3, grams int default 1, lastmeal_am integer default 2147123119, lastmeal_rm integer, wltweak integer default 0, wlpolarity integer default 0, autocal integer default 0)}
dbmem eval {create table if not exists mealfoods(meal_date int, meal int, NDB_No int, mhectograms real, primary key(meal_date, meal, NDB_No))}
dbmem eval {create table if not exists archive_mealfoods(meal_date int, meal int, NDB_No int, mhectograms real, meals_per_day integer, primary key(meal_date, meal, NDB_No, meals_per_day))}
dbmem eval {create table if not exists theusual(meal_name text, NDB_No int, PCF text, primary key(meal_name,NDB_No))}
dbmem eval {create table if not exists wlog(weight real, bodyfat real, wldate int, cleardate int, primary key(wldate, cleardate))}
dbmem eval {create temp table toptions(opt int, optval real, nothing text)}
dbmem eval {create temp table tuserfiles (filename text)}

set legacyfiles [glob -nocomplain [file join $::LegacyFileDir "OPTIONS.txt"] [file join $::LegacyFileDir "WLOG.2"]* [file join $::LegacyFileDir "WLOG.txt"] $::LegacyFileDir/*.exp]

foreach file $legacyfiles {
 dbmem eval "insert into tuserfiles values ('$file')"
 }
dbmem eval {select count(*) as lfcount from tuserfiles} {}
if {$lfcount != 0} {
 dbmem eval {select count(*) as count, filename from tuserfiles where filename like '%OPTIONS.txt%'} {
  if {$count == 1} {
   dbmem copy ignore toptions $filename "^" ""
   dbmem eval {select count(*) as optcount from options} {
    if {$optcount == 0} {
     dbmem eval {update nutr_def set nutopt = case when (select optval from toptions t where nutr_def.Nutr_No = t.opt) != 0.0 then (select optval from toptions t where nutr_def.Nutr_No = t.opt) else nutopt end}
     dbmem eval {update options set defanal_am = (select optval from toptions t where t.opt = 1019)}
     dbmem eval {update options set grams = (select optval from toptions t where t.opt = 1010)}
     dbmem eval {update options set FAPU1 = (select optval from toptions t where t.opt = 1016)}
     dbmem eval {update options set wltweak = (select optval from toptions t where t.opt = 1024)}
     dbmem eval {update options set wlpolarity = (select optval from toptions t where t.opt = 1025)}
     dbmem eval {update options set autocal = (select optval from toptions t where t.opt = 1011)}
     dbmem eval {update options set meals_per_day = (select optval from toptions t where t.opt = 1009)}
     }
    }
   }
  dbmem eval {select count(*) as count, filename from tuserfiles where filename like '%meal.exp%'} {
   if {$count == 1} {
    dbmem eval {create temp table tmealfoods (meal_date int, meal int, NDB_No int, grams real)}
    dbmem copy replace tmealfoods $filename "^" ""
    dbmem eval {insert or replace into mealfoods select meal_date, meal, NDB_No, sum(grams) / 100.0 from tmealfoods group by meal_date,meal,NDB_No}
    }
   }
  dbmem eval {select count(*) as count, filename from tuserfiles where filename like '%theusual.exp%'} {
   if {$count == 1} {
    dbmem eval {create table if not exists ttheusual(meal_name text, meal_code int, NDB_No int, grams real, primary key(meal_name,NDB_No))}
    dbmem copy ignore ttheusual $filename "^" ""
    dbmem eval {insert or replace into theusual select meal_name, NDB_No, 'No Auto Portion Control' from ttheusual}
    }
   }
  dbmem eval {create temp table ttwlog(weight real, bodyfat real, wldate int)}
  dbmem eval {create temp table twlog(weight real, bodyfat real, wldate int, cleardate int)}
  dbmem eval {select filename from tuserfiles where filename like '%WLOG.2%'} {
   dbmem copy replace ttwlog $filename " " ""
   set cleardate [string range $filename [string last "." $filename]+1 end]
   dbmem eval {insert into twlog select weight, bodyfat, wldate, $cleardate from ttwlog}
   dbmem eval {insert or replace into wlog select * from twlog}
   dbmem eval {delete from ttwlog}
   dbmem eval {delete from twlog}
   }
  dbmem eval {select filename from tuserfiles where filename like('%WLOG.txt%')} {
   dbmem copy replace ttwlog $filename " " ""
   dbmem eval {insert into ttwlog select weight, bodyfat, wldate from wlog where cleardate is null}
   dbmem eval {delete from wlog where cleardate is null}
   dbmem eval {insert into wlog select distinct weight, bodyfat, wldate, NULL from ttwlog}
   }
  }
 dbmem eval {drop table if exists toptions}
 dbmem eval {drop table if exists ttheusual}
 dbmem eval {drop table if exists tuserfiles}
 dbmem eval {drop table if exists tmealfoods}
 dbmem eval {drop table if exists ttwlog}
 dbmem eval {drop table if exists twlog}
 }

dbmem eval {create table if not exists sql_statements(sqlname text primary key, sql text)}

dbmem eval {insert or replace into sql_statements values('recipe100',$::recipe100sql)}
dbmem eval {insert or replace into sql_statements values('complete_mealjoin',$::complete_mealjoin)}
set ::complete_mealjoin [dbmem eval {select sql from sql_statements where sqlname = 'complete_mealjoin'}]
dbmem eval {*}$::complete_mealjoin
dbmem eval {insert or replace into sql_statements values('update_mealfoods_trigger',$::update_mealfoods_trigger)}
dbmem eval {insert or replace into sql_statements values('insert_mealfoods_trigger',$::insert_mealfoods_trigger)}
dbmem eval {insert or replace into sql_statements values('delete_mealfoods_trigger',$::delete_mealfoods_trigger)}
dbmem eval {insert or replace into sql_statements values('delete1_mealfoods_trigger',$::delete1_mealfoods_trigger)}
dbmem eval $::update_mealfoods_trigger
dbmem eval $::insert_mealfoods_trigger
dbmem eval $::delete_mealfoods_trigger
dbmem eval $::delete1_mealfoods_trigger
dbmem eval {drop view if exists am_zero; drop view if exists rm_zero; drop view if exists vf_zero}
dbmem eval $::am_zero
dbmem eval $::rm_zero
dbmem eval $::vf_zero
dbmem eval $::vfview
dbmem eval $::amview
dbmem eval $::rmview
dbmem eval $::nut_optsview
dbmem eval $::dv_defaultsview
dbmem eval $::dvview
dbmem eval {drop table if exists recipe}
set recipestr [dbmem eval {select sql from sqlite_master where name = 'food_des'}]
set recipestr [string map {food_des recipe} $recipestr]
dbmem eval {*}$recipestr
dbmem eval {drop view if exists ar}
dbmem eval $::arview
dbmem eval {drop view if exists weightslope}
dbmem eval {drop view if exists fatslope}
dbmem eval {create view weightslope as select ifnull(weightslope,0.0) as "::weightslope", ifnull(round(sumy / n - weightslope * sumx / n,1),0.0) as "::weightyintercept", n as "::weightn" from (select (sumxy - (sumx * sumy / n)) / (sumxx - (sumx * sumx / n)) as weightslope, sumy, n, sumx from (select sum(x) as sumx, sum(y) as sumy, sum(x*y) as sumxy, sum(x*x) as sumxx, n from (select cast (cast (julianday(substr(wldate,1,4) || '-' || substr(wldate,5,2) || '-' || substr(wldate,7,2)) - julianday('now', 'localtime') as int) as real) as x, weight as y, cast ((select count(*) from wlog where cleardate is null) as real) as n from wlog where cleardate is null)))}
dbmem eval {create view fatslope as select ifnull(fatslope,0.0) as "::fatslope", ifnull(round(sumy / n - fatslope * sumx / n,1),0.0) as "::fatyintercept", n as "::fatn" from (select (sumxy - (sumx * sumy / n)) / (sumxx - (sumx * sumx / n)) as fatslope, sumy, n, sumx from (select sum(x) as sumx, sum(y) as sumy, sum(x*y) as sumxy, sum(x*x) as sumxx, n from (select cast (cast (julianday(substr(wldate,1,4) || '-' || substr(wldate,5,2) || '-' || substr(wldate,7,2)) - julianday('now', 'localtime') as int) as real) as x, bodyfat * weight / 100.0 as y, cast ((select count(*) from wlog where ifnull(bodyfat,0.0) > 0.0 and cleardate is null) as real) as n from wlog where ifnull(bodyfat,0.0) > 0.0 and cleardate is null)))}

if {[dbmem eval {select count(*) from options}] == 0} {
 dbmem eval {insert into options default values}
 }
}

#end load_legacy
}

db eval {BEGIN}
db eval {insert or replace into version values('NUTsqlite 1.9.9.6',NULL)}
db eval {delete from tcl_code}
db eval {insert or replace into tcl_code values('Main',$Main)}
db eval {insert or replace into tcl_code values('InitialLoad',$InitialLoad)}
db eval {insert or replace into tcl_code values('ComputeDerivedValues',$ComputeDerivedValues)}
db eval {insert or replace into tcl_code values('Start_NUT',$Start_NUT)}
db eval {insert or replace into tcl_code values('AmountChangevf',$AmountChangevf)}
db eval {insert or replace into tcl_code values('CalChangevf',$CalChangevf)}
db eval {insert or replace into tcl_code values('CancelSearch',$CancelSearch)}
db eval {insert or replace into tcl_code values('FindFoodrm',$FindFoodrm)}
db eval {insert or replace into tcl_code values('FindFoodrm_later',$FindFoodrm_later)}
db eval {insert or replace into tcl_code values('FindFoodvf',$FindFoodvf)}
db eval {insert or replace into tcl_code values('FindFoodvf_later',$FindFoodvf_later)}
db eval {insert or replace into tcl_code values('FoodChoicerm',$FoodChoicerm)}
db eval {insert or replace into tcl_code values('vf2rm',$vf2rm)}
db eval {insert or replace into tcl_code values('FoodChoicevf',$FoodChoicevf)}
db eval {insert or replace into tcl_code values('FoodChoicevf_alt',$FoodChoicevf_alt)}
db eval {insert or replace into tcl_code values('FoodSearchrm',$FoodSearchrm)}
db eval {insert or replace into tcl_code values('FoodSearchvf',$FoodSearchvf)}
db eval {insert or replace into tcl_code values('GramChangevf',$GramChangevf)}
db eval {insert or replace into tcl_code values('GramChangevfIdle',$GramChangevfIdle)}
db eval {insert or replace into tcl_code values('InitializePersonalOptions',$InitializePersonalOptions)}
db eval {insert or replace into tcl_code values('ChangePersonalOptions',$ChangePersonalOptions)}
db eval {insert or replace into tcl_code values('RefreshWeightLog',$RefreshWeightLog)}
db eval {insert or replace into tcl_code values('ClearWeightLog',$ClearWeightLog)}
db eval {insert or replace into tcl_code values('AcceptNewMeasurements',$AcceptNewMeasurements)}
db eval {insert or replace into tcl_code values('MealfoodDelete',$MealfoodDelete)}
db eval {insert or replace into tcl_code values('MealfoodSetWeight',$MealfoodSetWeight)}
db eval {insert or replace into tcl_code values('MealfoodSetWeightLater',$MealfoodSetWeightLater)}
db eval {insert or replace into tcl_code values('MealfoodWidget',$MealfoodWidget)}
db eval {insert or replace into tcl_code values('NBWamTabChange',$NBWamTabChange)}
db eval {insert or replace into tcl_code values('NBWrmTabChange',$NBWrmTabChange)}
db eval {insert or replace into tcl_code values('NBWarTabChange',$NBWarTabChange)}
db eval {insert or replace into tcl_code values('NBWvfTabChange',$NBWvfTabChange)}
db eval {insert or replace into tcl_code values('NewStoryLater',$NewStoryLater)}
db eval {insert or replace into tcl_code values('NewStory',$NewStory)}
db eval {insert or replace into tcl_code values('NutTabChange',$NutTabChange)}
db eval {insert or replace into tcl_code values('OunceChangevf',$OunceChangevf)}
db eval {insert or replace into tcl_code values('PCF',$PCF)}
db eval {insert or replace into tcl_code values('RefreshMealfoodQuantities',$RefreshMealfoodQuantities)}
db eval {insert or replace into tcl_code values('RecipeSaveAs',$RecipeSaveAs)}
db eval {insert or replace into tcl_code values('RecipeMod1',$RecipeMod1)}
db eval {insert or replace into tcl_code values('RecipeModdv',$RecipeModdv)}
db eval {insert or replace into tcl_code values('RecipeMod',$RecipeMod)}
db eval {insert or replace into tcl_code values('RecipeCancel',$RecipeCancel)}
db eval {insert or replace into tcl_code values('RecipeDone',$RecipeDone)}
db eval {insert or replace into tcl_code values('ServingChange',$ServingChange)}
db eval {insert or replace into tcl_code values('SetDefanal',$SetDefanal)}
db eval {insert or replace into tcl_code values('SetDefanalLater',$SetDefanalLater)}
db eval {insert or replace into tcl_code values('SetMealRange_am',$SetMealRange_am)}
db eval {insert or replace into tcl_code values('SetMPD',$SetMPD)}
db eval {insert or replace into tcl_code values('SwitchToAnalysis',$SwitchToAnalysis)}
db eval {insert or replace into tcl_code values('SwitchToMenu',$SwitchToMenu)}
db eval {insert or replace into tcl_code values('TurnOffTheBubbleMachine',$TurnOffTheBubbleMachine)}
db eval {insert or replace into tcl_code values('auto_cal',$auto_cal)}
db eval {insert or replace into tcl_code values('badPCF',$badPCF)}
db eval {insert or replace into tcl_code values('dropoutvf',$dropoutvf)}
db eval {insert or replace into tcl_code values('format_meal_id',$format_meal_id)}
db eval {insert or replace into tcl_code values('mealchange',$mealchange)}
db eval {insert or replace into tcl_code values('n6hufa',$n6hufa)}
db eval {insert or replace into tcl_code values('recenterscale',$recenterscale)}
db eval {insert or replace into tcl_code values('setPCF',$setPCF)}
db eval {insert or replace into tcl_code values('setRefDesc',$setRefDesc)}
db eval {insert or replace into tcl_code values('tuneinvf',$tuneinvf)}
db eval {insert or replace into tcl_code values('update_am',$update_am)}
db eval {insert or replace into tcl_code values('pbprog',$pbprog)}
db eval {insert or replace into tcl_code values('pbprog1',$pbprog1)}
db eval {insert or replace into tcl_code values('theusualPopulateMenu',$theusualPopulateMenu)}
db eval {insert or replace into tcl_code values('theusualAdd',$theusualAdd)}
db eval {insert or replace into tcl_code values('theusualSave',$theusualSave)}
db eval {insert or replace into tcl_code values('theusualSaveNew',$theusualSaveNew)}
db eval {insert or replace into tcl_code values('theusualNewName',$theusualNewName)}
db eval {insert or replace into tcl_code values('theusualDelete',$theusualDelete)}
db eval {insert or replace into tcl_code values('monoright',$monoright)}
db eval {insert or replace into tcl_code values('rank2vf',$rank2vf)}
db eval {insert or replace into tcl_code values('rm2vf',$rm2vf)}
db eval {insert or replace into tcl_code values('changedv_vitmin',$changedv_vitmin)}
db eval {insert or replace into tcl_code values('Main_alt',$Main_alt)}
db eval {insert or replace into tcl_code values('drawClock',$drawClock)}
db eval {insert or replace into tcl_code values('stundenZeigerAuf',$stundenZeigerAuf)}
db eval {insert or replace into tcl_code values('minutenZeigerAuf',$minutenZeigerAuf)}
db eval {insert or replace into tcl_code values('sekundenZeigerAuf',$sekundenZeigerAuf)}
db eval {insert or replace into tcl_code values('showTime',$showTime)}
db eval {insert or replace into tcl_code values('InitialLoad_alt_GUI',$InitialLoad_alt_GUI)}
db eval {insert or replace into tcl_code values('pbprog_threaded',$pbprog_threaded)}
db eval {insert or replace into tcl_code values('pbprog1_threaded',$pbprog1_threaded)}
db eval {insert or replace into tcl_code values('Start_NUT_alt_GUI',$Start_NUT_alt_GUI)}
db eval {insert or replace into tcl_code values('opt_change',$opt_change)}
db eval {insert or replace into tcl_code values('SetMealBase',$SetMealBase)}
db eval {insert or replace into tcl_code values('GO_change',$GO_change)}
db eval {insert or replace into tcl_code values('get_procs_from_db',$get_procs_from_db)}
db eval {insert or replace into tcl_code values('::PROCNTdv_change',$::PROCNTdv_change)}
db eval {insert or replace into tcl_code values('::PROCNTnew_dv',$::PROCNTnew_dv)}
db eval {insert or replace into tcl_code values('::PROCNTnew_rm',$::PROCNTnew_rm)}
db eval {insert or replace into tcl_code values('::PROCNTnew_vf',$::PROCNTnew_vf)}
db eval {insert or replace into tcl_code values('::FATdv_change',$::FATdv_change)}
db eval {insert or replace into tcl_code values('::FATnew_dv',$::FATnew_dv)}
db eval {insert or replace into tcl_code values('::FATnew_rm',$::FATnew_rm)}
db eval {insert or replace into tcl_code values('::FATnew_vf',$::FATnew_vf)}
db eval {insert or replace into tcl_code values('::CHOCDFdv_change',$::CHOCDFdv_change)}
db eval {insert or replace into tcl_code values('::CHOCDFnew_dv',$::CHOCDFnew_dv)}
db eval {insert or replace into tcl_code values('::CHOCDFnew_rm',$::CHOCDFnew_rm)}
db eval {insert or replace into tcl_code values('::CHOCDFnew_vf',$::CHOCDFnew_vf)}
db eval {insert or replace into tcl_code values('::ENERC_KCALdv_change',$::ENERC_KCALdv_change)}
db eval {insert or replace into tcl_code values('::ENERC_KCALnew_dv',$::ENERC_KCALnew_dv)}
db eval {insert or replace into tcl_code values('::ENERC_KCALnew_rm',$::ENERC_KCALnew_rm)}
db eval {insert or replace into tcl_code values('::ENERC_KCALnew_vf',$::ENERC_KCALnew_vf)}
db eval {insert or replace into tcl_code values('::FIBTGdv_change',$::FIBTGdv_change)}
db eval {insert or replace into tcl_code values('::FIBTGnew_dv',$::FIBTGnew_dv)}
db eval {insert or replace into tcl_code values('::FIBTGnew_rm',$::FIBTGnew_rm)}
db eval {insert or replace into tcl_code values('::FIBTGnew_vf',$::FIBTGnew_vf)}
db eval {insert or replace into tcl_code values('::CAdv_change',$::CAdv_change)}
db eval {insert or replace into tcl_code values('::CAnew_dv',$::CAnew_dv)}
db eval {insert or replace into tcl_code values('::CAnew_rm',$::CAnew_rm)}
db eval {insert or replace into tcl_code values('::CAnew_vf',$::CAnew_vf)}
db eval {insert or replace into tcl_code values('::FEdv_change',$::FEdv_change)}
db eval {insert or replace into tcl_code values('::FEnew_dv',$::FEnew_dv)}
db eval {insert or replace into tcl_code values('::FEnew_rm',$::FEnew_rm)}
db eval {insert or replace into tcl_code values('::FEnew_vf',$::FEnew_vf)}
db eval {insert or replace into tcl_code values('::MGdv_change',$::MGdv_change)}
db eval {insert or replace into tcl_code values('::MGnew_dv',$::MGnew_dv)}
db eval {insert or replace into tcl_code values('::MGnew_rm',$::MGnew_rm)}
db eval {insert or replace into tcl_code values('::MGnew_vf',$::MGnew_vf)}
db eval {insert or replace into tcl_code values('::Pdv_change',$::Pdv_change)}
db eval {insert or replace into tcl_code values('::Pnew_dv',$::Pnew_dv)}
db eval {insert or replace into tcl_code values('::Pnew_rm',$::Pnew_rm)}
db eval {insert or replace into tcl_code values('::Pnew_vf',$::Pnew_vf)}
db eval {insert or replace into tcl_code values('::Kdv_change',$::Kdv_change)}
db eval {insert or replace into tcl_code values('::Knew_dv',$::Knew_dv)}
db eval {insert or replace into tcl_code values('::Knew_rm',$::Knew_rm)}
db eval {insert or replace into tcl_code values('::Knew_vf',$::Knew_vf)}
db eval {insert or replace into tcl_code values('::NAdv_change',$::NAdv_change)}
db eval {insert or replace into tcl_code values('::NAnew_dv',$::NAnew_dv)}
db eval {insert or replace into tcl_code values('::NAnew_rm',$::NAnew_rm)}
db eval {insert or replace into tcl_code values('::NAnew_vf',$::NAnew_vf)}
db eval {insert or replace into tcl_code values('::ZNdv_change',$::ZNdv_change)}
db eval {insert or replace into tcl_code values('::ZNnew_dv',$::ZNnew_dv)}
db eval {insert or replace into tcl_code values('::ZNnew_rm',$::ZNnew_rm)}
db eval {insert or replace into tcl_code values('::ZNnew_vf',$::ZNnew_vf)}
db eval {insert or replace into tcl_code values('::CUdv_change',$::CUdv_change)}
db eval {insert or replace into tcl_code values('::CUnew_dv',$::CUnew_dv)}
db eval {insert or replace into tcl_code values('::CUnew_rm',$::CUnew_rm)}
db eval {insert or replace into tcl_code values('::CUnew_vf',$::CUnew_vf)}
db eval {insert or replace into tcl_code values('::MNdv_change',$::MNdv_change)}
db eval {insert or replace into tcl_code values('::MNnew_dv',$::MNnew_dv)}
db eval {insert or replace into tcl_code values('::MNnew_rm',$::MNnew_rm)}
db eval {insert or replace into tcl_code values('::MNnew_vf',$::MNnew_vf)}
db eval {insert or replace into tcl_code values('::SEdv_change',$::SEdv_change)}
db eval {insert or replace into tcl_code values('::SEnew_dv',$::SEnew_dv)}
db eval {insert or replace into tcl_code values('::SEnew_rm',$::SEnew_rm)}
db eval {insert or replace into tcl_code values('::SEnew_vf',$::SEnew_vf)}
db eval {insert or replace into tcl_code values('::VITA_IUdv_change',$::VITA_IUdv_change)}
db eval {insert or replace into tcl_code values('::VITA_IUnew_dv',$::VITA_IUnew_dv)}
db eval {insert or replace into tcl_code values('::VITA_IUnew_rm',$::VITA_IUnew_rm)}
db eval {insert or replace into tcl_code values('::VITA_IUnew_vf',$::VITA_IUnew_vf)}
db eval {insert or replace into tcl_code values('::VITDdv_change',$::VITDdv_change)}
db eval {insert or replace into tcl_code values('::VITDnew_dv',$::VITDnew_dv)}
db eval {insert or replace into tcl_code values('::VITDnew_rm',$::VITDnew_rm)}
db eval {insert or replace into tcl_code values('::VITDnew_vf',$::VITDnew_vf)}
db eval {insert or replace into tcl_code values('::VITCdv_change',$::VITCdv_change)}
db eval {insert or replace into tcl_code values('::VITCnew_dv',$::VITCnew_dv)}
db eval {insert or replace into tcl_code values('::VITCnew_rm',$::VITCnew_rm)}
db eval {insert or replace into tcl_code values('::VITCnew_vf',$::VITCnew_vf)}
db eval {insert or replace into tcl_code values('::THIAdv_change',$::THIAdv_change)}
db eval {insert or replace into tcl_code values('::THIAnew_dv',$::THIAnew_dv)}
db eval {insert or replace into tcl_code values('::THIAnew_rm',$::THIAnew_rm)}
db eval {insert or replace into tcl_code values('::THIAnew_vf',$::THIAnew_vf)}
db eval {insert or replace into tcl_code values('::RIBFdv_change',$::RIBFdv_change)}
db eval {insert or replace into tcl_code values('::RIBFnew_dv',$::RIBFnew_dv)}
db eval {insert or replace into tcl_code values('::RIBFnew_rm',$::RIBFnew_rm)}
db eval {insert or replace into tcl_code values('::RIBFnew_vf',$::RIBFnew_vf)}
db eval {insert or replace into tcl_code values('::NIAdv_change',$::NIAdv_change)}
db eval {insert or replace into tcl_code values('::NIAnew_dv',$::NIAnew_dv)}
db eval {insert or replace into tcl_code values('::NIAnew_rm',$::NIAnew_rm)}
db eval {insert or replace into tcl_code values('::NIAnew_vf',$::NIAnew_vf)}
db eval {insert or replace into tcl_code values('::PANTACdv_change',$::PANTACdv_change)}
db eval {insert or replace into tcl_code values('::PANTACnew_dv',$::PANTACnew_dv)}
db eval {insert or replace into tcl_code values('::PANTACnew_rm',$::PANTACnew_rm)}
db eval {insert or replace into tcl_code values('::PANTACnew_vf',$::PANTACnew_vf)}
db eval {insert or replace into tcl_code values('::VITB6Adv_change',$::VITB6Adv_change)}
db eval {insert or replace into tcl_code values('::VITB6Anew_dv',$::VITB6Anew_dv)}
db eval {insert or replace into tcl_code values('::VITB6Anew_rm',$::VITB6Anew_rm)}
db eval {insert or replace into tcl_code values('::VITB6Anew_vf',$::VITB6Anew_vf)}
db eval {insert or replace into tcl_code values('::FOLdv_change',$::FOLdv_change)}
db eval {insert or replace into tcl_code values('::FOLnew_dv',$::FOLnew_dv)}
db eval {insert or replace into tcl_code values('::FOLnew_rm',$::FOLnew_rm)}
db eval {insert or replace into tcl_code values('::FOLnew_vf',$::FOLnew_vf)}
db eval {insert or replace into tcl_code values('::VITB12dv_change',$::VITB12dv_change)}
db eval {insert or replace into tcl_code values('::VITB12new_dv',$::VITB12new_dv)}
db eval {insert or replace into tcl_code values('::VITB12new_rm',$::VITB12new_rm)}
db eval {insert or replace into tcl_code values('::VITB12new_vf',$::VITB12new_vf)}
db eval {insert or replace into tcl_code values('::VITK1dv_change',$::VITK1dv_change)}
db eval {insert or replace into tcl_code values('::VITK1new_dv',$::VITK1new_dv)}
db eval {insert or replace into tcl_code values('::VITK1new_rm',$::VITK1new_rm)}
db eval {insert or replace into tcl_code values('::VITK1new_vf',$::VITK1new_vf)}
db eval {insert or replace into tcl_code values('::CHOLEdv_change',$::CHOLEdv_change)}
db eval {insert or replace into tcl_code values('::CHOLEnew_dv',$::CHOLEnew_dv)}
db eval {insert or replace into tcl_code values('::CHOLEnew_rm',$::CHOLEnew_rm)}
db eval {insert or replace into tcl_code values('::CHOLEnew_vf',$::CHOLEnew_vf)}
db eval {insert or replace into tcl_code values('::FASATdv_change',$::FASATdv_change)}
db eval {insert or replace into tcl_code values('::FASATnew_dv',$::FASATnew_dv)}
db eval {insert or replace into tcl_code values('::FASATnew_rm',$::FASATnew_rm)}
db eval {insert or replace into tcl_code values('::FASATnew_vf',$::FASATnew_vf)}
db eval {insert or replace into tcl_code values('::FAMSdv_change',$::FAMSdv_change)}
db eval {insert or replace into tcl_code values('::FAMSnew_dv',$::FAMSnew_dv)}
db eval {insert or replace into tcl_code values('::FAMSnew_rm',$::FAMSnew_rm)}
db eval {insert or replace into tcl_code values('::FAMSnew_vf',$::FAMSnew_vf)}
db eval {insert or replace into tcl_code values('::FAPUdv_change',$::FAPUdv_change)}
db eval {insert or replace into tcl_code values('::FAPUnew_dv',$::FAPUnew_dv)}
db eval {insert or replace into tcl_code values('::FAPUnew_rm',$::FAPUnew_rm)}
db eval {insert or replace into tcl_code values('::FAPUnew_vf',$::FAPUnew_vf)}
db eval {insert or replace into tcl_code values('::CHO_NONFIBdv_change',$::CHO_NONFIBdv_change)}
db eval {insert or replace into tcl_code values('::CHO_NONFIBnew_dv',$::CHO_NONFIBnew_dv)}
db eval {insert or replace into tcl_code values('::CHO_NONFIBnew_rm',$::CHO_NONFIBnew_rm)}
db eval {insert or replace into tcl_code values('::CHO_NONFIBnew_vf',$::CHO_NONFIBnew_vf)}
db eval {insert or replace into tcl_code values('::LAdv_change',$::LAdv_change)}
db eval {insert or replace into tcl_code values('::LAnew_dv',$::LAnew_dv)}
db eval {insert or replace into tcl_code values('::LAnew_rm',$::LAnew_rm)}
db eval {insert or replace into tcl_code values('::LAnew_vf',$::LAnew_vf)}
db eval {insert or replace into tcl_code values('::AAdv_change',$::AAdv_change)}
db eval {insert or replace into tcl_code values('::AAnew_dv',$::AAnew_dv)}
db eval {insert or replace into tcl_code values('::AAnew_rm',$::AAnew_rm)}
db eval {insert or replace into tcl_code values('::AAnew_vf',$::AAnew_vf)}
db eval {insert or replace into tcl_code values('::ALAdv_change',$::ALAdv_change)}
db eval {insert or replace into tcl_code values('::ALAnew_dv',$::ALAnew_dv)}
db eval {insert or replace into tcl_code values('::ALAnew_rm',$::ALAnew_rm)}
db eval {insert or replace into tcl_code values('::ALAnew_vf',$::ALAnew_vf)}
db eval {insert or replace into tcl_code values('::EPAdv_change',$::EPAdv_change)}
db eval {insert or replace into tcl_code values('::EPAnew_dv',$::EPAnew_dv)}
db eval {insert or replace into tcl_code values('::EPAnew_rm',$::EPAnew_rm)}
db eval {insert or replace into tcl_code values('::EPAnew_vf',$::EPAnew_vf)}
db eval {insert or replace into tcl_code values('::DHAdv_change',$::DHAdv_change)}
db eval {insert or replace into tcl_code values('::DHAnew_dv',$::DHAnew_dv)}
db eval {insert or replace into tcl_code values('::DHAnew_rm',$::DHAnew_rm)}
db eval {insert or replace into tcl_code values('::DHAnew_vf',$::DHAnew_vf)}
db eval {insert or replace into tcl_code values('::OMEGA6dv_change',$::OMEGA6dv_change)}
db eval {insert or replace into tcl_code values('::OMEGA6new_dv',$::OMEGA6new_dv)}
db eval {insert or replace into tcl_code values('::OMEGA6new_rm',$::OMEGA6new_rm)}
db eval {insert or replace into tcl_code values('::OMEGA6new_vf',$::OMEGA6new_vf)}
db eval {insert or replace into tcl_code values('::OMEGA3dv_change',$::OMEGA3dv_change)}
db eval {insert or replace into tcl_code values('::OMEGA3new_dv',$::OMEGA3new_dv)}
db eval {insert or replace into tcl_code values('::OMEGA3new_rm',$::OMEGA3new_rm)}
db eval {insert or replace into tcl_code values('::OMEGA3new_vf',$::OMEGA3new_vf)}
db eval {insert or replace into tcl_code values('::VITEdv_change',$::VITEdv_change)}
db eval {insert or replace into tcl_code values('::VITEnew_dv',$::VITEnew_dv)}
db eval {insert or replace into tcl_code values('::VITEnew_rm',$::VITEnew_rm)}
db eval {insert or replace into tcl_code values('::VITEnew_vf',$::VITEnew_vf)}
db eval {insert or replace into tcl_code values('::GLY_Gdv_change',$::GLY_Gdv_change)}
db eval {insert or replace into tcl_code values('::GLY_Gnew_dv',$::GLY_Gnew_dv)}
db eval {insert or replace into tcl_code values('::GLY_Gnew_rm',$::GLY_Gnew_rm)}
db eval {insert or replace into tcl_code values('::GLY_Gnew_vf',$::GLY_Gnew_vf)}
db eval {insert or replace into tcl_code values('::RETOLdv_change',$::RETOLdv_change)}
db eval {insert or replace into tcl_code values('::RETOLnew_dv',$::RETOLnew_dv)}
db eval {insert or replace into tcl_code values('::RETOLnew_rm',$::RETOLnew_rm)}
db eval {insert or replace into tcl_code values('::RETOLnew_vf',$::RETOLnew_vf)}
db eval {insert or replace into tcl_code values('load_nutr_def',$load_nutr_def)}
db eval {insert or replace into tcl_code values('load_fd_group',$load_fd_group)}
db eval {insert or replace into tcl_code values('load_food_des1',$load_food_des1)}
db eval {insert or replace into tcl_code values('load_food_des2',$load_food_des2)}
db eval {insert or replace into tcl_code values('load_weight',$load_weight)}
db eval {insert or replace into tcl_code values('load_nut_data1',$load_nut_data1)}
db eval {insert or replace into tcl_code values('load_nut_data2',$load_nut_data2)}
db eval {insert or replace into tcl_code values('load_legacy',$load_legacy)}
db eval {COMMIT}

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
