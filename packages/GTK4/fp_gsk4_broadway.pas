unit fp_GSK4_broadway;

//{$modeswitch typehelpers}

interface

uses
  fp_glib2, fp_cairo, fp_GSK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include GSK/broadway/gskbroadwayrenderer.inc }
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include GSK/broadway/gskbroadwayrenderer.inc }
{$UNDEF read_implementation}

end.
