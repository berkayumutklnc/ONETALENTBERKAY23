*&---------------------------------------------------------------------*
*& Report zot_33_hesap_makinesi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_33_hesap_makinesi.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_num1 TYPE p DECIMALS 3,
              p_num2 TYPE p DECIMALS 3.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  PARAMETERS : rb_top  RADIOBUTTON GROUP rb1,
               rb_cik  RADIOBUTTON GROUP rb1,
               rb_bol  RADIOBUTTON GROUP rb1,
               rb_carp RADIOBUTTON GROUP rb1.
SELECTION-SCREEN END OF BLOCK b2.

DATA: lv_result TYPE p DECIMALS 3.

START-OF-SELECTION.

  IF rb_top EQ abap_true.
    lv_result = p_num1 + p_num2.
    cl_demo_output=>write( |{ p_num1 } + { p_num2 } = { lv_result }| ).
  ELSEIF rb_cik EQ abap_true.
    lv_result = p_num1 - p_num2.
    cl_demo_output=>write( |{ p_num1 } - { p_num2 } = { lv_result }| ).
  ELSEIF rb_bol EQ abap_true.
    IF p_num2 EQ 0 .
      MESSAGE 'Sıfıra Bölunme Hatası' TYPE 'I'.
      LEAVE PROGRAM.
    ELSE.
      lv_result = p_num1 / p_num2.
      cl_demo_output=>write( |{ p_num1 } / { p_num2 } = { lv_result }| ).
    ENDIF.
  ELSEIF rb_carp EQ abap_true.
    lv_result = p_num1 * p_num2.
    cl_demo_output=>write( |{ p_num1 } * { p_num2 } = { lv_result }| ).
  ENDIF.

  cl_demo_output=>display( ).
