*&---------------------------------------------------------------------*
*& Report ZOT_33_SIRALI_DIZILIM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_33_sirali_dizilim.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_num1 TYPE int3 OBLIGATORY,
              p_num2 TYPE int1 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.
DATA: lv_sayi  TYPE i VALUE 1,
      lv_sayac TYPE i VALUE 0.

START-OF-SELECTION.
  WHILE lv_sayi LT p_num1.
    lv_sayi = lv_sayi + 1.
    IF lv_sayac MOD p_num2 EQ 0.
      NEW-LINE.
      WRITE lv_sayi.
      CLEAR lv_sayac.
    ELSE.
      WRITE lv_sayi.
    ENDIF.
    lv_sayac = lv_sayac + 1.
  ENDWHILE.
