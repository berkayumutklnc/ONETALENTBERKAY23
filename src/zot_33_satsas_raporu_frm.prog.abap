*&---------------------------------------------------------------------*
*& Form close_block
*&---------------------------------------------------------------------*
FORM close_block .
  LOOP AT SCREEN.
    IF rb_sat EQ abap_true.
      CASE screen-group1.
        WHEN 'S1'.
          screen-invisible = 1.
          screen-input = 0.
          screen-output = 0.
          MODIFY SCREEN.
        WHEN 'S2'.
          screen-invisible = 0.
          screen-input = 1.
          screen-output = 1.
          MODIFY SCREEN.
        WHEN OTHERS.
      ENDCASE.
    ELSEIF rb_sas EQ abap_true.
      CASE screen-group1.
        WHEN 'S2'.
          screen-invisible = 1.
          screen-input = 0.
          screen-output = 0.
          MODIFY SCREEN.
        WHEN 'S1'.
          screen-invisible = 0.
          screen-input = 1.
          screen-output = 1.
          MODIFY SCREEN.
        WHEN OTHERS.
      ENDCASE.
    ENDIF.
  ENDLOOP.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form get_data
*&---------------------------------------------------------------------*
FORM get_data .
  IF rb_sat EQ abap_true.
    SELECT banfn
           bnfpo
           bsart
           matnr
           menge
           meins
      FROM eban INTO TABLE gt_sat
      WHERE  banfn IN s_banfn
       AND   bsart IN s_bsart.
    PERFORM sat_fcat.
    PERFORM display_data_sat.
  ELSE.
    SELECT ebeln
           ebelp
           matnr
           ktmng
           meins
       FROM ekpo INTO TABLE gt_sas
      WHERE ebeln IN  s_ebeln
        AND matkl IN  s_matkl.
    PERFORM sas_fcat.
    PERFORM display_data_sas.
  ENDIF.


ENDFORM.

FORM sat_fcat.
  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
    EXPORTING
      i_program_name         = sy-repid
      i_structure_name       = 'ZOT_33_S_SAT'
    CHANGING
      ct_fieldcat            = gt_satfcat
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.

  gs_layout-zebra = abap_true.
  gs_layout-colwidth_optimize = abap_true.

ENDFORM.

FORM sas_fcat.
  CALL FUNCTION 'REUSE_ALV_FIELDCATALOG_MERGE'
    EXPORTING
      i_program_name         = sy-repid
      i_structure_name       = 'ZOT_33_S_SAS'
    CHANGING
      ct_fieldcat            = gt_sasfcat
    EXCEPTIONS
      inconsistent_interface = 1
      program_error          = 2
      OTHERS                 = 3.

  gs_layout-zebra = abap_true.
  gs_layout-colwidth_optimize = abap_true.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form display_data
*&---------------------------------------------------------------------*
FORM display_data_sat .
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_top_of_page = ' '
      is_layout              = gs_layout
      it_fieldcat            = gt_satfcat
    TABLES
      t_outtab               = gt_sat
    EXCEPTIONS
      program_error          = 1
      OTHERS                 = 2.
ENDFORM.

FORM display_data_sas.
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_top_of_page = ' '
      is_layout              = gs_layout
      it_fieldcat            = gt_sasfcat
    TABLES
      t_outtab               = gt_sas
    EXCEPTIONS
      program_error          = 1
      OTHERS                 = 2.
ENDFORM.
