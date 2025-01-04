unit WebKitEditingCommands;

interface

uses
  fp_glib2, fp_GTK4, WebKit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  WEBKIT_EDITING_COMMAND_CUT = 'Cut';
  WEBKIT_EDITING_COMMAND_COPY = 'Copy';
  WEBKIT_EDITING_COMMAND_PASTE = 'Paste';
  WEBKIT_EDITING_COMMAND_PASTE_AS_PLAIN_TEXT = 'PasteAsPlainText';
  WEBKIT_EDITING_COMMAND_SELECT_ALL = 'SelectAll';
  WEBKIT_EDITING_COMMAND_UNDO = 'Undo';
  WEBKIT_EDITING_COMMAND_REDO = 'Redo';
  WEBKIT_EDITING_COMMAND_INSERT_IMAGE = 'InsertImage';
  WEBKIT_EDITING_COMMAND_CREATE_LINK = 'CreateLink';

  // === Konventiert am: 4-1-25 13:53:31 ===


implementation



end.
