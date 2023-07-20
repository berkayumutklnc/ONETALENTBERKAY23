*&---------------------------------------------------------------------*
*& Report ZOT_33_KURA_SECIM_V2
*&---------------------------------------------------------------------*
*& dump :(
*&---------------------------------------------------------------------*
REPORT zot_33_kura_secim_v2.

TYPES: BEGIN OF gty_torba,
         takimid  TYPE i,
         takim_ad TYPE char20,
       END OF gty_torba.

DATA: gt_torba1    TYPE TABLE OF gty_torba,
      gt_torba2    TYPE TABLE OF gty_torba,
      gt_torba3    TYPE TABLE OF gty_torba,
      gt_torba4    TYPE TABLE OF gty_torba,
      gt_sectorba1 TYPE TABLE OF gty_torba,
      gs_sectorba1 TYPE gty_torba,
      gt_sectorba2 TYPE TABLE OF gty_torba,
      gs_sectorba2 TYPE  gty_torba,
      gt_sectorba3 TYPE TABLE OF gty_torba,
      gs_sectorba3 TYPE gty_torba,
      gt_sectorba4 TYPE TABLE OF gty_torba,
      gs_sectorba4 TYPE gty_torba.
DATA: lv_nmbr TYPE i.

START-OF-SELECTION.
  PERFORM torba_doldur.
  PERFORM torba1.
  PERFORM torba2.
  PERFORM torba3.
  PERFORM torba4.

  cl_demo_output=>display( gt_sectorba1 ).
  cl_demo_output=>display( gt_sectorba2 ).
  cl_demo_output=>display( gt_sectorba3 ).
  cl_demo_output=>display( gt_sectorba4 ).

FORM torba_doldur.
  gt_torba1 = VALUE #( ( takımid = 1
                takım_ad = 'LIVERPOOL' )
                ( takımid = 2
                takım_ad = 'BAYERN MUNIH' )
                ( takımid = 3
                takım_ad = 'INTER' )
                ( takımid = 4
                takım_ad = 'PARIS SAINT GERMAIN' )
                ).

  gt_torba2 =  VALUE #( ( takımid = 1
                  takım_ad = 'MAN. CITY' )
                  ( takımid = 2
                  takım_ad = 'PSV' )
                  ( takımid = 3
                  takım_ad = 'PORTO' )
                  ( takımid = 4
                  takım_ad = 'REAL MADRID' )
                   ).

  gt_torba3 =  VALUE #( ( takımid = 1
                  takım_ad = 'DORDMUND' )
                  ( takımid = 2
                  takım_ad = 'GS' )
                  ( takımid = 3
                  takım_ad = 'MASRILYA' )
                  ( takımid = 4
                  takım_ad = 'AJAX' )
                  ).

  gt_torba4 =  VALUE #( ( takımid = 1
                  takım_ad = 'AEK' )
                  ( takımid = 2
                  takım_ad = 'ROMA' )
                  ( takımid = 3
                  takım_ad = 'FCSB' )
                  ( takımid = 4
                  takım_ad = 'A. MADRID' )
                  ).
ENDFORM.
FORM torba1.
  DESCRIBE TABLE gt_torba1 LINES DATA(lv_nbr1).
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr1
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.

  READ TABLE gt_torba1 ASSIGNING FIELD-SYMBOL(<lfs_torba1>) INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba1 = VALUE #( takimid  = <lfs_torba1>-takimid
*                          takim_ad =   <lfs_torba1>-takim_ad
*                          ).
    gs_sectorba1-takimid = <lfs_torba1>-takimid.
    gs_sectorba1-takim_ad = <lfs_torba1>-takim_ad.
    APPEND gs_sectorba1 TO gt_sectorba1.

    DELETE gt_torba1 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr1.

  DESCRIBE TABLE gt_torba1 LINES lv_nbr1.
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr1
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.
  READ TABLE gt_torba1 ASSIGNING <lfs_torba1> INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba2 = VALUE #( takimid = <lfs_torba1>-takimid
*                            takim_ad = <lfs_torba1>-takim_ad
*                            ).
    gs_sectorba2-takimid = <lfs_torba1>-takimid.
    gs_sectorba2-takim_ad = <lfs_torba1>-takim_ad.
    APPEND gs_sectorba2 TO gt_sectorba2.
    DELETE gt_torba1 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr1.

  DESCRIBE TABLE gt_torba1 LINES lv_nbr1.
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr1
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.
  READ TABLE gt_torba1 ASSIGNING <lfs_torba1> INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba3 = VALUE #( takimid = <lfs_torba1>-takimid
