package al;

import "core:os"

when os.OS == "windows" {
	foreign import openal "OpenAL32.lib";
} else when os.OS == "linux" {
	foreign import openal "system:openal";
} else {
	#assert(false);
}

/*
ALboolean -> u8
ALchar    -> u8
ALbyte    -> i8
ALubyte   -> u8
ALshort   -> i16
ALushort  -> u16
ALint     -> i32
ALuint    -> u32
ALsizei   -> i32
ALenum    -> i32
ALfloat   -> f32
ALdouble  -> f64
ALvoid    -> rawptr?
*/


INVALID :: -1;
NONE :: 0;
FALSE :: 0;
TRUE :: 1;
SOURCE_RELATIVE :: 0x202;
CONE_INNER_ANGLE :: 0x1001;
CONE_OUTER_ANGLE :: 0x1002;
PITCH :: 0x1003;
POSITION :: 0x1004;
DIRECTION :: 0x1005;
VELOCITY :: 0x1006;
LOOPING :: 0x1007;
BUFFER :: 0x1009;
GAIN :: 0x100A;
MIN_GAIN :: 0x100D;
MAX_GAIN :: 0x100E;
ORIENTATION :: 0x100F;
CHANNEL_MASK :: 0x3000;
SOURCE_STATE :: 0x1010;
INITIAL :: 0x1011;
PLAYING :: 0x1012;
PAUSED :: 0x1013;
STOPPED :: 0x1014;
BUFFERS_QUEUED :: 0x1015;
BUFFERS_PROCESSED :: 0x1016;
SEC_OFFSET :: 0x1024;
SAMPLE_OFFSET :: 0x1025;
BYTE_OFFSET :: 0x1026;
SOURCE_TYPE :: 0x1027;
STATIC :: 0x1028;
STREAMING :: 0x1029;
UNDETERMINED :: 0x1030;
FORMAT_MONO8 :: 0x1100;
FORMAT_MONO16 :: 0x1101;
FORMAT_STEREO8 :: 0x1102;
FORMAT_STEREO16 :: 0x1103;
REFERENCE_DISTANCE :: 0x1020;
ROLLOFF_FACTOR :: 0x1021;
CONE_OUTER_GAIN :: 0x1022;
MAX_DISTANCE :: 0x1023;
FREQUENCY :: 0x2001;
BITS :: 0x2002;
CHANNELS :: 0x2003;
SIZE :: 0x2004;
UNUSED :: 0x2010;
PENDING :: 0x2011;
PROCESSED :: 0x2012;
NO_ERROR :: FALSE;
INVALID_NAME :: 0xA001;
ILLEGAL_ENUM :: 0xA002;
INVALID_ENUM :: 0xA002;
INVALID_VALUE :: 0xA003;
ILLEGAL_COMMAND :: 0xA004;
INVALID_OPERATION :: 0xA004;
OUT_OF_MEMORY :: 0xA005;
VENDOR :: 0xB001;
VERSION :: 0xB002;
RENDERER :: 0xB003;
EXTENSIONS :: 0xB004;
DOPPLER_FACTOR :: 0xC000;
DOPPLER_VELOCITY :: 0xC001;
SPEED_OF_SOUND :: 0xC003;
DISTANCE_MODEL :: 0xD000;
INVERSE_DISTANCE :: 0xD001;
INVERSE_DISTANCE_CLAMPED :: 0xD002;
LINEAR_DISTANCE :: 0xD003;
LINEAR_DISTANCE_CLAMPED :: 0xD004;
EXPONENT_DISTANCE :: 0xD005;
EXPONENT_DISTANCE_CLAMPED :: 0xD006;

