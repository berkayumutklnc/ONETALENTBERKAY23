*&---------------------------------------------------------------------*
*& Report ZOT_33_BELGE_YAZDIR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_33_belge_yazdir.

DATA : l_fmname     TYPE funcname,
       l_params     TYPE sfpoutputparams,
       l_docparams  TYPE sfpdocparams,
       l_formoutput TYPE fpformoutput.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_docno TYPE char10.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

  CALL FUNCTION 'FP_FUNCTION_MODULE_NAME'
    EXPORTING
      i_name     = 'ZOT_33_AF_FLIGHT'
    IMPORTING
      e_funcname = l_fmname.

  l_params-nodialog = 'X'.
  l_params-preview = 'X'.
  l_params-dest    = 'LP01'.


  CALL FUNCTION 'FP_JOB_OPEN'
    CHANGING
      ie_outputparams = l_params
    EXCEPTIONS
      cancel          = 1
      usage_error     = 2
      system_error    = 3
      internal_error  = 4
      OTHERS          = 5.

  l_docparams-langu = 'T'.

  CALL FUNCTION l_fmname
    EXPORTING
      /1bcdwb/docparams  = l_docparams
      iv_barcode         = p_docno
    IMPORTING
      /1bcdwb/formoutput = l_formoutput
    EXCEPTIONS
      usage_error        = 1
      system_error       = 2
      internal_error     = 3
      OTHERS             = 4.

  CALL FUNCTION 'FP_JOB_CLOSE'
    EXCEPTIONS
      usage_error    = 1
      system_error   = 2
      internal_error = 3
      OTHERS         = 4.
