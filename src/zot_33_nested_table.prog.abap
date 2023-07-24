*&---------------------------------------------------------------------*
*& Report ZOT_33_NESTED_TABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_33_nested_table.

TYPES: BEGIN OF gty_ogrenci,
         ogr_id     TYPE numc3,
         ogr_ad(10) TYPE c,
         dog_tar    TYPE datum,
         bolum(10)  TYPE c,
         notlar     TYPE numc3,
       END OF gty_ogrenci.
TYPES: gt_ogranci TYPE STANDARD TABLE OF gty_ogrenci WITH KEY ogr_id.

TYPES: BEGIN OF gty_sinif,
         ogr_id   TYPE numc3,
         sinif_id TYPE int2,
       END OF gty_sinif.
TYPES: gt_sinif TYPE STANDARD TABLE OF gty_sinif WITH KEY ogr_id sinif_id.

TYPES: BEGIN OF gty_ders,
         ogr_id   TYPE numc3,
         sinif_id TYPE int2,
         ders_id  TYPE int2,
       END OF gty_ders.
TYPES: gt_ders TYPE STANDARD TABLE OF gty_ders WITH KEY ogr_id sinif_id ders_id.

TYPES: BEGIN OF gty_not,
         ogr_id    TYPE numc3,
         sinif_id  TYPE int2,
         ders_id   TYPE int2,
         vize1_not TYPE int3,
         vize2_not TYPE int3,
         final_not TYPE int3,
         but_not   TYPE int3,
       END OF gty_not.
TYPES: gt_not TYPE STANDARD TABLE OF gty_not WITH KEY ogr_id sinif_id ders_id.

BREAK otbkilinc.
