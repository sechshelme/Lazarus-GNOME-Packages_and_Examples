unit Common;

interface

uses
  fp_glib2, fp_GTK4;

type
  THuman = record
    Index: Tgint;
    FirstName: Pgchar;
    LastName: Pgchar;
    Age: Tgint;
    Size: Tgfloat;
  end;
  PHuman = ^THuman;

const
  humanObjectKey = 'human-object';
  store_Key = 'store';
  sort_model_Key = 'sort_model';
  mainWindows_Key = 'mainWindow';

implementation

end.
