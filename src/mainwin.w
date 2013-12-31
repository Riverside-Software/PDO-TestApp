&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12 GUI
&ANALYZE-RESUME
&Scoped-define WINDOW-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS C-Win 
/*------------------------------------------------------------------------

  File: 

  Description: 

  Input Parameters:
      <none>

  Output Parameters:
      <none>

  Author: 

  Created: 

------------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.      */
/*----------------------------------------------------------------------*/

/* Create an unnamed pool to store all the widgets created 
     by this procedure. This is a good default which assures
     that this procedure's triggers and internal procedures 
     will execute in this procedure's storage, and that proper
     cleanup will occur on deletion of the procedure. */

CREATE WIDGET-POOL.

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */

/* Local Variable Definitions ---                                       */

&GLOBAL-DEFINE  MAX_PATH  64000
&GLOBAL-DEFINE  MAX_DRIVE 3
&GLOBAL-DEFINE  MAX_FNAME 256
&GLOBAL-DEFINE  MAX_EXT   256


PROCEDURE _wsplitpath EXTERNAL "msvcrt.dll" CDECL.
    DEFINE INPUT PARAMETER path  AS CHARACTER.
    DEFINE INPUT PARAMETER drive AS LONG.
    DEFINE INPUT PARAMETER DIR   AS LONG.
    DEFINE INPUT PARAMETER fName AS LONG.
    DEFINE INPUT PARAMETER ext   AS LONG.
END PROCEDURE.

PROCEDURE _splitpath EXTERNAL "msvcrt.dll" CDECL.
    DEFINE INPUT PARAMETER path  AS CHARACTER.
    DEFINE INPUT PARAMETER drive AS LONG.
    DEFINE INPUT PARAMETER DIR   AS LONG.
    DEFINE INPUT PARAMETER fName AS LONG.
    DEFINE INPUT PARAMETER ext   AS LONG.
END PROCEDURE.

PROCEDURE WideCharToMultiByte EXTERNAL "kernel32.dll".
    DEFINE INPUT  PARAMETER cp    AS LONG.       /* UNIT CodePage */
    DEFINE INPUT  PARAMETER flags AS LONG.       /* DWORD dwFlags */
    DEFINE INPUT  PARAMETER wide  AS LONG.       /* LPWSTR lpWideCharStr */
    DEFINE INPUT  PARAMETER nb    AS LONG.       /* int cchWideChar */
    DEFINE INPUT  PARAMETER multi AS MEMPTR.     /* LPSTR lpMultiByteStr */
    DEFINE INPUT  PARAMETER sz    AS LONG.       /* int cbMultiByte */
    DEFINE INPUT  PARAMETER defCh AS LONG.       /* LPCSTR lpDefaultChar */
    DEFINE INPUT  PARAMETER used  AS LONG.       /* LPBOOL lpUsedDefaultChar */
    DEFINE RETURN PARAMETER ret   AS LONG.       /* int */
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Window
&Scoped-define DB-AWARE no

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME DEFAULT-FRAME

/* Standard List Definitions                                            */
&Scoped-Define ENABLED-OBJECTS EDITOR-1 FILL-IN-1 FILL-IN-2 FILL-IN-3 ~
FILL-IN-4 FILL-IN-5 FILL-IN-6 FILL-IN-7 FILL-IN-8 BUTTON-1 BUTTON-2 ~
BUTTON-3 FILL-IN-9 BUTTON-4 
&Scoped-Define DISPLAYED-OBJECTS EDITOR-1 FILL-IN-1 FILL-IN-2 FILL-IN-3 ~
FILL-IN-4 FILL-IN-5 FILL-IN-6 FILL-IN-7 FILL-IN-8 FILL-IN-9 FILL-IN-10 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME


/* ************************  Function Prototypes ********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD bottomDir C-Win 
FUNCTION bottomDir RETURNS CHARACTER
    (src AS CHARACTER) FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD parentDir C-Win 
FUNCTION parentDir RETURNS CHARACTER
    (src AS CHARACTER) FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD wc2char C-Win 
FUNCTION wc2char RETURNS CHARACTER
    (src AS MEMPTR) FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD wco2char C-Win 
FUNCTION wco2char RETURNS CHARACTER
    (src AS MEMPTR, offset AS INTEGER) FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* ***********************  Control Definitions  ********************** */

/* Define the widget handle for the window                              */
DEFINE VAR C-Win AS WIDGET-HANDLE NO-UNDO.

