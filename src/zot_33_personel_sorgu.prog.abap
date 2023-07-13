*&---------------------------------------------------------------------*
*& Report zot_33_personel_sorgu
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_33_personel_sorgu.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_persid    TYPE numc3.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: rb_mast RADIOBUTTON GROUP rb1,
              rb_iltm RADIOBUTTON GROUP rb1,
              rb_aile RADIOBUTTON GROUP rb1,
              rb_egtm RADIOBUTTON GROUP rb1.
SELECTION-SCREEN END OF BLOCK b2.

DATA: gt_fcat   TYPE slis_t_fieldcat_alv,
      gs_fcat   TYPE slis_fieldcat_alv,
      gs_layout TYPE slis_layout_alv.


START-OF-SELECTION.

  IF rb_mast EQ abap_true.
    PERFORM mast_alv.
  ELSEIF rb_iltm EQ abap_true.
    PERFORM iltsm_alv.
  ELSEIF rb_aile EQ abap_true.
    PERFORM aile_alv.
  ELSEIF rb_egtm EQ abap_true.
    PERFORM egtm_alv.
  ENDIF.

FORM mast_alv.

  SELECT * FROM zot_33_t_p_mast INTO TABLE @DATA(lt_mast)
  WHERE pers_id = @p_persid.


  PERFORM set_fcat USING 'PERS_ID'   'Pers No.'   'Pers No.' 'Pers No.' abap_true.
  PERFORM set_fcat USING 'PERS_AD'   'Pers Ad' '   Pers Ad'  'Pers Ad '  abap_false.
  PERFORM set_fcat USING 'PERS_SYAD' 'Pers SoyAd' 'Pers SoyAd' 'Pers SoyAd' abap_false.
  PERFORM set_fcat USING 'CINS'      'Pers Cıns' 'Pers Cıns' 'Pers Cıns' abap_false.
  PERFORM set_fcat USING 'DO_YERI'   'Dog. Yeri' 'Dog. Yeri' 'Dog. Yeri' abap_false.
  PERFORM set_fcat USING 'DO_TARIHI' 'Dog. Tarıh' 'Dog. Tarih' 'Dog. Tarih' abap_false.
  PERFORM set_fcat USING 'MED_HAL'   'Med. Hali' 'Med. Hali' 'Med. Hali' abap_false.
  PERFORM set_fcat USING 'COCUK_SAY' 'Cocuk Sayı' 'Cocuk Sayı' 'Cocuk Sayı' abap_false.
  PERFORM set_fcat USING 'UYRUK'      'Uyruk' 'Uyruk' 'uyruk' abap_false.



  gs_layout-zebra = abap_true.
  gs_layout-colwidth_optimize = abap_true.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      is_layout     = gs_layout
      it_fieldcat   = gt_fcat
    TABLES
      t_outtab      = lt_mast
    EXCEPTIONS
      program_error = 1
      OTHERS        = 2.


ENDFORM.

FORM iltsm_alv.


  SELECT * FROM zot_33_t_p_iltsm INTO TABLE @DATA(lt_iltsm)
   WHERE pers_id = @p_persid.

  CLEAR: gt_fcat, gs_layout.
  PERFORM set_fcat USING 'PERS_ID'   'Pers No.'   'Pers No.' 'Pers No.' abap_true.
  PERFORM set_fcat USING 'ILET_TUR'   'Ilet. Tur' 'Ilet. Tur'  'Ilet. Tur '  abap_false.
  PERFORM set_fcat USING 'ILET_TANIM' 'Ilet. Tanm' 'Ilet. Tanm' 'Ilet. Tanm' abap_false.

  gs_layout-zebra = abap_true.
  gs_layout-colwidth_optimize = abap_true.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      is_layout     = gs_layout
      it_fieldcat   = gt_fcat
    TABLES
      t_outtab      = lt_iltsm
    EXCEPTIONS
      program_error = 1
      OTHERS        = 2.

ENDFORM.

FORM aile_alv.

  SELECT * FROM zot_33_t_p_aile INTO TABLE @DATA(lt_aile)
   WHERE pers_id = @p_persid.

  CLEAR: gt_fcat, gs_layout.
  PERFORM set_fcat USING 'PERS_ID'   'Pers No.'   'Pers No.' 'Pers No.' abap_true.
  PERFORM set_fcat USING 'AILE_BIREY'   'Aile Birey' 'Aile Birey'  'Aile Birey '  abap_false.
  PERFORM set_fcat USING 'AILE_AD' 'Ad' 'Ad' 'Ad' abap_false.
  PERFORM set_fcat USING 'AILE_SOYAD' 'Soyad' 'Soyad' 'Soyad' abap_false.
  PERFORM set_fcat USING 'AILE_TEL'   'Tel. No' 'Tel. No' 'Tel. No' abap_false.
  PERFORM set_fcat USING 'AILE_SOK' 'Sokak' 'Sokak' 'Sokak' abap_false.
  PERFORM set_fcat USING 'AILE_IL'   'İl' 'İl' 'İl' abap_false.
  PERFORM set_fcat USING 'AILE_ULKE' 'Ulke' 'Ulke' 'Ulke' abap_false.

  gs_layout-zebra = abap_true.
  gs_layout-colwidth_optimize = abap_true.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      is_layout     = gs_layout
      it_fieldcat   = gt_fcat
    TABLES
      t_outtab      = lt_aile
    EXCEPTIONS
      program_error = 1
      OTHERS        = 2.
ENDFORM.

FORM egtm_alv.

  SELECT * FROM zot_33_t_p_egtm INTO TABLE @DATA(lt_egtm)
   WHERE pers_id = @p_persid.

  CLEAR: gt_fcat, gs_layout.
  PERFORM set_fcat USING 'PERS_ID'   'Pers No.'   'Pers No.' 'Pers No.' abap_true.
  PERFORM set_fcat USING 'EGTM_KOD'   'Egtm Tur' 'Egtm Tur'  'Egtm Tur'  abap_false.
  PERFORM set_fcat USING 'OKUL_AD' 'Okul Adı' 'Okul Adı' 'Okul Adı' abap_false.
  PERFORM set_fcat USING 'ULKE'      'Ulke' 'Ulke' 'Ulke' abap_false.
    gs_layout-zebra = abap_true.
  gs_layout-colwidth_optimize = abap_true.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      is_layout     = gs_layout
      it_fieldcat   = gt_fcat
    TABLES
      t_outtab      = lt_egtm
    EXCEPTIONS
      program_error = 1
      OTHERS        = 2.
ENDFORM.

FORM set_fcat USING p_fieldname
                    p_seltext_l
                    p_seltext_m
                    p_seltext_s
                    p_key.

  gs_fcat-fieldname = p_fieldname.
  gs_fcat-seltext_l = p_seltext_l.
  gs_fcat-seltext_m = p_seltext_m.
  gs_fcat-seltext_s = p_seltext_s.
  gs_fcat-key = p_key.
  APPEND gs_fcat TO gt_fcat.
  CLEAR: gs_fcat.
ENDFORM.
