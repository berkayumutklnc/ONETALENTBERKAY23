*&---------------------------------------------------------------------*
*& Report ZOT_33_FIBONACHI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_33_fibonachi.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_num1 TYPE int4 OBLIGATORY,
              p_num2 TYPE int1 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.
  DATA: lv_sayi1  TYPE i VALUE 0,
        lv_sayi2  TYPE i VALUE 1,
        lv_toplam TYPE i,
        lv_sayac  TYPE i VALUE 0.
  WHILE lv_toplam Lt p_num1.
    lv_toplam = lv_sayi1 + lv_sayi2.
    lv_sayi1 = lv_sayi2.
    lv_sayi2 = lv_toplam.
    lv_sayac = lv_sayac + 1.
    IF lv_sayac MOD p_num2 EQ 0.
      NEW-LINE.
      WRITE lv_toplam.
      CLEAR :lv_sayac.
    ELSE.
      WRITE lv_toplam.
    ENDIF.
  ENDWHILE.
