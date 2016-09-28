#define Function(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};

#define ANYONE 0
#define MPFC 1
#define MPFS 2

class CfgRemoteExec {
    class Functions {
        mode = 1;
        jip = 0;

        /* Client functions */
        Function(MPFC_fnc_loadInventory,MPFC)
        Function(MPFC_fnc_hintMP,MPFC)
        Function(MPFC_fnc_addBank,MPFC)
        Function(MPFC_fnc_addCash,MPFC)
        Function(MPFC_fnc_cuffTarget,MPFC)
        Function(MPFC_fnc_putInCarTarget,MPFC)
        Function(MPFC_fnc_unCuffTarget,MPFC)

        /* Server functions */
        Function(MPFS_fnc_initStats,MPFS)

        /* Anyone functions */
        Function(MPFC_fnc_playSound,ANYONE)
    };

    class Commands {
        mode = 1;
        jip = 0;

        Function(setFuel,ANYONE)
    };
};