@(default_calling_convention="c")
foreign openal {
	@(link_name="alEnable")               enable                 :: proc(capability: i32)                                        ---;
	@(link_name="alDisable")              disable                :: proc(capability: i32)                                        ---;
	@(link_name="alIsEnabled")            is_enabled             :: proc(capability: i32) -> u8                                  ---;
	@(link_name="alGetString")            get_string             :: proc(param: i32) -> cstring                                      ---;
	@(link_name="alGetBooleanv")          get_booleanv           :: proc(param: i32, data: ^u8)                                  ---;
	@(link_name="alGetIntegerv")          get_integerv           :: proc(param: i32, data: ^i32)                                 ---;
	@(link_name="alGetFloatv")            get_floatv             :: proc(param: i32, data: ^f32)                                 ---;
	@(link_name="alGetDoublev")           get_doublev            :: proc(param: i32, data: ^f64)                                 ---;
	@(link_name="alGetBoolean")           get_boolean            :: proc(param: i32) -> u8                                       ---;
	@(link_name="alGetInteger")           get_integer            :: proc(param: i32) -> i32                                      ---;
	@(link_name="alGetFloat")             get_float              :: proc(param: i32) -> f32                                      ---;
	@(link_name="alGetDouble")            get_double             :: proc(param: i32) -> f64                                      ---;
	@(link_name="alGetError")             get_error              :: proc() -> i32                                                ---;
	@(link_name="alIsExtensionPresent")   is_extension_present   :: proc(extname: cstring) -> u8                                     ---;
	@(link_name="alGetProcAddress")       get_proc_address       :: proc(fname: cstring) -> rawptr                                   ---;
	@(link_name="alGetEnumValue")         get_enum_value         :: proc(ename: cstring) -> i32                                      ---;
	@(link_name="alListenerf")            listenerf              :: proc(param: i32, value: f32)                                 ---;
	@(link_name="alListener3f")           listener3f             :: proc(param: i32, value1, value2, value3: f32)                ---;
	@(link_name="alListenerfv")           listenerfv             :: proc(param: i32, values: ^f32)                               ---;
	@(link_name="alListeneri")            listeneri              :: proc(param: i32, value: i32)                                 ---;
	@(link_name="alListener3i")           listener3i             :: proc(param: i32, value1, value2, value3: i32)                ---;
	@(link_name="alListeneriv")           listeneriv             :: proc(param: i32, values: ^i32)                               ---;
	@(link_name="alGetListenerf")         get_listenerf          :: proc(param: i32, value: ^f32)                                ---;
	@(link_name="alGetListener3f")        get_listener3f         :: proc(param: i32, value1, value2, value3: ^f32)               ---;
	@(link_name="alGetListenerfv")        get_listenerfv         :: proc(param: i32, values: ^f32)                               ---;
	@(link_name="alGetListeneri")         get_listeneri          :: proc(param: i32, value: ^i32)                                ---;
	@(link_name="alGetListener3i")        get_listener3i         :: proc(param: i32, value1, value2, value3: ^i32)               ---;
	@(link_name="alGetListeneriv")        get_listeneriv         :: proc(param: i32, values: ^i32)                               ---;
	@(link_name="alGenSources")           gen_sources            :: proc(n: i32, sources: ^u32)                                  ---;
	@(link_name="alDeleteSources")        delete_sources         :: proc(n: i32, sources: ^u32)                                  ---;
	@(link_name="alIsSource")             is_source              :: proc(sid: u32) -> u8                                         ---;
	@(link_name="alSourcef")              sourcef                :: proc(sid: u32, param: i32, value: f32)                       ---;
	@(link_name="alSource3f")             source3f               :: proc(sid: u32, param: i32, value1, value2, value3: f32)      ---;
	@(link_name="alSourcefv")             sourcefv               :: proc(sid: u32, param: i32, values: ^f32)                     ---;
	@(link_name="alSourcei")              sourcei                :: proc(sid: u32, param: i32, value: i32)                       ---;
	@(link_name="alSource3i")             source3i               :: proc(sid: u32, param: i32, value1, value2, value3: i32)      ---;
	@(link_name="alSourceiv")             sourceiv               :: proc(sid: u32, param: i32, values: ^i32)                     ---;
	@(link_name="alGetSourcef")           get_sourcef            :: proc(sid: u32, param: i32, value: ^f32)                      ---;
	@(link_name="alGetSource3f")          get_source3f           :: proc(sid: u32, param: i32, value1, value2, value3: ^f32)     ---;
	@(link_name="alGetSourcefv")          get_sourcefv           :: proc(sid: u32, param: i32, values: ^f32)                     ---;
	@(link_name="alGetSourcei")           get_sourcei            :: proc(sid: u32, param: i32, value: ^i32)                      ---;
	@(link_name="alGetSource3i")          get_source3i           :: proc(sid: u32, param: i32, value1, value2, value3: ^i32)     ---;
	@(link_name="alGetSourceiv")          get_sourceiv           :: proc(sid: u32, param: i32, values: ^i32)                     ---;
	@(link_name="alSourcePlayv")          source_playv           :: proc(ns: i32, sids: ^u32)                                    ---;
	@(link_name="alSourceStopv")          source_stopv           :: proc(ns: i32, sids: ^u32)                                    ---;
	@(link_name="alSourceRewindv")        source_rewindv         :: proc(ns: i32, sids: ^u32)                                    ---;
	@(link_name="alSourcePausev")         source_pausev          :: proc(ns: i32, sids: ^u32)                                    ---;
	@(link_name="alSourcePlay")           source_play            :: proc(sid: u32)                                               ---;
	@(link_name="alSourceStop")           source_stop            :: proc(sid: u32)                                               ---;
	@(link_name="alSourceRewind")         source_rewind          :: proc(sid: u32)                                               ---;
	@(link_name="alSourcePause")          source_pause           :: proc(sid: u32)                                               ---;
	@(link_name="alSourceQueueBuffers")   source_queue_buffers   :: proc(sid: u32,numEntries: i32, bids: ^u32)                   ---;
	@(link_name="alSourceUnqueueBuffers") source_unqueue_buffers :: proc(sid: u32,numEntries: i32, bids: ^u32)                   ---;
	@(link_name="alGenBuffers")           gen_buffers            :: proc(n: i32, buffers: ^u32)                                  ---;
	@(link_name="alDeleteBuffers")        delete_buffers         :: proc(n: i32, buffers: ^u32)                                  ---;
	@(link_name="alIsBuffer")             is_buffer              :: proc(bid: u32) -> u8                                         ---;
	@(link_name="alBufferData")           buffer_data            :: proc(bid: u32, format: i32, data: ^u8, size: i32, freq: i32) ---;
	@(link_name="alBufferf")              bufferf                :: proc(bid: u32,param: i32, value: f32)                        ---;
	@(link_name="alBuffer3f")             buffer3f               :: proc(bid: u32,param: i32, value1, value2, value3: f32)       ---;
	@(link_name="alBufferfv")             bufferfv               :: proc(bid: u32,param: i32, values: ^f32)                      ---;
	@(link_name="alBufferi")              bufferi                :: proc(bid: u32,param: i32, value: i32)                        ---;
	@(link_name="alBuffer3i")             buffer3i               :: proc(bid: u32,param: i32, value1, value2, value3: i32)       ---;
	@(link_name="alBufferiv")             bufferiv               :: proc(bid: u32,param: i32, values: ^i32)                      ---;
	@(link_name="alGetBufferf")           get_bufferf            :: proc(bid: u32,param: i32, value: ^f32)                       ---;
	@(link_name="alGetBuffer3f")          get_buffer3f           :: proc(bid: u32,param: i32, value1, value2, value3: ^f32)      ---;
	@(link_name="alGetBufferfv")          get_bufferfv           :: proc(bid: u32,param: i32, values: ^f32)                      ---;
	@(link_name="alGetBufferi")           get_bufferi            :: proc(bid: u32,param: i32, value: ^i32)                       ---;
	@(link_name="alGetBuffer3i")          get_buffer3i           :: proc(bid: u32,param: i32, value1, value2, value3: ^i32)      ---;
	@(link_name="alGetBufferiv")          get_bufferiv           :: proc(bid: u32,param: i32, values: ^i32)                      ---;
	@(link_name="alDopplerFactor")        doppler_factor         :: proc(value: f32)                                             ---;
	@(link_name="alDopplerVelocity")      doppler_velocity       :: proc(value: f32)                                             ---;
	@(link_name="alSpeedOfSound")         speed_of_sound         :: proc(value: f32)                                             ---;
	@(link_name="alDistanceModel")        distance_model         :: proc(distanceModel: i32)                                     ---;
}
