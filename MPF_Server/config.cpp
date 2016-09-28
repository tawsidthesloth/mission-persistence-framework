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
		class Save
		{
			file = "MPF_Server\Functions\core\Save";
			class handleDisconnect {};
            class initStats {};
            class statSave {};
            class statSaveLoop {};
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
