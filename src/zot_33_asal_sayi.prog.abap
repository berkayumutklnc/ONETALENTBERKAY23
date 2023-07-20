*&---------------------------------------------------------------------*
*& Report ZOT_33_ASAL_SAYI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_33_asal_sayi.

DATA lv_bool TYPE c.
DATA lv_temp TYPE i.

SELECTION-SCREEN  BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS p_sayi1 TYPE i OBLIGATORY.
  PARAMETERS p_sayi2 TYPE i OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

  IF p_sayi1 > p_sayi2.
    lv_temp  = p_sayi1.
    p_sayi1 = p_sayi2.
    p_sayi2 = lv_temp.
  ENDIF.

  DATA: lv_temp2 TYPE i.
  DATA: lv_value TYPE i.

  DO.
    DO p_sayi1 TIMES.
      lv_temp2 = p_sayi1 MOD sy-index.
      IF lv_temp2 EQ 0.
        lv_value = lv_value + 1.
      ENDIF.
    ENDDO.
    IF lv_value <> 2.
      lv_bool = ' '.
    ELSE.
      lv_bool = 'X'.
    ENDIF.

    IF lv_bool = 'X'.
      WRITE:/ 'Asal sayı - ',p_sayi1 NO-ZERO.
    ENDIF.
    IF p_sayi1 = p_sayi2.
      EXIT.
    ENDIF.
    p_sayi1 = p_sayi1 + 1.
  ENDDO.
