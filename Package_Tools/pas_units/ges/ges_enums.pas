unit ges_enums;

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function ges_track_type_get_type: TGType; cdecl; external libges;

type
  PGESTrackType = ^TGESTrackType;
  TGESTrackType = longint;

const
  GES_TRACK_TYPE_UNKNOWN = 1 shl 0;
  GES_TRACK_TYPE_AUDIO = 1 shl 1;
  GES_TRACK_TYPE_VIDEO = 1 shl 2;
  GES_TRACK_TYPE_TEXT = 1 shl 3;
  GES_TRACK_TYPE_CUSTOM = 1 shl 4;

function ges_meta_flag_get_type: TGType; cdecl; external libges;

type
  PGESMetaFlag = ^TGESMetaFlag;
  TGESMetaFlag = longint;

const
  GES_META_READABLE = 1 shl 0;
  GES_META_WRITABLE = 1 shl 1;
  GES_META_READ_WRITE = GES_META_READABLE or GES_META_WRITABLE;

type
  PGESVideoStandardTransitionType = ^TGESVideoStandardTransitionType;
  TGESVideoStandardTransitionType = longint;

const
  GES_VIDEO_STANDARD_TRANSITION_TYPE_NONE = 0;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BAR_WIPE_LR = 1;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BAR_WIPE_TB = 2;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BOX_WIPE_TL = 3;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BOX_WIPE_TR = 4;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BOX_WIPE_BR = 5;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BOX_WIPE_BL = 6;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_FOUR_BOX_WIPE_CI = 7;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_FOUR_BOX_WIPE_CO = 8;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BARNDOOR_V = 21;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BARNDOOR_H = 22;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BOX_WIPE_TC = 23;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BOX_WIPE_RC = 24;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BOX_WIPE_BC = 25;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BOX_WIPE_LC = 26;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_DIAGONAL_TL = 41;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_DIAGONAL_TR = 42;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BOWTIE_V = 43;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BOWTIE_H = 44;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BARNDOOR_DBL = 45;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BARNDOOR_DTL = 46;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_MISC_DIAGONAL_DBD = 47;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_MISC_DIAGONAL_DD = 48;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_VEE_D = 61;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_VEE_L = 62;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_VEE_U = 63;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_VEE_R = 64;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BARNVEE_D = 65;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BARNVEE_L = 66;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BARNVEE_U = 67;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_BARNVEE_R = 68;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_IRIS_RECT = 101;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_CLOCK_CW12 = 201;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_CLOCK_CW3 = 202;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_CLOCK_CW6 = 203;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_CLOCK_CW9 = 204;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_PINWHEEL_TBV = 205;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_PINWHEEL_TBH = 206;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_PINWHEEL_FB = 207;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_FAN_CT = 211;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_FAN_CR = 212;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_DOUBLEFAN_FOV = 213;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_DOUBLEFAN_FOH = 214;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_SINGLESWEEP_CWT = 221;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_SINGLESWEEP_CWR = 222;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_SINGLESWEEP_CWB = 223;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_SINGLESWEEP_CWL = 224;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_DOUBLESWEEP_PV = 225;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_DOUBLESWEEP_PD = 226;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_DOUBLESWEEP_OV = 227;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_DOUBLESWEEP_OH = 228;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_FAN_T = 231;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_FAN_R = 232;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_FAN_B = 233;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_FAN_L = 234;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_DOUBLEFAN_FIV = 235;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_DOUBLEFAN_FIH = 236;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_SINGLESWEEP_CWTL = 241;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_SINGLESWEEP_CWBL = 242;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_SINGLESWEEP_CWBR = 243;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_SINGLESWEEP_CWTR = 244;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_DOUBLESWEEP_PDTL = 245;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_DOUBLESWEEP_PDBL = 246;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_SALOONDOOR_T = 251;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_SALOONDOOR_L = 252;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_SALOONDOOR_B = 253;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_SALOONDOOR_R = 254;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_WINDSHIELD_R = 261;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_WINDSHIELD_U = 262;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_WINDSHIELD_V = 263;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_WINDSHIELD_H = 264;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_CROSSFADE = 512;
  GES_VIDEO_STANDARD_TRANSITION_TYPE_FADE_IN = 513;


function ges_video_standard_transition_type_get_type: TGType; cdecl; external libges;

type
  PGESTextVAlign = ^TGESTextVAlign;
  TGESTextVAlign = longint;

const
  GES_TEXT_VALIGN_BASELINE = 0;
  GES_TEXT_VALIGN_BOTTOM = 1;
  GES_TEXT_VALIGN_TOP = 2;
  GES_TEXT_VALIGN_POSITION = 3;
  GES_TEXT_VALIGN_CENTER = 4;
  GES_TEXT_VALIGN_ABSOLUTE = 5;

  DEFAULT_VALIGNMENT = GES_TEXT_VALIGN_BASELINE;

function ges_text_valign_get_type: TGType; cdecl; external libges;

type
  PGESTextHAlign = ^TGESTextHAlign;
  TGESTextHAlign = longint;

const
  GES_TEXT_HALIGN_LEFT = 0;
  GES_TEXT_HALIGN_CENTER = 1;
  GES_TEXT_HALIGN_RIGHT = 2;
  GES_TEXT_HALIGN_POSITION = 4;
  GES_TEXT_HALIGN_ABSOLUTE = 5;

  DEFAULT_HALIGNMENT = GES_TEXT_HALIGN_CENTER;

function ges_text_halign_get_type: TGType; cdecl; external libges;

type
  PGESVideoTestPattern = ^TGESVideoTestPattern;
  TGESVideoTestPattern = longint;

