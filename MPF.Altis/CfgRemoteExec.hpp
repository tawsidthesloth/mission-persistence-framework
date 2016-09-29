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

        /* Server functions */
        Function(MPFS_fnc_initPlayer,MPFS)
        Function(MPFS_fnc_initSlot,MPFS)

        /* Anyone functions */
        Function(MPFC_fnc_playSound,ANYONE)
    };

    class Commands {
        mode = 1;
        jip = 0;

        Function(setFuel,ANYONE)
    };
};
