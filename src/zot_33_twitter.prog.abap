*&---------------------------------------------------------------------*
*& Report ZOT_33_TWITTER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_33_twitter.

TABLES: zot_33_t_tweet.
DATA : lt_twitter TYPE TABLE OF  zot_33_t_tweet.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_twid  TYPE zot_33_t_tweet-tweet_id MATCHCODE OBJECT zot_33_sh_tweetid,
              p_tweet TYPE char100.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: rb_twat  RADIOBUTTON GROUP rb1,
              rb_twdeg RADIOBUTTON GROUP rb1,
              rb_twsil RADIOBUTTON GROUP rb1,
              rb_twgos RADIOBUTTON GROUP rb1.
SELECTION-SCREEN END OF BLOCK b2.

START-OF-SELECTION.

  IF rb_twat EQ abap_true.
    SELECT tweet_id FROM zot_33_t_tweet INTO TABLE @DATA(lt_tweetid)
      WHERE tweet_id = @p_twid.
    IF sy-subrc IS NOT INITIAL .
      APPEND VALUE #( tweet_id = p_twid
                      tweet    = p_tweet
                     ) TO lt_twitter.

      MODIFY zot_33_t_tweet FROM TABLE lt_twitter.
      MESSAGE 'Tweet Atıldı!' TYPE 'I'.

    ELSE.
      MESSAGE 'Tweet Numarası Dolu' TYPE 'I'.
      EXIT.
    ENDIF.


  ELSEIF rb_twdeg EQ abap_true.
    IF  lt_tweetid IS INITIAL .
      MESSAGE 'Boyle Bir Tweet Numarası Bulunmamaktadır.' TYPE 'I'.
      EXIT.
    ELSE.
      UPDATE zot_33_t_tweet SET tweet = p_tweet
      WHERE tweet_id = p_twid.
      COMMIT WORK AND WAIT.

      MESSAGE 'Tweet Degistirildi!' TYPE 'I'.
    ENDIF.

  ELSEIF rb_twsil EQ abap_true.
    IF  lt_tweetid IS INITIAL .
      MESSAGE 'Boyle Bir Tweet Numarası Bulunmamaktadır.' TYPE 'I'.
      EXIT.
    ELSE.
      DELETE FROM zot_33_t_tweet WHERE tweet_id = p_twid.
      MESSAGE 'Tweet Silindi!' TYPE 'I'.
    ENDIF.

  ELSEIF rb_twgos EQ abap_true.
    IF  p_twid IS INITIAL .
      SELECT tweet_id,
               tweet
         FROM zot_33_t_tweet
          INTO TABLE @DATA(lt_tweet).
    ELSE.
      SELECT tweet_id
             tweet
       FROM zot_33_t_tweet
        INTO TABLE lt_tweet
        WHERE tweet_id = p_twid.
    ENDIF.
    cl_demo_output=>display( lt_tweet ).
  ENDIF.

*FORM f4.
*  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
*    EXPORTING
**     DDIC_STRUCTURE         = ' '
*      retfield  =
**     PVALKEY   = ' '
**     DYNPPROG  = ' '
**     DYNPNR    = ' '
**     DYNPROFIELD            = ' '
**     STEPL     = 0
**     WINDOW_TITLE           =
**     VALUE     = ' '
**     VALUE_ORG = 'C'
**     MULTIPLE_CHOICE        = ' '
**     DISPLAY   = ' '
**     CALLBACK_PROGRAM       = ' '
**     CALLBACK_FORM          = ' '
**     CALLBACK_METHOD        =
**     MARK_TAB  =
** IMPORTING
**     USER_RESET             =
*    tables
*      value_tab =
**     FIELD_TAB =
**     RETURN_TAB             =
**     DYNPFLD_MAPPING        =
** EXCEPTIONS
**     PARAMETER_ERROR        = 1
**     NO_VALUES_FOUND        = 2
**     OTHERS    = 3
*    .
*  IF sy-subrc <> 0.
** Implement suitable error handling here
*  ENDIF.
*
*
*ENDFORM.
