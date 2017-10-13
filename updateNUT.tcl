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
set SKIP_DIALOG 0
foreach arg $argv {
    if {$arg eq "--skip-dialog"} { set SKIP_DIALOG 1 }
}

package require sqlite3

sqlite3 db nut.sqlite

db eval {create table if not exists tcl_code(name text primary key, code text)}
db eval {create table if not exists version(version text primary key unique, update_cd text)}
###
source src/source.tcl
###
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
###

package require Tk

wm geometry . 1x1

set defaultAppSize      0.0
set defaultLinuxAppSize 0.7
# appSize is a factor to create fonts and windows that match screen resolution.
# 0.0 works well on Windows and the Mac, but on Linux,
# appSizes between 0.7 and 1.3 go between small to almost fullscreen
# and look the same at all screen resolutions when you don't have a
# resolution-independent window manager.

# set appSize 1.0

set OS [lindex $tcl_platform(os) 0]
if {[info exists appSize]} {
    # Already set. Do nothing
} elseif { $OS == {Linux} } {
    set appSize $defaultLinuxAppSize
} else {
    set appSize $defaultAppSize
}

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
if {$SKIP_DIALOG != 1} {
    tk_messageBox -type ok -title "updateNUT.tcl Completion" -message "There\'s a signpost up ahead.\n\nNext stop:  ${::version}"
}\
else {
    puts "Update complete"
}
exit 0