/* Definitions of handles for OCX Containers                            */
DEFINE VARIABLE CtrlFrame AS WIDGET-HANDLE NO-UNDO.
DEFINE VARIABLE chCtrlFrame AS COMPONENT-HANDLE NO-UNDO.

/* Definitions of the field level widgets                               */
DEFINE BUTTON BUTTON-1 
     LABEL "Window with OCX" 
     SIZE 21 BY 1.14.

DEFINE BUTTON BUTTON-2 
     LABEL "PSTimer Message" 
     SIZE 21 BY 1.14.

DEFINE BUTTON BUTTON-3 
     LABEL ".Net Window" 
     SIZE 21 BY 1.14.

DEFINE BUTTON BUTTON-4 
     LABEL "Go!" 
     SIZE 9 BY 1.14.

DEFINE VARIABLE EDITOR-1 AS CHARACTER 
     VIEW-AS EDITOR NO-WORD-WRAP SCROLLBAR-HORIZONTAL SCROLLBAR-VERTICAL
     SIZE 60 BY 9.76 NO-UNDO.

DEFINE VARIABLE FILL-IN-1 AS CHARACTER FORMAT "X(256)":U 
     LABEL "SESSION:PARAMETER" 
     VIEW-AS FILL-IN 
     SIZE 44 BY 1 NO-UNDO.

DEFINE VARIABLE FILL-IN-10 AS CHARACTER FORMAT "X(256)":U 
     LABEL "Numéro version sur serveur" 
     VIEW-AS FILL-IN 
     SIZE 14 BY 1 NO-UNDO.

DEFINE VARIABLE FILL-IN-2 AS CHARACTER FORMAT "X(256)":U 
     LABEL "DLC" 
     VIEW-AS FILL-IN 
     SIZE 44 BY 1 NO-UNDO.

DEFINE VARIABLE FILL-IN-3 AS CHARACTER FORMAT "X(256)":U 
     LABEL "PROVERSION" 
     VIEW-AS FILL-IN 
     SIZE 44 BY 1 NO-UNDO.

DEFINE VARIABLE FILL-IN-4 AS CHARACTER FORMAT "X(256)":U 
     LABEL "Work dir" 
     VIEW-AS FILL-IN 
     SIZE 44 BY 1 NO-UNDO.

DEFINE VARIABLE FILL-IN-5 AS CHARACTER FORMAT "X(256)":U 
     LABEL "Vendor / Application" 
     VIEW-AS FILL-IN 
     SIZE 44 BY 1 NO-UNDO.

DEFINE VARIABLE FILL-IN-6 AS CHARACTER FORMAT "X(256)":U 
     LABEL "Version HKCU" 
     VIEW-AS FILL-IN 
     SIZE 44 BY 1 NO-UNDO.

DEFINE VARIABLE FILL-IN-7 AS CHARACTER FORMAT "X(256)":U 
     LABEL "Version HKLM" 
     VIEW-AS FILL-IN 
     SIZE 44 BY 1 NO-UNDO.

DEFINE VARIABLE FILL-IN-8 AS CHARACTER FORMAT "X(256)":U 
     LABEL "Version HKLM 64bits" 
     VIEW-AS FILL-IN 
     SIZE 44 BY 1 NO-UNDO.

