/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 28-08-2024   15:47                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGskRenderNodeType = ^TGskRenderNodeType;
  TGskRenderNodeType = longint;

const
  GSK_NOT_A_RENDER_NODE = 0;
  GSK_CONTAINER_NODE = 1;
  GSK_CAIRO_NODE = 2;
  GSK_COLOR_NODE = 3;
  GSK_LINEAR_GRADIENT_NODE = 4;
  GSK_REPEATING_LINEAR_GRADIENT_NODE = 5;
  GSK_RADIAL_GRADIENT_NODE = 6;
  GSK_REPEATING_RADIAL_GRADIENT_NODE = 7;
  GSK_CONIC_GRADIENT_NODE = 8;
  GSK_BORDER_NODE = 9;
  GSK_TEXTURE_NODE = 10;
  GSK_INSET_SHADOW_NODE = 11;
  GSK_OUTSET_SHADOW_NODE = 12;
  GSK_TRANSFORM_NODE = 13;
  GSK_OPACITY_NODE = 14;
  GSK_COLOR_MATRIX_NODE = 15;
  GSK_REPEAT_NODE = 16;
  GSK_CLIP_NODE = 17;
  GSK_ROUNDED_CLIP_NODE = 18;
  GSK_SHADOW_NODE = 19;
  GSK_BLEND_NODE = 20;
  GSK_CROSS_FADE_NODE = 21;
  GSK_TEXT_NODE = 22;
  GSK_BLUR_NODE = 23;
  GSK_DEBUG_NODE = 24;
  GSK_GL_SHADER_NODE = 25;
  GSK_TEXTURE_SCALE_NODE = 26;
  GSK_MASK_NODE = 27;
  GSK_FILL_NODE = 28;
  GSK_STROKE_NODE = 29;
  GSK_SUBSURFACE_NODE = 30;

type
  PGskScalingFilter = ^TGskScalingFilter;
  TGskScalingFilter = longint;

const
  GSK_SCALING_FILTER_LINEAR = 0;
  GSK_SCALING_FILTER_NEAREST = 1;
  GSK_SCALING_FILTER_TRILINEAR = 2;

type
  PGskBlendMode = ^TGskBlendMode;
  TGskBlendMode = longint;

const
  GSK_BLEND_MODE_DEFAULT = 0;
  GSK_BLEND_MODE_MULTIPLY = 1;
  GSK_BLEND_MODE_SCREEN = 2;
  GSK_BLEND_MODE_OVERLAY = 3;
  GSK_BLEND_MODE_DARKEN = 4;
  GSK_BLEND_MODE_LIGHTEN = 5;
  GSK_BLEND_MODE_COLOR_DODGE = 6;
  GSK_BLEND_MODE_COLOR_BURN = 7;
  GSK_BLEND_MODE_HARD_LIGHT = 8;
  GSK_BLEND_MODE_SOFT_LIGHT = 9;
  GSK_BLEND_MODE_DIFFERENCE = 10;
  GSK_BLEND_MODE_EXCLUSION = 11;
  GSK_BLEND_MODE_COLOR = 12;
  GSK_BLEND_MODE_HUE = 13;
  GSK_BLEND_MODE_SATURATION = 14;
  GSK_BLEND_MODE_LUMINOSITY = 15;

type
  PGskCorner = ^TGskCorner;
  TGskCorner = longint;

const
  GSK_CORNER_TOP_LEFT = 0;
  GSK_CORNER_TOP_RIGHT = 1;
  GSK_CORNER_BOTTOM_RIGHT = 2;
  GSK_CORNER_BOTTOM_LEFT = 3;

type
  PGskFillRule = ^TGskFillRule;
  TGskFillRule = longint;

const
  GSK_FILL_RULE_WINDING = 0;
  GSK_FILL_RULE_EVEN_ODD = 1;

type
  PGskLineCap = ^TGskLineCap;
  TGskLineCap = longint;

const
  GSK_LINE_CAP_BUTT = 0;
  GSK_LINE_CAP_ROUND = 1;
  GSK_LINE_CAP_SQUARE = 2;

type
  PGskLineJoin = ^TGskLineJoin;
  TGskLineJoin = longint;

const
  GSK_LINE_JOIN_MITER = 0;
  GSK_LINE_JOIN_ROUND = 1;
  GSK_LINE_JOIN_BEVEL = 2;

type
  PGskPathOperation = ^TGskPathOperation;
  TGskPathOperation = longint;

const
  GSK_PATH_MOVE = 0;
  GSK_PATH_CLOSE = 1;
  GSK_PATH_LINE = 2;
  GSK_PATH_QUAD = 3;
  GSK_PATH_CUBIC = 4;
  GSK_PATH_CONIC = 5;

type
  PGskPathDirection = ^TGskPathDirection;
  TGskPathDirection = longint;

const
  GSK_PATH_FROM_START = 0;
  GSK_PATH_TO_START = 1;
  GSK_PATH_TO_END = 2;
  GSK_PATH_FROM_END = 3;

type
  PGskSerializationError = ^TGskSerializationError;
  TGskSerializationError = longint;

const
  GSK_SERIALIZATION_UNSUPPORTED_FORMAT = 0;
  GSK_SERIALIZATION_UNSUPPORTED_VERSION = 1;
  GSK_SERIALIZATION_INVALID_DATA = 2;

type
  PGskTransformCategory = ^TGskTransformCategory;
  TGskTransformCategory = longint;

const
  GSK_TRANSFORM_CATEGORY_UNKNOWN = 0;
  GSK_TRANSFORM_CATEGORY_ANY = 1;
  GSK_TRANSFORM_CATEGORY_3D = 2;
  GSK_TRANSFORM_CATEGORY_2D = 3;
  GSK_TRANSFORM_CATEGORY_2D_AFFINE = 4;
  GSK_TRANSFORM_CATEGORY_2D_TRANSLATE = 5;
  GSK_TRANSFORM_CATEGORY_IDENTITY = 6;

type
  PGskGLUniformType = ^TGskGLUniformType;
  TGskGLUniformType = longint;

const
  GSK_GL_UNIFORM_TYPE_NONE = 0;
  GSK_GL_UNIFORM_TYPE_FLOAT = 1;
  GSK_GL_UNIFORM_TYPE_INT = 2;
  GSK_GL_UNIFORM_TYPE_UINT = 3;
  GSK_GL_UNIFORM_TYPE_BOOL = 4;
  GSK_GL_UNIFORM_TYPE_VEC2 = 5;
  GSK_GL_UNIFORM_TYPE_VEC3 = 6;
  GSK_GL_UNIFORM_TYPE_VEC4 = 7;

type
  PGskMaskMode = ^TGskMaskMode;
  TGskMaskMode = longint;

const
  GSK_MASK_MODE_ALPHA = 0;
  GSK_MASK_MODE_INVERTED_ALPHA = 1;
  GSK_MASK_MODE_LUMINANCE = 2;
  GSK_MASK_MODE_INVERTED_LUMINANCE = 3;

  // === Konventiert am: 3-8-24 13:55:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}