*                            takim_ad = <lfs_torba1>-takim_ad
*                            ).
    gs_sectorba3-takimid = <lfs_torba1>-takimid.
    gs_sectorba3-takim_ad = <lfs_torba1>-takim_ad.
    APPEND gs_sectorba3 TO gt_sectorba3.
    DELETE gt_torba1 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr1.

  DESCRIBE TABLE gt_torba1 LINES lv_nbr1.
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr1
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.
  READ TABLE gt_torba1 ASSIGNING <lfs_torba1> INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba4 = VALUE #( takimid = <lfs_torba1>-takimid
*                            takim_ad = <lfs_torba1>-takim_ad
*                            ).
    gs_sectorba4-takimid = <lfs_torba1>-takimid.
    gs_sectorba4-takim_ad = <lfs_torba1>-takim_ad.
    APPEND gs_sectorba4 TO gt_sectorba4.
    DELETE gt_torba1 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr1.
ENDFORM.

FORM torba2.
  DESCRIBE TABLE gt_torba2 LINES DATA(lv_nbr2).
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr2
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.

  READ TABLE gt_torba2 ASSIGNING FIELD-SYMBOL(<lfs_torba2>) INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba1 = VALUE #( takimid = <lfs_torba2>-takimid
*                            takim_ad = <lfs_torba2>-takim_ad
*                            ).
    gs_sectorba1-takimid = <lfs_torba2>-takimid.
    gs_sectorba1-takim_ad = <lfs_torba2>-takim_ad.
    APPEND gs_sectorba1 TO gt_sectorba1.
    DELETE gt_torba2 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr2.

  DESCRIBE TABLE gt_torba2 LINES lv_nbr2.
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr2
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.
  READ TABLE gt_torba2 ASSIGNING <lfs_torba2> INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba2 = VALUE #( takimid = <lfs_torba2>-takimid
*                            takim_ad = <lfs_torba2>-takim_ad
*                            ).
    gs_sectorba2-takimid = <lfs_torba2>-takimid.
    gs_sectorba2-takim_ad = <lfs_torba2>-takim_ad.
    APPEND gs_sectorba2 TO gt_sectorba2.
    DELETE gt_torba2 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr2.

  DESCRIBE TABLE gt_torba2 LINES lv_nbr2.
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr2
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.
  READ TABLE gt_torba2 ASSIGNING <lfs_torba2> INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba3 = VALUE #( takimid = <lfs_torba2>-takimid
*                            takim_ad = <lfs_torba2>-takim_ad
*                            ).
    gs_sectorba3-takimid = <lfs_torba2>-takimid.
    gs_sectorba3-takim_ad = <lfs_torba2>-takim_ad.
    APPEND gs_sectorba3 TO gt_sectorba3.
    DELETE gt_torba2 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr2.

  DESCRIBE TABLE gt_torba2 LINES lv_nbr2.
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr2
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.
  READ TABLE gt_torba2 ASSIGNING <lfs_torba2> INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba4 = VALUE #( takimid = <lfs_torba2>-takimid
*                            takim_ad = <lfs_torba2>-takim_ad
*                            ).
    gs_sectorba4-takimid = <lfs_torba2>-takimid.
    gs_sectorba4-takim_ad = <lfs_torba2>-takim_ad.
    APPEND gs_sectorba4 TO gt_sectorba4.
    DELETE gt_torba2 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr2.
ENDFORM.

FORM torba3.
  DESCRIBE TABLE gt_torba3 LINES DATA(lv_nbr3).
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr3
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.

  READ TABLE gt_torba3 ASSIGNING FIELD-SYMBOL(<lfs_torba3>) INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba1 = VALUE #( takimid = <lfs_torba3>-takimid
*                            takim_ad = <lfs_torba3>-takim_ad
*                            ).
    gs_sectorba1-takimid = <lfs_torba3>-takimid.
    gs_sectorba1-takim_ad = <lfs_torba3>-takim_ad.
    APPEND gs_sectorba1 TO gt_sectorba1.
    DELETE gt_torba3 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr3.

  DESCRIBE TABLE gt_torba3 LINES lv_nbr3.
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr3
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.
  READ TABLE gt_torba3 ASSIGNING <lfs_torba3> INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba2 = VALUE #( takimid = <lfs_torba3>-takimid
