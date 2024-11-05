unit gst124_uridownloader;

interface

uses
  glib280,
  gst124,
  gst124_base,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include gst/uridownloader/gstfragment.inc}
{$include gst/uridownloader/gsturidownloader.inc}
{$include gst/uridownloader/gsturidownloader_debug.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/uridownloader/gstfragment.inc}
{$include gst/uridownloader/gsturidownloader.inc}
{$include gst/uridownloader/gsturidownloader_debug.inc}
{$UNDEF read_implementation}

end.
