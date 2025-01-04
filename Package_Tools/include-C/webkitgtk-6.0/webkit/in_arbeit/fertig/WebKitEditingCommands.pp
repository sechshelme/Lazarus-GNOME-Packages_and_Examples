
unit WebKitEditingCommands;
interface

{
  Automatically converted by H2Pas 1.0.0 from WebKitEditingCommands.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    WebKitEditingCommands.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2012 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$if !defined(__WEBKIT_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <webkit/webkit.h> can be included directly."}
{$endif}
{$ifndef WebKitEditingCommands_h}
{$define WebKitEditingCommands_h}
{*
 * WEBKIT_EDITING_COMMAND_CUT:
 *
 * The cut clipboard command. Copies the current selection inside
 * a #WebKitWebView to the clipboard and deletes the selected content.
 * You can check whether it's possible to execute the command with
 * webkit_web_view_can_execute_editing_command(). In general it's
 * possible to cut to the clipboard when the #WebKitWebView content is
 * editable and there is an active selection.
  }

const
  WEBKIT_EDITING_COMMAND_CUT = 'Cut';  
{*
 * WEBKIT_EDITING_COMMAND_COPY:
 *
 * The copy clipboard command. Copies the current selection inside
 * a #WebKitWebView to the clipboard.
 * You can check whether it's possible to execute the command with
 * webkit_web_view_can_execute_editing_command(). In general it's
 * possible to copy to the clipboard when there is an active selection
 * inside the #WebKitWebView.
  }
  WEBKIT_EDITING_COMMAND_COPY = 'Copy';  
{*
 * WEBKIT_EDITING_COMMAND_PASTE:
 *
 * The paste clipboard command. Pastes the contents of the clipboard to
 * a #WebKitWebView.
 * You can check whether it's possible to execute the command with
 * webkit_web_view_can_execute_editing_command(). In general it's possible
 * to paste from the clipboard when the #WebKitWebView content is editable
 * and clipboard is not empty.
  }
  WEBKIT_EDITING_COMMAND_PASTE = 'Paste';  
{*
 * WEBKIT_EDITING_COMMAND_PASTE_AS_PLAIN_TEXT:
 *
 * The paste as plaintext clipboard command. Pastes the contents of the
 * clipboard to a #WebKitWebView, with formatting removed.
 * You can check whether it's possible to execute the command with
 * webkit_web_view_can_execute_editing_command(). In general it's possible
 * to paste from the clipboard when the #WebKitWebView content is editable
 * and clipboard is not empty.
 *
 * Since: 2.30
  }
  WEBKIT_EDITING_COMMAND_PASTE_AS_PLAIN_TEXT = 'PasteAsPlainText';  
{*
 * WEBKIT_EDITING_COMMAND_SELECT_ALL:
 *
 * The select all command. Selects all the content of the current text field in
 * a #WebKitWebView.
 * It is always possible to select all text, no matter whether the
 * #WebKitWebView content is editable or not. You can still check it
 * with webkit_web_view_can_execute_editing_command().
  }
  WEBKIT_EDITING_COMMAND_SELECT_ALL = 'SelectAll';  
{*
 * WEBKIT_EDITING_COMMAND_UNDO:
 *
 * The undo command. Undoes the last editing command in a #WebKitWebView.
 * You can check whether it's possible to execute the command with
 * webkit_web_view_can_execute_editing_command(). It's only possible
 * to undo a command after a previously executed editing operation.
  }
  WEBKIT_EDITING_COMMAND_UNDO = 'Undo';  
{*
 * WEBKIT_EDITING_COMMAND_REDO:
 *
 * The redo command. Redoes a previously undone editing command in
 * a #WebKitWebView.
 * You can check whether it's possible to execute the command with
 * webkit_web_view_can_execute_editing_command(). It's only possible
 * to redo a command when it has been previously undone.
  }
  WEBKIT_EDITING_COMMAND_REDO = 'Redo';  
{*
 * WEBKIT_EDITING_COMMAND_INSERT_IMAGE:
 *
 * The insert image command. Creates an image element that is inserted at
 * the current cursor position. It receives an URI as argument,
 * that is used as the image source. This command should be executed with
 * webkit_web_view_execute_editing_command_with_argument().
 *
 * Since: 2.10
  }
  WEBKIT_EDITING_COMMAND_INSERT_IMAGE = 'InsertImage';  
{*
 * WEBKIT_EDITING_COMMAND_CREATE_LINK:
 *
 * The create link command. Creates a link element that is inserted at
 * the current cursor position. If there's a selection, the selected text
 * will be used as the link text, otherwise the URL itself will be used.
 * It receives the link URL as argument. This command should be executed
 * with webkit_web_view_execute_editing_command_with_argument()
 *
 * Since: 2.10
  }
  WEBKIT_EDITING_COMMAND_CREATE_LINK = 'CreateLink';  
{$endif}

implementation


end.