DEFINE VARIABLE FILL-IN-9 AS CHARACTER FORMAT "X(256)":U INITIAL "http://pdo.rssw.eu:8080/" 
     LABEL "Vérification JSON" 
     VIEW-AS FILL-IN 
     SIZE 39 BY 1 NO-UNDO.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME DEFAULT-FRAME
     EDITOR-1 AT ROW 2.43 COL 11 NO-LABEL WIDGET-ID 2
     FILL-IN-1 AT ROW 12.91 COL 25 COLON-ALIGNED WIDGET-ID 6
     FILL-IN-2 AT ROW 14.1 COL 25 COLON-ALIGNED WIDGET-ID 12
     FILL-IN-3 AT ROW 15.29 COL 25 COLON-ALIGNED WIDGET-ID 14
     FILL-IN-4 AT ROW 16.48 COL 25 COLON-ALIGNED WIDGET-ID 16
     FILL-IN-5 AT ROW 17.67 COL 25 COLON-ALIGNED WIDGET-ID 18
     FILL-IN-6 AT ROW 18.86 COL 25 COLON-ALIGNED WIDGET-ID 20
     FILL-IN-7 AT ROW 20.05 COL 25 COLON-ALIGNED WIDGET-ID 22
     FILL-IN-8 AT ROW 21.24 COL 25 COLON-ALIGNED WIDGET-ID 24
     BUTTON-1 AT ROW 23.14 COL 5 WIDGET-ID 26
     BUTTON-2 AT ROW 23.14 COL 27 WIDGET-ID 30
     BUTTON-3 AT ROW 23.14 COL 49 WIDGET-ID 32
     FILL-IN-9 AT ROW 25.29 COL 19 COLON-ALIGNED WIDGET-ID 34
     BUTTON-4 AT ROW 25.29 COL 62 WIDGET-ID 36
     FILL-IN-10 AT ROW 26.95 COL 38 COLON-ALIGNED WIDGET-ID 38
     "Content of sample.txt" VIEW-AS TEXT
          SIZE 25 BY .62 AT ROW 1.48 COL 24 WIDGET-ID 4
          FONT 6
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1
         SIZE 73 BY 27.71 WIDGET-ID 100.


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Window
   Allow: Basic,Browse,DB-Fields,Window,Query
   Other Settings: COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
IF SESSION:DISPLAY-TYPE = "GUI":U THEN
  CREATE WINDOW C-Win ASSIGN
         HIDDEN             = YES
         TITLE              = "Test application"
         HEIGHT             = 27.71
         WIDTH              = 73
         MAX-HEIGHT         = 27.71
         MAX-WIDTH          = 80
         VIRTUAL-HEIGHT     = 27.71
         VIRTUAL-WIDTH      = 80
         RESIZE             = yes
         SCROLL-BARS        = no
         STATUS-AREA        = no
         BGCOLOR            = ?
         FGCOLOR            = ?
         KEEP-FRAME-Z-ORDER = yes
         THREE-D            = yes
         MESSAGE-AREA       = no
         SENSITIVE          = yes.
ELSE {&WINDOW-NAME} = CURRENT-WINDOW.
/* END WINDOW DEFINITION                                                */
&ANALYZE-RESUME



/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR WINDOW C-Win
  VISIBLE,,RUN-PERSISTENT                                               */
/* SETTINGS FOR FRAME DEFAULT-FRAME
   FRAME-NAME                                                           */
/* SETTINGS FOR FILL-IN FILL-IN-10 IN FRAME DEFAULT-FRAME
   NO-ENABLE                                                            */
IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(C-Win)
THEN C-Win:HIDDEN = no.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME

 


/* **********************  Create OCX Containers  ********************** */

&ANALYZE-SUSPEND _CREATE-DYNAMIC

&IF "{&OPSYS}" = "WIN32":U AND "{&WINDOW-SYSTEM}" NE "TTY":U &THEN

CREATE CONTROL-FRAME CtrlFrame ASSIGN
       FRAME           = FRAME DEFAULT-FRAME:HANDLE
       ROW             = 21.95
       COLUMN          = 3
       HEIGHT          = 1.76
       WIDTH           = 7
       WIDGET-ID       = 28
       HIDDEN          = yes
       SENSITIVE       = yes.
/* CtrlFrame OCXINFO:CREATE-CONTROL from: {F0B88A90-F5DA-11CF-B545-0020AF6ED35A} type: PSTimer */
      CtrlFrame:MOVE-AFTER(FILL-IN-8:HANDLE IN FRAME DEFAULT-FRAME).

&ENDIF

&ANALYZE-RESUME /* End of _CREATE-DYNAMIC */


/* ************************  Control Triggers  ************************ */

&Scoped-define SELF-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
ON END-ERROR OF C-Win /* Test application */
OR ENDKEY OF {&WINDOW-NAME} ANYWHERE DO:
  /* This case occurs when the user presses the "Esc" key.
     In a persistently run window, just ignore this.  If we did not, the
     application would exit. */
  IF THIS-PROCEDURE:PERSISTENT THEN RETURN NO-APPLY.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
