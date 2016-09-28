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
	class Server
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
	class ExternalS
	{
		class ExtDB
		{
			file = "MPF_Server\External\ExtDB";
			class ExtDBasync {};
            class ExtDBinit {};
			class ExtDBstrip {};
			class ExtDBquery {};
		};
	};
	class ServerModules
	{
		class Config
		{
			file = "MPF_Server\Functions\modules\CONFIG";
			class initModules {};
		};
		#include "Functions\modules\CONFIG\moduleFunctions.hpp"
	};
};
