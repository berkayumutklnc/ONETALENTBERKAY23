*&---------------------------------------------------------------------*
*& Report zot_33_satsas_raporu
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_33_satsas_raporu.

INCLUDE zot_33_satsas_raporu_top.
INCLUDE zot_33_satsas_raporu_frm.

AT SELECTION-SCREEN OUTPUT.
  PERFORM close_block.

START-OF-SELECTION.
  PERFORM get_data.