ON WINDOW-CLOSE OF C-Win /* Test application */
DO:
  /* This event will close the window and terminate the procedure.  */
  APPLY "CLOSE":U TO THIS-PROCEDURE.
  RETURN NO-APPLY.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME BUTTON-1
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL BUTTON-1 C-Win
ON CHOOSE OF BUTTON-1 IN FRAME DEFAULT-FRAME /* Window with OCX */
DO:
    RUN mainwin2.r.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME BUTTON-2
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL BUTTON-2 C-Win
ON CHOOSE OF BUTTON-2 IN FRAME DEFAULT-FRAME /* PSTimer Message */
DO:
  chCtrlFrame:PSTimer:Interval = 2000.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME BUTTON-3
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL BUTTON-3 C-Win
ON CHOOSE OF BUTTON-3 IN FRAME DEFAULT-FRAME /* .Net Window */
DO:
    RUN runner.p.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME BUTTON-4
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL BUTTON-4 C-Win
ON CHOOSE OF BUTTON-4 IN FRAME DEFAULT-FRAME /* Go! */
DO:
    DEF VAR http AS System.Net.HttpWebRequest no-undo.
    def var response as System.Net.HttpWebResponse no-undo.
    def var reader as System.IO.StreamReader no-undo.
    def var json as char no-undo.
    def var jsonobj as Progress.Json.ObjectModel.JsonObject no-undo.
    def var jsonobj2 as Progress.Json.ObjectModel.JsonObject no-undo.
    def var myParser AS Progress.Json.ObjectModel.ObjectModelParser no-undo.
    
    http = cast(System.Net.HttpWebRequest:Create(fill-in-9:screen-value + "api/rest/prowcapp/" + fill-in-5:screen-value), "System.Net.HttpWebRequest").
    response = cast(http:GetResponse(), System.Net.HttpWebResponse).
    reader = new System.IO.StreamReader(response:GetResponseStream()).
    json = reader:readToEnd().

    message "JSON payload : " json view-as alert-box.    
    myParser = NEW Progress.Json.ObjectModel.ObjectModelParser().
    jsonobj = cast(myParser:Parse(json), Progress.Json.ObjectModel.JsonObject).
    jsonobj2 = jsonobj:getJsonObject("WebclientApplication").
    assign fill-in-10:screen-value = STRING(jsonobj2:GetInteger("version")).
    
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME CtrlFrame
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL CtrlFrame C-Win OCX.Tick
PROCEDURE CtrlFrame.PSTimer.Tick .
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  None required for OCX.
  Notes:       
------------------------------------------------------------------------------*/

    chCtrlFrame:PSTimer:Interval = 0.
    MESSAGE "OCX.Tick". 
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&UNDEFINE SELF-NAME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK C-Win 


/* ***************************  Main Block  *************************** */

/* Set CURRENT-WINDOW: this will parent dialog-boxes and frames.        */
ASSIGN CURRENT-WINDOW                = {&WINDOW-NAME} 
       THIS-PROCEDURE:CURRENT-WINDOW = {&WINDOW-NAME}.

/* The CLOSE event can be used from inside or outside the procedure to  */
/* terminate it.                                                        */
ON CLOSE OF THIS-PROCEDURE 
   RUN disable_UI.

/* Best default for GUI applications is...                              */
PAUSE 0 BEFORE-HIDE.

/* Now enable the interface and wait for the exit condition.            */
/* (NOTE: handle ERROR and END-KEY so cleanup code will always fire.    */
MAIN-BLOCK:
DO ON ERROR   UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK
   ON END-KEY UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK:
  RUN enable_UI.
  EDITOR-1:read-file("sample.txt").
  assign fill-in-1:screen-value = session:parameter.
  ASSIGN fill-in-2:SCREEN-VALUE = PROVERSION.
  ASSIGN fill-in-3:SCREEN-VALUE = PROGRESS.
  FILE-INFO:FILE-NAME = ".".
  ASSIGN fill-in-4:SCREEN-VALUE = FILE-INFO:FULL-PATHNAME.

  DEFINE VARIABLE vendor AS CHARACTER   NO-UNDO.
  DEFINE VARIABLE app  AS CHARACTER   NO-UNDO.
  app = bottomDir(FILE-INFO:FULL-PATHNAME).
  vendor = bottomDir(parentDir(FILE-INFO:FULL-PATHNAME)).
  assign fill-in-5:screen-value = vendor + "/" + app.
  
  DEFINE VARIABLE cVal AS CHARACTER   NO-UNDO.
  load "Software\" + vendor + "\" + app base-key "HKEY_CURRENT_USER" no-error.
  USE "Software\" + vendor  + "\" + app NO-ERROR.
  GET-KEY-VALUE section "" KEY "ApplicationInstallVersion" VALUE cVal.
  assign fill-in-6:screen-value = cval.
  unload "Software\" + vendor + "\" + app no-error.
  
  load "Software\" + vendor + "\" + app base-key "HKEY_LOCAL_MACHINE" no-error.
  USE "Software\" + vendor  + "\" + app NO-ERROR.
  GET-KEY-VALUE section "" KEY "ApplicationInstallVersion" VALUE cVal.
  assign fill-in-7:screen-value = cval.
  unload "Software\" + vendor + "\" + app no-error.

  load "Software\Wow6432Node\" + vendor + "\" + app base-key "HKEY_LOCAL_MACHINE" no-error.
  USE "Software\Wow6432Node\" + vendor + "\" + app NO-ERROR.
  GET-KEY-VALUE section "" KEY "ApplicationInstallVersion" VALUE cVal.
  assign fill-in-8:screen-value = cval.
  unload "Software\Wow6432Node\" + vendor + "\" + app no-error.

  IF NOT THIS-PROCEDURE:PERSISTENT THEN
    WAIT-FOR CLOSE OF THIS-PROCEDURE.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE control_load C-Win  _CONTROL-LOAD
