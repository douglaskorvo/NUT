set Main_alt {

set DiskDB [file nativename $DiskDB]

db eval {select max(version) as "::version" from version} { }

db eval {select code from tcl_code where name = 'get_procs_from_db'} {
 $EVAL $code
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

scale .nut.rm.scale -background "#FF9428" -width [expr {$::magnify * 11}] -sliderlength [expr {$::magnify * 20}] -showvalue 1 -orient horizontal -variable ::mealoffset -from -100 -to 100 -command mealchange
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
Button .nut.rm.analysismeal -text "Switch To Analysis" -background "#FF9428" -command SwitchToAnalysis -relief raised
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
 proc place_nbw_buttons {relx nuts} {
  upvar rely rely x x screen screen background background
  foreach nut $nuts {
   button .nut.${x}.nbw.screen${screen}.b${nut} -textvariable ::${nut}b -command "NewStory $nut $x" -background "#FFFF00"
   if {$x == "ar"} {
    ttk::entry .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -justify right
   } else {
    label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor e
   }
   label .nut.${x}.nbw.screen${screen}.lu${nut} -textvariable ::${nut}u -background $background($x) -anchor w
   place .nut.${x}.nbw.screen${screen}.b${nut}  -relx $relx                  -rely $rely -relheight 0.06 -relwidth 0.165
   place .nut.${x}.nbw.screen${screen}.l${nut}  -relx [expr {$relx + 0.175}] -rely $rely -relheight 0.06 -relwidth 0.1
   place .nut.${x}.nbw.screen${screen}.lu${nut} -relx [expr {$relx + 0.275}] -rely $rely -relheight 0.06 -relwidth 0.055
   set rely [expr {$rely + 0.06625}]
  }
 }
 set rely 0.205
 place_nbw_buttons 0.005 {FAT FASAT FAMS FAPU OMEGA6 LA AA OMEGA3 ALA EPA DHA CHOLE}
 set rely 0.00625
 place_nbw_buttons 0.335 {CHOCDF FIBTG}
 set rely 0.205
 place_nbw_buttons 0.335 {VITA_IU THIA RIBF NIA PANTAC VITB6A FOL VITB12 VITC VITD VITE VITK1}
 set rely 0.00625
 place_nbw_buttons 0.665 {PROCNT}
 place_nbw_buttons 0.665 {CHO_NONFIB}
 set rely [expr {$rely + 0.06625}]
 place_nbw_buttons 0.665 {CA CU FE MG MN P K SE NA ZN}
 set rely [expr {$rely + 0.06625}]
 foreach nut {FAPU1} {
  button .nut.${x}.nbw.screen${screen}.b${nut} -text "Omega-6/3 Balance" -command "NewStory FAPU $x" -background "#FFFF00"
  label .nut.${x}.nbw.screen${screen}.l${nut} -textvariable ::${nut}${x} -background $background($x) -anchor center
  place .nut.${x}.nbw.screen${screen}.b${nut} -relx 0.665 -rely $rely -relheight 0.06 -relwidth 0.165
  place .nut.${x}.nbw.screen${screen}.l${nut} -relx 0.84 -rely $rely -relheight 0.06 -relwidth 0.165
  }

 set screen 2
 set rely 0.13875
 place_nbw_buttons 0.005 {CHOCDF FIBTG STARCH SUGAR FRUS GALS GLUS LACS MALS SUCS}
 set rely 0.13875
 place_nbw_buttons 0.335 {PROCNT ADPROT ALA_G ARG_G ASP_G CYS_G GLU_G GLY_G HISTN_G HYP ILE_G}
 set rely 0.13875
 place_nbw_buttons 0.665 {LEU_G LYS_G MET_G PHE_G PRO_G SER_G THR_G TRP_G TYR_G VAL_G}

 set screen 3
 set rely 0.0725
 place_nbw_buttons 0.005 {ENERC_KJ ASH WATER CAFFN THEBRN ALC FLD BETN CHOLN FOLAC FOLFD FOLDFE RETOL}
 set rely 0.0725
 place_nbw_buttons 0.335 {VITA_RAE ERGCAL CHOCAL VITD_BOTH VITB12_ADDED VITE_ADDED VITK1D MK4 TOCPHA TOCPHB TOCPHG TOCPHD TOCTRA}
 set rely 0.0725
 place_nbw_buttons 0.665 {TOCTRB TOCTRG TOCTRD CARTA CARTB CRYPX LUT_ZEA LYCPN CHOLE PHYSTR SITSTR CAMD5 STID7}
 set screen 4
 set rely 0.00625
 place_nbw_buttons 0.17 {FASAT F4D0 F6D0 F8D0 F10D0 F12D0 F13D0 F14D0 F15D0 F16D0 F17D0 F18D0 F20D0 F22D0 F24D0}
 set rely 0.0725
 place_nbw_buttons 0.5 {FAMS F14D1 F15D1 F16D1 F16D1C F17D1 F18D1 F18D1C F20D1 F22D1 F22D1C F24D1C}
 set screen 5
 set rely 0.205
 place_nbw_buttons 0.005 {FAPU F18D2 F18D2CN6 F18D3 F18D3CN3 F18D3CN6 F18D4 F20D2CN6}
 set rely 0.13875
 place_nbw_buttons 0.335 {F20D3 F20D3N3 F20D3N6 F20D4 F20D4N6 F20D5 F21D5 F22D4 F22D5 F22D6}
 set rely 0.0725
 place_nbw_buttons 0.665 {FATRN FATRNM F16D1T F18D1T F18D1TN7 F22D1T FATRNP F18D2I F18D2T F18D2TT F18D2CLA F18D3I}
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
  $EVAL $code
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
  $EVAL $code
  }
 }

#end Main_alt
}