const
  GES_VIDEO_TEST_PATTERN_SMPTE = 0;
  GES_VIDEO_TEST_PATTERN_SNOW = 1;
  GES_VIDEO_TEST_PATTERN_BLACK = 2;
  GES_VIDEO_TEST_PATTERN_WHITE = 3;
  GES_VIDEO_TEST_PATTERN_RED = 4;
  GES_VIDEO_TEST_PATTERN_GREEN = 5;
  GES_VIDEO_TEST_PATTERN_BLUE = 6;
  GES_VIDEO_TEST_PATTERN_CHECKERS1 = 7;
  GES_VIDEO_TEST_PATTERN_CHECKERS2 = 8;
  GES_VIDEO_TEST_PATTERN_CHECKERS4 = 9;
  GES_VIDEO_TEST_PATTERN_CHECKERS8 = 10;
  GES_VIDEO_TEST_PATTERN_CIRCULAR = 11;
  GES_VIDEO_TEST_PATTERN_BLINK = 12;
  GES_VIDEO_TEST_PATTERN_SMPTE75 = 13;
  GES_VIDEO_TEST_ZONE_PLATE = 14;
  GES_VIDEO_TEST_GAMUT = 15;
  GES_VIDEO_TEST_CHROMA_ZONE_PLATE = 16;
  GES_VIDEO_TEST_PATTERN_SOLID = 17;

function ges_video_test_pattern_get_type: TGType; cdecl; external libges;

type
  PGESPipelineFlags = ^TGESPipelineFlags;
  TGESPipelineFlags = longint;

const
  GES_PIPELINE_MODE_PREVIEW_AUDIO = 1 shl 0;
  GES_PIPELINE_MODE_PREVIEW_VIDEO = 1 shl 1;
  GES_PIPELINE_MODE_PREVIEW = GES_PIPELINE_MODE_PREVIEW_AUDIO or GES_PIPELINE_MODE_PREVIEW_VIDEO;
  GES_PIPELINE_MODE_RENDER = 1 shl 2;
  GES_PIPELINE_MODE_SMART_RENDER = 1 shl 3;

function ges_pipeline_flags_get_type: TGType; cdecl; external libges;

type
  PGESEditMode = ^TGESEditMode;
  TGESEditMode = longint;

const
  GES_EDIT_MODE_NORMAL = 0;
  GES_EDIT_MODE_RIPPLE = 1;
  GES_EDIT_MODE_ROLL = 2;
  GES_EDIT_MODE_TRIM = 3;
  GES_EDIT_MODE_SLIDE = 4;

function ges_edit_mode_name(mode: TGESEditMode): Pgchar; cdecl; external libges;

function ges_edit_mode_get_type: TGType; cdecl; external libges;

type
  PGESEdge = ^TGESEdge;
  TGESEdge = longint;

const
  GES_EDGE_START = 0;
  GES_EDGE_END = 1;
  GES_EDGE_NONE = 2;

function ges_edge_name(edge: TGESEdge): Pgchar; cdecl; external libges;
function ges_edge_get_type: TGType; cdecl; external libges;

function ges_marker_flags_get_type: TGType; cdecl; external libges;

type
  PGESMarkerFlags = ^TGESMarkerFlags;
  TGESMarkerFlags = longint;

const
  GES_MARKER_FLAG_NONE = 0;
  GES_MARKER_FLAG_SNAPPABLE = 1 shl 0;

function ges_track_type_name(_type: TGESTrackType): Pgchar; cdecl; external libges;

function GES_TYPE_TRACK_TYPE: TGType;
function GES_META_FLAG_TYPE: TGType;
function GES_VIDEO_STANDARD_TRANSITION_TYPE_TYPE: TGType;
function GES_TEXT_VALIGN_TYPE: TGType;
function GES_TEXT_HALIGN_TYPE: TGType;
function GES_VIDEO_TEST_PATTERN_TYPE: TGType;
function GES_TYPE_PIPELINE_FLAGS: TGType;
function GES_TYPE_EDIT_MODE: TGType;
function GES_TYPE_EDGE: TGType;
function GES_TYPE_MARKER_FLAGS: TGType;


// === Konventiert am: 12-12-24 17:37:24 ===


implementation


function GES_TYPE_TRACK_TYPE: TGType;
begin
  GES_TYPE_TRACK_TYPE := ges_track_type_get_type;
end;

function GES_META_FLAG_TYPE: TGType;
begin
  GES_META_FLAG_TYPE := ges_meta_flag_get_type;
end;

function GES_VIDEO_STANDARD_TRANSITION_TYPE_TYPE: TGType;
begin
  GES_VIDEO_STANDARD_TRANSITION_TYPE_TYPE := ges_video_standard_transition_type_get_type;
end;

function GES_TEXT_VALIGN_TYPE: TGType;
begin
  GES_TEXT_VALIGN_TYPE := ges_text_valign_get_type;
end;

function GES_TEXT_HALIGN_TYPE: TGType;
begin
  GES_TEXT_HALIGN_TYPE := ges_text_halign_get_type;
end;

function GES_VIDEO_TEST_PATTERN_TYPE: TGType;
begin
  GES_VIDEO_TEST_PATTERN_TYPE := ges_video_test_pattern_get_type;
end;

function GES_TYPE_PIPELINE_FLAGS: TGType;
begin
  GES_TYPE_PIPELINE_FLAGS := ges_pipeline_flags_get_type;
end;

function GES_TYPE_EDIT_MODE: TGType;
begin
  GES_TYPE_EDIT_MODE := ges_edit_mode_get_type;
end;

function GES_TYPE_EDGE: TGType;
begin
  GES_TYPE_EDGE := ges_edge_get_type;
end;

function GES_TYPE_MARKER_FLAGS: TGType;
begin
  GES_TYPE_MARKER_FLAGS := ges_marker_flags_get_type;
end;


end.
