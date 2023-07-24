*&---------------------------------------------------------------------*
*& Report ZOT_33_P_COMPARE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_33_p_compare.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME.
  PARAMETERS : p_val1 TYPE char6,
               p_val2 TYPE char6,
               p_val3 TYPE char6,
               p_val4 TYPE char6,
               p_val5 TYPE char6.
SELECTION-SCREEN END OF BLOCK b1.
*
*
*IF p_val1 CO p_val2.
*  IF p_val1 CO p_val3.
*    IF  p_val1 CO p_val4.
*      IF p_val1 CO p_val5.
*        CONCATENATE p_val1 p_val2 p_val3 p_val4 p_val5 INTO DATA(lv_val) SEPARATED BY space.
*        SKIP.
*        WRITE lv_val.
*        EXIT.
*      ELSE.
*        CONCATENATE p_val1 p_val2 p_val3 p_val4 INTO lv_val SEPARATED BY space.
*        SKIP.
*        WRITE lv_val.
*      ENDIF.
*    ELSE.
*      CONCATENATE p_val1 p_val2 p_val3 INTO lv_val SEPARATED BY space.
*      SKIP.
*      WRITE lv_val.
*    ENDIF.
*  ELSE.
*    CONCATENATE p_val1 p_val2 INTO lv_val SEPARATED BY space.
*    SKIP.
*    WRITE lv_val.
*  ENDIF.
*ELSE.
*  SKIP.
*  WRITE p_val1.
*ENDIF.
*
*
*IF p_val2 CO p_val3.
*  IF p_val2 CO p_val4.
*    IF  p_val2 CO p_val5.
*      CONCATENATE p_val2 p_val3 p_val4 p_val5 INTO DATA(lv_val1) SEPARATED BY space.
*      SKIP.
*      WRITE lv_val.
*      EXIT.
*    ELSE.
*      CONCATENATE p_val2 p_val3 p_val4 INTO lv_val1 SEPARATED BY space.
*      SKIP.
*      WRITE lv_val.
*    ENDIF.
*  ELSE.
*    CONCATENATE p_val2 p_val3 INTO lv_val1 SEPARATED BY space.
*    SKIP.
*    WRITE lv_val.
*  ENDIF.
*ELSE.
*  SKIP.
*  WRITE p_val2.
*ENDIF.
*
*IF p_val3 CO p_val4.
*  IF p_val3 CO p_val5.
*    CONCATENATE p_val3 p_val4 p_val5 INTO DATA(lv_val2) SEPARATED BY space.
*    SKIP.
*    WRITE lv_val.
*    EXIT.
*  ELSE.
*    CONCATENATE p_val3 p_val4 INTO lv_val2 SEPARATED BY space.
*    SKIP.
*    WRITE lv_val.
*  ENDIF.
*ELSE.
*  SKIP.
*  WRITE p_val3.
*ENDIF.
*
*IF p_val4 CO p_val5.
*  CONCATENATE p_val4 p_val5 INTO DATA(lv_val3) SEPARATED BY space.
*  SKIP.
*  WRITE lv_val.
*  EXIT.
*ELSE.
*  SKIP.
*  WRITE p_val4.
*  SKIP.
*  WRITE p_val5.
*ENDIF.
*
*DATA: gt_text TYPE TABLE OF string,
*      gv_val  TYPE string.
*
*APPEND: p_val1 TO gt_text,
*        p_val2 TO gt_text,
*        p_val3 TO gt_text,
*        p_val4 TO gt_text,
*        p_val5 TO gt_text.
*
*SORT gt_text.
*
*LOOP AT gt_text ASSIGNING FIELD-SYMBOL(<lfs_text>).
*  IF gv_val NE space AND gv_val NE <lfs_text>.
*    SKIP. ULINE.
*    WRITE gv_val.
*  ELSE.
*    CLEAR: gv_val.
*    CONCATENATE gv_val <lfs_text> INTO DATA(gv_write) SEPARATED BY space.
*    gv_val = <lfs_text>.
*  ENDIF.
*ENDLOOP.
*WRITE gv_write.
*
*TYPES: BEGIN OF gty_val,
*         val1 TYPE char6,
*         val2 TYPE char6,
*         val3 TYPE char6,
*         val4 TYPE char6,
*         val5 TYPE char6,
*       END OF gty_val.

*DATA: gt_val TYPE TABLE OF gty_val.

*gt_val = VALUE #(
*                  val1  = p_val1
*                  val2  = p_val2
*                  val3  = p_val3
*                  val4  = p_val4
*                  val5  = p_val5
*                 ).
*
*LOOP AT gt_val ASSIGNING FIELD-SYMBOL(<lfs_val>).
*
*ENDLOOP.

DATA: text1(6),
      text2(6),
      text3(6),
      text4(6),
      text5(6).

DATA: BEGIN OF itab1 OCCURS 0,
        letters(1),
      END OF itab1.
DATA: BEGIN OF itab2 OCCURS 0,
        letters(1),
      END OF itab2.
DATA: BEGIN OF itab3 OCCURS 0,
        letters(1),
      END OF itab3.
DATA: BEGIN OF itab4 OCCURS 0,
        letters(1),
      END OF itab4.
DATA: BEGIN OF itab5 OCCURS 0,
        letters(1),
      END OF itab5.

text1  =  p_val1  .
text2  =  p_val2  .
text3  =  p_val3  .
text4  =  p_val4  .
text5  =  p_val5  .

WHILE NOT text1 IS INITIAL.
  itab1 = text1+0(1).
  APPEND itab1.
  SHIFT text1 LEFT BY 1 PLACES.
ENDWHILE.
WHILE NOT text2 IS INITIAL.
  itab2 = text2+0(1).
  APPEND itab2.
  SHIFT text2 LEFT BY 1 PLACES.
ENDWHILE.
WHILE NOT text3 IS INITIAL.
  itab3 = text3+0(1).
  APPEND itab3.
  SHIFT text3 LEFT BY 1 PLACES.
ENDWHILE.
WHILE NOT text4 IS INITIAL.
  itab4 = text4+0(1).
  APPEND itab4.
  SHIFT text4 LEFT BY 1 PLACES.
ENDWHILE.
WHILE NOT text5 IS INITIAL.
  itab5 = text5+0(1).
  APPEND itab5.
  SHIFT text5 LEFT BY 1 PLACES.
ENDWHILE.

SORT itab1.
SORT itab2.
SORT itab3.
SORT itab4.
SORT itab5.
BREAK-POINT.
*
*LOOP AT itab1 ASSIGNING FIELD-SYMBOL(<lfs_itab1>).
*  READ TABLE itab2 ASSIGNING FIELD-SYMBOL(<lfs_itab2>) INDEX lv_num.
*  IF sy-subrc IS INITIAL.
*
*  ENDIF.
*  lv_num = lv_num + 1.
*ENDLOOP.

*DATA:
*
*zlv_offset type i,
*
*zlv_test type string value ' Hello World'.
*
*find FIRST OCCURRENCE OF 'H' in zlv_test match OFFSET zlv_offset.
*
*write zlv_offset.
