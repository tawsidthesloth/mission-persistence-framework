#define true 1
#define false 0

class MPF_Settings {
  player_track = false;//tracks the player rather than slot
  player_test=5;
  track_storage_by_class=true;
  track_storage_by_class_list[] = {""};

  track_storage_by_var=true;//ReammoBox_F,configfile >> "CfgVehicles" >> "Box_Ammo_F"
  track_storage_by_var_list[] = {""};

  track_storage_by_all=true;//nearSupplies
  //https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EMPTY
}
