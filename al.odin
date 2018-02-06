when ODIN_OS == "windows" {
	foreign import openal "OpenAL32.lib";
} else when ODIN_OS == "linux" {
	foreign import openal "system:openal";
} else {
	_ := compile_assert(false);
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
	@(link_name="alEnable")               Enable               :: proc(capability: i32)                                        ---;
	@(link_name="alDisable")              Disable              :: proc(capability: i32)                                        ---;
	@(link_name="alIsEnabled")            IsEnabled            :: proc(capability: i32) -> u8                                  ---;
	@(link_name="alGetString")            GetString            :: proc(param: i32) -> ^u8                                      ---;
	@(link_name="alGetBooleanv")          GetBooleanv          :: proc(param: i32, data: ^u8)                                  ---;
	@(link_name="alGetIntegerv")          GetIntegerv          :: proc(param: i32, data: ^i32)                                 ---;
	@(link_name="alGetFloatv")            GetFloatv            :: proc(param: i32, data: ^f32)                                 ---;
	@(link_name="alGetDoublev")           GetDoublev           :: proc(param: i32, data: ^f64)                                 ---;
	@(link_name="alGetBoolean")           GetBoolean           :: proc(param: i32) -> u8                                       ---;
	@(link_name="alGetInteger")           GetInteger           :: proc(param: i32) -> i32                                      ---;
	@(link_name="alGetFloat")             GetFloat             :: proc(param: i32) -> f32                                      ---;
	@(link_name="alGetDouble")            GetDouble            :: proc(param: i32) -> f64                                      ---;
	@(link_name="alGetError")             GetError             :: proc() -> i32                                                ---;
	@(link_name="alIsExtensionPresent")   IsExtensionPresent   :: proc(extname: ^u8) -> u8                                     ---;
	@(link_name="alGetProcAddress")       GetProcAddress       :: proc(fname: ^u8) -> rawptr                                   ---;
	@(link_name="alGetEnumValue")         GetEnumValue         :: proc(ename: ^u8) -> i32                                      ---;
	@(link_name="alListenerf")            Listenerf            :: proc(param: i32, value: f32)                                 ---;
	@(link_name="alListener3f")           Listener3f           :: proc(param: i32, value1, value2, value3: f32)                ---;
	@(link_name="alListenerfv")           Listenerfv           :: proc(param: i32, values: ^f32)                               ---;
	@(link_name="alListeneri")            Listeneri            :: proc(param: i32, value: i32)                                 ---;
	@(link_name="alListener3i")           Listener3i           :: proc(param: i32, value1, value2, value3: i32)                ---;
	@(link_name="alListeneriv")           Listeneriv           :: proc(param: i32, values: ^i32)                               ---;
	@(link_name="alGetListenerf")         GetListenerf         :: proc(param: i32, value: ^f32)                                ---;
	@(link_name="alGetListener3f")        GetListener3f        :: proc(param: i32, value1, value2, value3: ^f32)               ---;
	@(link_name="alGetListenerfv")        GetListenerfv        :: proc(param: i32, values: ^f32)                               ---;
	@(link_name="alGetListeneri")         GetListeneri         :: proc(param: i32, value: ^i32)                                ---;
	@(link_name="alGetListener3i")        GetListener3i        :: proc(param: i32, value1, value2, value3: ^i32)               ---;
	@(link_name="alGetListeneriv")        GetListeneriv        :: proc(param: i32, values: ^i32)                               ---;
	@(link_name="alGenSources")           GenSources           :: proc(n: i32, sources: ^u32)                                  ---;
	@(link_name="alDeleteSources")        DeleteSources        :: proc(n: i32, sources: ^u32)                                  ---;
	@(link_name="alIsSource")             IsSource             :: proc(sid: u32) -> u8                                         ---;
	@(link_name="alSourcef")              Sourcef              :: proc(sid: u32, param: i32, value: f32)                       ---;
	@(link_name="alSource3f")             Source3f             :: proc(sid: u32, param: i32, value1, value2, value3: f32)      ---;
	@(link_name="alSourcefv")             Sourcefv             :: proc(sid: u32, param: i32, values: ^f32)                     ---;
	@(link_name="alSourcei")              Sourcei              :: proc(sid: u32, param: i32, value: i32)                       ---;
	@(link_name="alSource3i")             Source3i             :: proc(sid: u32, param: i32, value1, value2, value3: i32)      ---;
	@(link_name="alSourceiv")             Sourceiv             :: proc(sid: u32, param: i32, values: ^i32)                     ---;
	@(link_name="alGetSourcef")           GetSourcef           :: proc(sid: u32, param: i32, value: ^f32)                      ---;
	@(link_name="alGetSource3f")          GetSource3f          :: proc(sid: u32, param: i32, value1, value2, value3: ^f32)     ---;
	@(link_name="alGetSourcefv")          GetSourcefv          :: proc(sid: u32, param: i32, values: ^f32)                     ---;
	@(link_name="alGetSourcei")           GetSourcei           :: proc(sid: u32, param: i32, value: ^i32)                      ---;
	@(link_name="alGetSource3i")          GetSource3i          :: proc(sid: u32, param: i32, value1, value2, value3: ^i32)     ---;
	@(link_name="alGetSourceiv")          GetSourceiv          :: proc(sid: u32, param: i32, values: ^i32)                     ---;
	@(link_name="alSourcePlayv")          SourcePlayv          :: proc(ns: i32, sids: ^u32)                                    ---;
	@(link_name="alSourceStopv")          SourceStopv          :: proc(ns: i32, sids: ^u32)                                    ---;
	@(link_name="alSourceRewindv")        SourceRewindv        :: proc(ns: i32, sids: ^u32)                                    ---;
	@(link_name="alSourcePausev")         SourcePausev         :: proc(ns: i32, sids: ^u32)                                    ---;
	@(link_name="alSourcePlay")           SourcePlay           :: proc(sid: u32)                                               ---;
	@(link_name="alSourceStop")           SourceStop           :: proc(sid: u32)                                               ---;
	@(link_name="alSourceRewind")         SourceRewind         :: proc(sid: u32)                                               ---;
	@(link_name="alSourcePause")          SourcePause          :: proc(sid: u32)                                               ---;
	@(link_name="alSourceQueueBuffers")   SourceQueueBuffers   :: proc(sid: u32,numEntries: i32, bids: ^u32)                   ---;
	@(link_name="alSourceUnqueueBuffers") SourceUnqueueBuffers :: proc(sid: u32,numEntries: i32, bids: ^u32)                   ---;
	@(link_name="alGenBuffers")           GenBuffers           :: proc(n: i32, buffers: ^u32)                                  ---;
	@(link_name="alDeleteBuffers")        DeleteBuffers        :: proc(n: i32, buffers: ^u32)                                  ---;
	@(link_name="alIsBuffer")             IsBuffer             :: proc(bid: u32) -> u8                                         ---;
	@(link_name="alBufferData")           BufferData           :: proc(bid: u32, format: i32, data: ^u8, size: i32, freq: i32) ---;
	@(link_name="alBufferf")              Bufferf              :: proc(bid: u32,param: i32, value: f32)                        ---;
	@(link_name="alBuffer3f")             Buffer3f             :: proc(bid: u32,param: i32, value1, value2, value3: f32)       ---;
	@(link_name="alBufferfv")             Bufferfv             :: proc(bid: u32,param: i32, values: ^f32)                      ---;
	@(link_name="alBufferi")              Bufferi              :: proc(bid: u32,param: i32, value: i32)                        ---;
	@(link_name="alBuffer3i")             Buffer3i             :: proc(bid: u32,param: i32, value1, value2, value3: i32)       ---;
	@(link_name="alBufferiv")             Bufferiv             :: proc(bid: u32,param: i32, values: ^i32)                      ---;
	@(link_name="alGetBufferf")           GetBufferf           :: proc(bid: u32,param: i32, value: ^f32)                       ---;
	@(link_name="alGetBuffer3f")          GetBuffer3f          :: proc(bid: u32,param: i32, value1, value2, value3: ^f32)      ---;
	@(link_name="alGetBufferfv")          GetBufferfv          :: proc(bid: u32,param: i32, values: ^f32)                      ---;
	@(link_name="alGetBufferi")           GetBufferi           :: proc(bid: u32,param: i32, value: ^i32)                       ---;
	@(link_name="alGetBuffer3i")          GetBuffer3i          :: proc(bid: u32,param: i32, value1, value2, value3: ^i32)      ---;
	@(link_name="alGetBufferiv")          GetBufferiv          :: proc(bid: u32,param: i32, values: ^i32)                      ---;
	@(link_name="alDopplerFactor")        DopplerFactor        :: proc(value: f32)                                             ---;
	@(link_name="alDopplerVelocity")      DopplerVelocity      :: proc(value: f32)                                             ---;
	@(link_name="alSpeedOfSound")         SpeedOfSound         :: proc(value: f32)                                             ---;
	@(link_name="alDistanceModel")        DistanceModel        :: proc(distanceModel: i32)                                     ---;
}
