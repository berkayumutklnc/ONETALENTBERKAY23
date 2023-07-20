*&---------------------------------------------------------------------*
*& Include zot_33_satsas_raporu_top
*&---------------------------------------------------------------------*

TABLES: ekpo, eban.

TYPES: BEGIN OF gty_sat,
         banfn TYPE eban-banfn,
         bnfpo TYPE eban-bnfpo,
         bsart TYPE eban-bsart,
         matnr TYPE eban-matnr,
         menge TYPE eban-menge,
         meins TYPE eban-meins,
       END OF gty_sat,
       BEGIN OF gty_sas,
         ebeln TYPE ekpo-ebeln,
         ebelp TYPE ekpo-ebelp,
         matnr TYPE ekpo-matnr,
         ktmng TYPE ekpo-ktmng,
         meins TYPE ekpo-meins,
       END OF gty_sas.
DATA: gt_satfcat TYPE slis_t_fieldcat_alv,
      gt_sasfcat TYPE slis_t_fieldcat_alv,
      gs_layout  TYPE slis_layout_alv.
DATA: gt_sat TYPE TABLE OF gty_sat,
      gt_sas TYPE TABLE OF gty_sas.
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS : rb_sat RADIOBUTTON GROUP rbg1,
               rb_sas RADIOBUTTON GROUP rbg1.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  SELECT-OPTIONS: s_ebeln FOR ekpo-ebeln MODIF ID s1 NO-EXTENSION NO INTERVALS,
                  s_matkl FOR ekpo-matkl MODIF ID s1 NO-EXTENSION NO INTERVALS.
SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-003.
  SELECT-OPTIONS: s_banfn FOR eban-banfn MODIF ID s2 NO-EXTENSION NO INTERVALS ,
                  s_bsart FOR eban-bsart MODIF ID s2 NO-EXTENSION NO INTERVALS.
SELECTION-SCREEN END OF BLOCK b3.




*seçim ekranında iki blok olacak sat bazında ve sas bazında olucak

*sat - eban
*sas - ekpo