*                            takim_ad = <lfs_torba3>-takim_ad
*                            ).
    gs_sectorba2-takimid = <lfs_torba3>-takimid.
    gs_sectorba2-takim_ad = <lfs_torba3>-takim_ad.
    APPEND gs_sectorba2 TO gt_sectorba2.
    DELETE gt_torba3 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr3.

  DESCRIBE TABLE gt_torba3 LINES lv_nbr3.
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr3
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.
  READ TABLE gt_torba3 ASSIGNING <lfs_torba3> INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba3 = VALUE #( takimid = <lfs_torba3>-takimid
*                            takim_ad = <lfs_torba3>-takim_ad
*                            ).
    gs_sectorba3-takimid = <lfs_torba3>-takimid.
    gs_sectorba3-takim_ad = <lfs_torba3>-takim_ad.
    APPEND gs_sectorba3 TO gt_sectorba3.
    DELETE gt_torba1 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr3.

  DESCRIBE TABLE gt_torba3 LINES lv_nbr3.
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr3
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.
  READ TABLE gt_torba3 ASSIGNING <lfs_torba3> INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba4 = VALUE #( takimid = <lfs_torba3>-takimid
*                            takim_ad = <lfs_torba3>-takim_ad
*                            ).
    gs_sectorba4-takimid = <lfs_torba3>-takimid.
    gs_sectorba4-takim_ad = <lfs_torba3>-takim_ad.
    APPEND gs_sectorba4 TO gt_sectorba4.
    DELETE gt_torba3 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr3.
ENDFORM.
FORM torba4.
  DESCRIBE TABLE gt_torba4 LINES DATA(lv_nbr4).
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr4
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.

  READ TABLE gt_torba4 ASSIGNING FIELD-SYMBOL(<lfs_torba4>) INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba1 = VALUE #( takimid = <lfs_torba4>-takimid
*                            takim_ad = <lfs_torba4>-takim_ad
*                            ).
    gs_sectorba1-takimid = <lfs_torba4>-takimid.
    gs_sectorba1-takim_ad = <lfs_torba4>-takim_ad.
    APPEND gs_sectorba1 TO gt_sectorba1.
    DELETE gt_torba4 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr4.

  DESCRIBE TABLE gt_torba4 LINES lv_nbr4.
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr4
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.
  READ TABLE gt_torba4 ASSIGNING <lfs_torba4> INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba2 = VALUE #( takimid = <lfs_torba4>-takimid
*                            takim_ad = <lfs_torba4>-takim_ad
*                            ).
    gs_sectorba2-takimid = <lfs_torba4>-takimid.
    gs_sectorba2-takim_ad = <lfs_torba4>-takim_ad.
    APPEND gs_sectorba2 TO gt_sectorba2.
    DELETE gt_torba4 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr4.

  DESCRIBE TABLE gt_torba4 LINES lv_nbr4.
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr4
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.
  READ TABLE gt_torba4 ASSIGNING <lfs_torba4> INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba3 = VALUE #( takimid = <lfs_torba4>-takimid
*                            takim_ad = <lfs_torba4>-takim_ad
*                            ).
    gs_sectorba3-takimid = <lfs_torba4>-takimid.
    gs_sectorba3-takim_ad = <lfs_torba4>-takim_ad.
    APPEND gs_sectorba3 TO gt_sectorba3.
    DELETE gt_torba4 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr4.

  DESCRIBE TABLE gt_torba4 LINES lv_nbr4.
  CALL FUNCTION 'QF05_RANDOM_INTEGER'
    EXPORTING
      ran_int_max   = lv_nbr4
      ran_int_min   = 1
    IMPORTING
      ran_int       = lv_nmbr
    EXCEPTIONS
      invalid_input = 1
      OTHERS        = 2.
  READ TABLE gt_torba4 ASSIGNING <lfs_torba4> INDEX lv_nmbr.
  IF sy-subrc IS INITIAL.
*    gt_sectorba4 = VALUE #( takimid = <lfs_torba4>-takimid
*                            takim_ad = <lfs_torba4>-takim_ad
*                            ).
    gs_sectorba4-takimid = <lfs_torba4>-takimid.
    gs_sectorba4-takim_ad = <lfs_torba4>-takim_ad.
    APPEND gs_sectorba4 TO gt_sectorba4.
    DELETE gt_torba4 INDEX lv_nmbr.
  ENDIF.
  CLEAR: lv_nbr4.
ENDFORM.












































