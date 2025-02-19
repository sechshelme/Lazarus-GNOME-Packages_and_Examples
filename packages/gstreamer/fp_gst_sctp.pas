unit fp_gst_sctp;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_base,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include gst/sctp/sctpreceivemeta.inc}
{$include gst/sctp/sctpsendmeta.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/sctp/sctpreceivemeta.inc}
{$include gst/sctp/sctpsendmeta.inc}
{$UNDEF read_implementation}

end.
