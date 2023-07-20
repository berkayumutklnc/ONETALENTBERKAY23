*&---------------------------------------------------------------------*
*& Report ZOT_33_KURA_SECIM
*&---------------------------------------------------------------------*
*&* kura seçimi 4 torba her torbada 4 takım olarak
* 4 veri alınacak 4 torbaya dağıtılacak.
* 1. torba - liverpol - bayern -inter -psg
* 2. torba -man cty - psv - porto -real
* 3.torba - dordmund - gs - marsilya -ajax
* 4. torba -aek - roma - bükres - a.madrid
*&---------------------------------------------------------------------*
REPORT zot_33_kura_secim.

TYPES: BEGIN OF ty_torba,
         takımid      TYPE i,
         takım_ad(20) TYPE c,
       END OF ty_torba,
       BEGIN OF ty_nmbr,
         randomid TYPE i,
       END OF ty_nmbr.

DATA: gt_torba1    TYPE TABLE OF ty_torba,
      gt_torba2    TYPE TABLE OF ty_torba,
      gt_torba3    TYPE TABLE OF ty_torba,
      gt_torba4    TYPE TABLE OF ty_torba,
      gt_nmbr      TYPE TABLE OF ty_nmbr,
      gt_torba_all TYPE TABLE OF ty_torba.

DATA: lv_nmbr TYPE i.

START-OF-SELECTION.
  PERFORM get_data.
  PERFORM random_nmbr.
  PERFORM takımlar.
  PERFORM display.



FORM get_data.
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
FORM random_nmbr.
  DO 4 TIMES.
    CALL FUNCTION 'QF05_RANDOM_INTEGER'
      EXPORTING
        ran_int_max   = 4
        ran_int_min   = 1
      IMPORTING
        ran_int       = lv_nmbr
      EXCEPTIONS
        invalid_input = 1
        OTHERS        = 2.
    APPEND VALUE #( randomid = lv_nmbr
                 ) TO gt_nmbr.
    CLEAR : lv_nmbr.
  ENDDO.
ENDFORM.

FORM takımlar.
  READ TABLE gt_nmbr ASSIGNING FIELD-SYMBOL(<lfs_nmbr>) INDEX 1.
  IF sy-subrc IS INITIAL.
    READ TABLE gt_torba1 ASSIGNING FIELD-SYMBOL(<lfs_torba1>) WITH KEY takimid = <lfs_nmbr>-randomid.
    IF sy-subrc IS INITIAL.
      APPEND VALUE #( takımid = <lfs_torba1>-takimid
                     takım_ad = <lfs_torba1>-takim_ad
                     ) TO gt_torba_all.
    ENDIF.
  ENDIF.

  READ TABLE gt_nmbr ASSIGNING <lfs_nmbr> INDEX 2.
  IF sy-subrc IS INITIAL.
    READ TABLE gt_torba2 ASSIGNING FIELD-SYMBOL(<lfs_torba2>) WITH KEY takimid = <lfs_nmbr>-randomid.
    IF sy-subrc IS INITIAL.
      APPEND VALUE #( takımid = <lfs_torba2>-takimid
                     takım_ad = <lfs_torba2>-takim_ad
                     ) TO gt_torba_all.
    ENDIF.
  ENDIF.

  READ TABLE gt_nmbr ASSIGNING <lfs_nmbr> INDEX 3.
  IF sy-subrc IS INITIAL.
    READ TABLE gt_torba3 ASSIGNING FIELD-SYMBOL(<lfs_torba3>) WITH KEY takimid = <lfs_nmbr>-randomid.
    IF sy-subrc IS INITIAL.
      APPEND VALUE #( takımid = <lfs_torba3>-takimid
                     takım_ad = <lfs_torba3>-takim_ad
                     ) TO gt_torba_all.
    ENDIF.
  ENDIF.

  READ TABLE gt_nmbr ASSIGNING <lfs_nmbr> INDEX 4.
  IF sy-subrc IS INITIAL.
    READ TABLE gt_torba4 ASSIGNING FIELD-SYMBOL(<lfs_torba4>) WITH KEY takimid = <lfs_nmbr>-randomid.
    IF sy-subrc IS INITIAL.
      APPEND VALUE #( takımid = <lfs_torba4>-takimid
                     takım_ad = <lfs_torba4>-takim_ad
                     ) TO gt_torba_all.
    ENDIF.
  ENDIF.
ENDFORM.

FORM display.
  cl_demo_output=>display( gt_torba_all ).
ENDFORM.