*TYPES: BEGIN OF ty_torba,
*         takımid      TYPE i,
*         takım_ad(20) TYPE c,
*       END OF ty_torba,
*       BEGIN OF ty_nmbr,
*         randomid TYPE i,
*       END OF ty_nmbr.
*
*DATA: gt_torba1    TYPE TABLE OF ty_torba,
*      gt_torba2    TYPE TABLE OF ty_torba,
*      gt_torba3    TYPE TABLE OF ty_torba,
*      gt_torba4    TYPE TABLE OF ty_torba,
*      gt_sectorba1 TYPE TABLE OF ty_torba,
*      gt_sectorba2 TYPE TABLE OF ty_torba,
*      gt_sectorba3 TYPE TABLE OF ty_torba,
*      gt_sectorba4 TYPE TABLE OF ty_torba,
*      gt_nmbr      TYPE TABLE OF ty_nmbr,
*      gt_torba_all TYPE TABLE OF ty_torba.
*
*DATA: lv_nmbr TYPE i.
*
*
*START-OF-SELECTION.
*  PERFORM get_data.
*  PERFORM random.
*
*
*
*
*FORM get_data.
*  gt_torba1 = VALUE #( ( takımid = 1
*                  takım_ad = 'LIVERPOOL' )
*                  ( takımid = 2
*                  takım_ad = 'BAYERN MUNIH' )
*                  ( takımid = 3
*                  takım_ad = 'INTER' )
*                  ( takımid = 4
*                  takım_ad = 'PARIS SAINT GERMAIN' )
*                  ).
*
*  gt_torba2 =  VALUE #( ( takımid = 1
*                  takım_ad = 'MAN. CITY' )
*                  ( takımid = 2
*                  takım_ad = 'PSV' )
*                  ( takımid = 3
*                  takım_ad = 'PORTO' )
*                  ( takımid = 4
*                  takım_ad = 'REAL MADRID' )
*                   ).
*
*  gt_torba3 =  VALUE #( ( takımid = 1
*                  takım_ad = 'DORDMUND' )
*                  ( takımid = 2
*                  takım_ad = 'GS' )
*                  ( takımid = 3
*                  takım_ad = 'MASRILYA' )
*                  ( takımid = 4
*                  takım_ad = 'AJAX' )
*                  ).
*
*  gt_torba4 =  VALUE #( ( takımid = 1
*                  takım_ad = 'AEK' )
*                  ( takımid = 2
*                  takım_ad = 'ROMA' )
*                  ( takımid = 3
*                  takım_ad = 'FCSB' )
*                  ( takımid = 4
*                  takım_ad = 'A. MADRID' )
*                  ).
*ENDFORM.
*
*FORM random USING p_nmbr_max
*                  p_number_low.
*  CALL FUNCTION 'QF05_RANDOM_INTEGER'
*    EXPORTING
*      ran_int_max   = p_nmbr_max
*      ran_int_min   = p_number_low
*    IMPORTING
*      ran_int       = lv_nmbr
*    EXCEPTIONS
*      invalid_input = 1
*      OTHERS        = 2.
*  APPEND VALUE #( randomid = lv_nmbr
*               ) TO gt_nmbr.
*  CLEAR : lv_nmbr.
*ENDFORM.
*
*FORM kura_secim.
*  CALL FUNCTION 'QF05_RANDOM_INTEGER'
*    EXPORTING
*      ran_int_max   = p_nmbr_max
*      ran_int_min   = p_number_low
*    IMPORTING
*      ran_int       = lv_nmbr
*    EXCEPTIONS
*      invalid_input = 1
*      OTHERS        = 2.
*
*  READ TABLE gt_nmbr ASSIGNING FIELD-SYMBOL(<lfs_rndm>) INDEX 1.
*  IF sy-subrc IS INITIAL.
*    READ TABLE gt_torba1 ASSIGNING FIELD-SYMBOL(<lfs_torba1>) WITH KEY takimid = <lfs_rndm>-randomid.
*    IF sy-subrc IS INITIAL .
*      gt_sectorba1 = VALUE #( takim_ad = <lfs_torba1>-takim_ad
*                              takimid = <lfs_torba1>-takimid ).
*      DELETE gt_torba1 INDEX <lfs_rndm>-randomid.
*    ENDIF.
*  ENDIF.
*  PERFORM random USING '4' '1'.
*  READ TABLE gt_nmbr ASSIGNING <lfs_rndm> INDEX 1.
*  IF sy-subrc IS INITIAL.
*    READ TABLE gt_torba2 ASSIGNING FIELD-SYMBOL(<lfs_torba2>) WITH KEY takimid = <lfs_rndm>-randomid.
*    IF sy-subrc IS INITIAL .
*      gt_sectorba1 = VALUE #( takim_ad = <lfs_torba1>-takim_ad
*                              takimid = <lfs_torba1>-takimid ).
*      DELETE gt_torba1 INDEX <lfs_rndm>-randomid.
*    ENDIF.
*  ENDIF.
*
*
*ENDFORM.