PROCEDURE control_load :
/*------------------------------------------------------------------------------
  Purpose:     Load the OCXs    
  Parameters:  <none>
  Notes:       Here we load, initialize and make visible the 
               OCXs in the interface.                        
------------------------------------------------------------------------------*/

&IF "{&OPSYS}" = "WIN32":U AND "{&WINDOW-SYSTEM}" NE "TTY":U &THEN
DEFINE VARIABLE UIB_S    AS LOGICAL    NO-UNDO.
DEFINE VARIABLE OCXFile  AS CHARACTER  NO-UNDO.

OCXFile = SEARCH( "mainwin.wrx":U ).
IF OCXFile = ? THEN
  OCXFile = SEARCH(SUBSTRING(THIS-PROCEDURE:FILE-NAME, 1,
                     R-INDEX(THIS-PROCEDURE:FILE-NAME, ".":U), "CHARACTER":U) + "wrx":U).

IF OCXFile <> ? THEN
DO:
  ASSIGN
    chCtrlFrame = CtrlFrame:COM-HANDLE
    UIB_S = chCtrlFrame:LoadControls( OCXFile, "CtrlFrame":U)
    CtrlFrame:NAME = "CtrlFrame":U
  .
  RUN initialize-controls IN THIS-PROCEDURE NO-ERROR.
END.
ELSE MESSAGE "mainwin.wrx":U SKIP(1)
             "The binary control file could not be found. The controls cannot be loaded."
             VIEW-AS ALERT-BOX TITLE "Controls Not Loaded".

&ENDIF

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI C-Win  _DEFAULT-DISABLE
PROCEDURE disable_UI :
/*------------------------------------------------------------------------------
  Purpose:     DISABLE the User Interface
  Parameters:  <none>
  Notes:       Here we clean-up the user-interface by deleting
               dynamic widgets we have created and/or hide 
               frames.  This procedure is usually called when
               we are ready to "clean-up" after running.
------------------------------------------------------------------------------*/
  /* Delete the WINDOW we created */
  IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(C-Win)
  THEN DELETE WIDGET C-Win.
  IF THIS-PROCEDURE:PERSISTENT THEN DELETE PROCEDURE THIS-PROCEDURE.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE enable_UI C-Win  _DEFAULT-ENABLE
PROCEDURE enable_UI :
/*------------------------------------------------------------------------------
  Purpose:     ENABLE the User Interface
  Parameters:  <none>
  Notes:       Here we display/view/enable the widgets in the
               user-interface.  In addition, OPEN all queries
               associated with each FRAME and BROWSE.
               These statements here are based on the "Other 
               Settings" section of the widget Property Sheets.
------------------------------------------------------------------------------*/
  RUN control_load.
  DISPLAY EDITOR-1 FILL-IN-1 FILL-IN-2 FILL-IN-3 FILL-IN-4 FILL-IN-5 FILL-IN-6 
          FILL-IN-7 FILL-IN-8 FILL-IN-9 FILL-IN-10 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  ENABLE EDITOR-1 FILL-IN-1 FILL-IN-2 FILL-IN-3 FILL-IN-4 FILL-IN-5 FILL-IN-6 
         FILL-IN-7 FILL-IN-8 BUTTON-1 BUTTON-2 BUTTON-3 FILL-IN-9 BUTTON-4 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  {&OPEN-BROWSERS-IN-QUERY-DEFAULT-FRAME}
  VIEW C-Win.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

