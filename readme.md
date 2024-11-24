# Inhalt
| **Paket Name:**   | **Version:** |
|----------         |----------    |
| **glib2**         | 2.80.0       |
| **gio-unix-2.0**  | 2.80.0       |
| **Cairo**         | 1.18.1       |
| **GdkPixbuf2**    | 2.42.10      |
| **GTK4**          | 4.14.2       |
| **gstreamer**     | 1.24.2       |
| **Pango**         | in Arbeit    |

# Wichtiger Hinweis
Da in den glib-Funktionen ein `invalid floating point operation` ausgelöst werden kann braucht ee folgendes:
```pascal
uses
  math;
begin
  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);
  GTK_blabla;
end.
```
Da dies in der glib2-packages schon gemacht wird, kann man auf dies bei Verwendung der Packages in eigenen Programmen verzichten.


## Paketinfo
- `pkg-config --cflags --libs gstreamer-1.0 gstreamer-pbutils-1.0`
- `pkg-config --modgstreamer-1.0` 

## GLIB2 
https://github.com/wadester/wh_test_glib/blob/master/glib_test1.c

## gobject
https://github.com/ToshioCP/Gobject-tutorial?tab=readme-ov-file

## GTK4
https://github.com/ToshioCP/Gtk4-tutorial

## gstreamer
### Tools
Plugin-Infos:
- `gst-inspect-1.0 --plugin`
- `gst-inspect-1.0 --plugin alsa`

### Pakete
`sudo apt install libva-dev`

### C-Examples
- (https://gstreamer.freedesktop.org/documentation/tutorials/basic/hello-world.html?gi-language=c)
- (https://github.com/GStreamer/gst-plugins-good/blob/master/tests/check/elements/id3demux.c)

### wine PATH
Folgende Datei editieren:
- `~/.bashrc`
Folgendes an Ende einfügen:
- `export WINEPATH="$WINEPATH;C:\users\tux\mingw64\bin;C:\gstreamer\1.0\msvc_x86_64\bin"`
Aktualisieren:
- `source ~/.bashrc`

### mp3 Tag Tools
- id3v2
- mp3tag
- kid3





