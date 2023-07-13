*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZOT_33_BAKIM_TAB
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZOT_33_BAKIM_TAB   .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