/* ************************  Function Implementations ***************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION bottomDir C-Win 
FUNCTION bottomDir RETURNS CHARACTER
    (src AS CHARACTER):

    DEFINE VARIABLE m1 AS MEMPTR     NO-UNDO.
    DEFINE VARIABLE m2 AS MEMPTR     NO-UNDO.
    DEFINE VARIABLE c  AS CHARACTER  NO-UNDO.
    
    /* Si le nom termine par un anti-slash, on l'enlève */
    /* Sinon ça bloque les remontées de niveau */ 
    IF SUBSTRING(src, LENGTH(src)) EQ '~\' THEN
        ASSIGN src = SUBSTRING(src, 1, LENGTH(src) - 1).

    SET-SIZE(m1) = {&MAX_FNAME}.
    SET-SIZE(m2) = {&MAX_EXT}.
    RUN _splitpath(src, 0, 0, GET-POINTER-VALUE(m1), GET-POINTER-VALUE(m2)).
    ASSIGN c = GET-STRING(m1, 1) + GET-STRING(m2, 1).
    /*RUN _wsplitpath(CODEPAGE-CONVERT(src, 'UCS2'), 0, 0, GET-POINTER-VALUE(m1), GET-POINTER-VALUE(m2)).
    ASSIGN c = wc2char(m1) + wc2char(m2).*/
    SET-SIZE(m1) = 0.
    SET-SIZE(m2) = 0.
    
    RETURN c.

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION parentDir C-Win 
FUNCTION parentDir RETURNS CHARACTER
    (src AS CHARACTER):

    DEFINE VARIABLE m1 AS MEMPTR     NO-UNDO.
    DEFINE VARIABLE m2 AS MEMPTR     NO-UNDO.
    DEFINE VARIABLE m3 AS MEMPTR     NO-UNDO.
    DEFINE VARIABLE c  AS CHARACTER  NO-UNDO.

    /* Si le nom termine par un anti-slash, on l'enlève */
    /* Sinon ça bloque les remontées de niveau */ 
    IF SUBSTRING(src, LENGTH(src)) EQ '~\' THEN
        ASSIGN src = SUBSTRING(src, 1, LENGTH(src) - 1).
        
    SET-SIZE(m1) = {&MAX_DRIVE}.
    SET-SIZE(m2) = {&MAX_PATH}.
    RUN _splitpath(src, 0, 0, GET-POINTER-VALUE(m1), GET-POINTER-VALUE(m2)).
    ASSIGN c = GET-STRING(m1, 1) + GET-STRING(m2, 1).
    /*RUN _wsplitpath(CODEPAGE-CONVERT(src, 'UCS2'), GET-POINTER-VALUE(m1), GET-POINTER-VALUE(m2), 0, 0).
    ASSIGN c = wc2char(m1) + wc2char(m2).*/
    SET-SIZE(m1) = 0.
    SET-SIZE(m2) = 0.

    RETURN c.

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION wc2char C-Win 
FUNCTION wc2char RETURNS CHARACTER
    (src AS MEMPTR):

    RETURN wco2char(src, 0).

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION wco2char C-Win 
FUNCTION wco2char RETURNS CHARACTER
    (src AS MEMPTR, offset AS INTEGER):

    DEFINE VARIABLE i AS INTEGER    NO-UNDO.
    DEFINE VARIABLE m AS MEMPTR     NO-UNDO.
    DEFINE VARIABLE c AS CHARACTER  NO-UNDO.

    SET-SIZE(m) = 1.
    RUN WideCharToMultiByte(INPUT 65001, INPUT 0, INPUT GET-POINTER-VALUE(src) + offset, INPUT -1, INPUT m, INPUT 0, INPUT 0, INPUT 0, OUTPUT i).
    SET-SIZE(m) = 0.
    SET-SIZE(m) = i.
    RUN WideCharToMultiByte(INPUT 65001, INPUT 0, INPUT GET-POINTER-VALUE(src) + offset, INPUT -1, INPUT m, INPUT i, INPUT 0, INPUT 0, OUTPUT i).
    ASSIGN c = GET-STRING(m, 1).
    SET-SIZE(m) = 0.

    RETURN c.

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

