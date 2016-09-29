class CfgPatches
{
	class MPF_Server
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {};
	};
};

class CfgFunctions
{
	class MPFS
	{
		class Player
		{
			file = "MPF_Server\Functions\Core\Player";
					class handleDisconnectPlayer {};
      		class initPlayer {};
      		class savePlayer {};
      		class saveLoopPlayer {};
		};

		class Slot
		{
			file = "MPF_Server\Functions\Core\Slot";
					class handleDisconnectSlot {};
      		class initSlot {};
      		class saveSlot {};
      		class saveLoopSlot {};
					class removeDup {};
		};

		class Storage
		{
			file = "MPF_Server\Functions\Core\Storage";
      		class initStorage {};
					class saveStorage {};
					class saveLoopStorage {};
		};

	};
	class DB
	{
		class ExtDB
		{
			file = "MPF_Server\DB\ExtDB";
			class ExtDBasync {};
      class ExtDBinit {};
			class ExtDBstrip {};
			class ExtDBquery {};
		};
	};
};
