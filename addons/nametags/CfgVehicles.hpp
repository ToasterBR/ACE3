class CfgVehicles {
    class ACE_Module;
    class ACE_ModuleNameTags: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(moduleNameTags);
        scope = 1;
    };
};
