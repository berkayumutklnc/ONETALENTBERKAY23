*&---------------------------------------------------------------------*
*& Report ZOT_33_P_NESTED
*&---------------------------------------------------------------------*
*&
*&ZOT_33_S_NOT
*&    ZOT_33_S_DERS
*&    ZOT_33_S_SINIF
*&    ZOT_33_S_OGR_NOT
*&    ZOT_33_TT_OGR_NOT
*&---------------------------------------------------------------------*
REPORT zot_33_p_nested.

DATA: gt_nested TYPE zot_33_tt_ogr_not,
      gs_nested TYPE zot_33_s_ogr_not.

gs_nested-ogr_ad = 'Berkay Umut'.
gs_nested-ogr_id = 101.
gs_nested-bolum = 'Bil Müh'.
gs_nested-dog_tar = sy-datum.
gs_nested-not-sinif1-ders1-vize1 = 30.
gs_nested-not-sinif1-ders1-vize2 = 40.
gs_nested-not-sinif1-ders1-final = 50.
gs_nested-not-sinif1-ders1-but = 100.

gs_nested-not-sinif1-ders2-vize1 = 30.
gs_nested-not-sinif1-ders2-vize2 = 40.
gs_nested-not-sinif1-ders2-final = 50.
gs_nested-not-sinif1-ders2-but = 100.

gs_nested-not-sinif1-ders3-vize1 = 30.
gs_nested-not-sinif1-ders3-vize2 = 40.
gs_nested-not-sinif1-ders3-final = 50.
gs_nested-not-sinif1-ders3-but = 100.

gs_nested-not-sinif1-ders4-vize1 = 30.
gs_nested-not-sinif1-ders4-vize2 = 40.
gs_nested-not-sinif1-ders4-final = 50.
gs_nested-not-sinif1-ders4-but = 100.

gs_nested-not-sinif2-ders1-vize1 = 30.
gs_nested-not-sinif2-ders1-vize2 = 40.
gs_nested-not-sinif2-ders1-final = 50.
gs_nested-not-sinif2-ders1-but = 100.

gs_nested-not-sinif2-ders2-vize1 = 30.
gs_nested-not-sinif2-ders2-vize2 = 40.
gs_nested-not-sinif2-ders2-final = 50.
gs_nested-not-sinif2-ders2-but = 100.

gs_nested-not-sinif2-ders3-vize1 = 30.
gs_nested-not-sinif2-ders3-vize2 = 40.
gs_nested-not-sinif2-ders3-final = 50.
gs_nested-not-sinif2-ders3-but = 100.

gs_nested-not-sinif2-ders4-vize1 = 30.
gs_nested-not-sinif2-ders4-vize2 = 40.
gs_nested-not-sinif2-ders4-final = 50.
gs_nested-not-sinif2-ders4-but = 100.

gs_nested-not-sinif2-ders1-vize1 = 30.
gs_nested-not-sinif2-ders1-vize2 = 40.
gs_nested-not-sinif2-ders1-final = 50.
gs_nested-not-sinif2-ders1-but = 100.

gs_nested-not-sinif3-ders2-vize1 = 30.
gs_nested-not-sinif3-ders2-vize2 = 40.
gs_nested-not-sinif3-ders2-final = 50.
gs_nested-not-sinif3-ders2-but = 100.

gs_nested-not-sinif3-ders3-vize1 = 30.
gs_nested-not-sinif3-ders3-vize2 = 40.
gs_nested-not-sinif3-ders3-final = 50.
gs_nested-not-sinif3-ders3-but = 100.

gs_nested-not-sinif3-ders4-vize1 = 30.
gs_nested-not-sinif3-ders4-vize2 = 40.
gs_nested-not-sinif3-ders4-final = 50.
gs_nested-not-sinif3-ders4-but = 100.

gs_nested-not-sinif4-ders1-vize1 = 30.
gs_nested-not-sinif4-ders1-vize2 = 40.
gs_nested-not-sinif4-ders1-final = 50.
gs_nested-not-sinif4-ders1-but = 100.

gs_nested-not-sinif4-ders2-vize1 = 30.
gs_nested-not-sinif4-ders2-vize2 = 40.
gs_nested-not-sinif4-ders2-final = 50.
gs_nested-not-sinif4-ders2-but = 100.

gs_nested-not-sinif4-ders3-vize1 = 30.
gs_nested-not-sinif4-ders3-vize2 = 40.
gs_nested-not-sinif4-ders3-final = 50.
gs_nested-not-sinif4-ders3-but = 100.

gs_nested-not-sinif4-ders4-vize1 = 30.
gs_nested-not-sinif4-ders4-vize2 = 40.
gs_nested-not-sinif4-ders4-final = 50.
gs_nested-not-sinif4-ders4-but = 100.

APPEND gs_nested TO gt_nested.
BREAK otbkilinc.
