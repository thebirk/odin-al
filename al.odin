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

foreign openal {
	Enable               :: proc(capability: i32)                                        #cc_c #link_name "alEnable" ---;
	Disable              :: proc(capability: i32)                                        #cc_c #link_name "alDisable" ---;
	IsEnabled            :: proc(capability: i32) -> u8                                  #cc_c #link_name "alIsEnabled" ---;
	GetString            :: proc(param: i32) -> ^u8                                      #cc_c #link_name "alGetString" ---;
	GetBooleanv          :: proc(param: i32, data: ^u8)                                  #cc_c #link_name "alGetBooleanv" ---;
	GetIntegerv          :: proc(param: i32, data: ^i32)                                 #cc_c #link_name "alGetIntegerv" ---;
	GetFloatv            :: proc(param: i32, data: ^f32)                                 #cc_c #link_name "alGetFloatv" ---;
	GetDoublev           :: proc(param: i32, data: ^f64)                                 #cc_c #link_name "alGetDoublev" ---;
	GetBoolean           :: proc(param: i32) -> u8                                       #cc_c #link_name "alGetBoolean" ---;
	GetInteger           :: proc(param: i32) -> i32                                      #cc_c #link_name "alGetInteger" ---;
	GetFloat             :: proc(param: i32) -> f32                                      #cc_c #link_name "alGetFloat" ---;
	GetDouble            :: proc(param: i32) -> f64                                      #cc_c #link_name "alGetDouble" ---;
	GetError             :: proc() -> i32                                                #cc_c #link_name "alGetError" ---;
	IsExtensionPresent   :: proc(extname: ^u8) -> u8                                     #cc_c #link_name "alIsExtensionPresent" ---;
	GetProcAddress       :: proc(fname: ^u8) -> rawptr                                   #cc_c #link_name "alGetProcAddress" ---;
	GetEnumValue         :: proc(ename: ^u8) -> i32                                      #cc_c #link_name "alGetEnumValue" ---;
	Listenerf            :: proc(param: i32, value: f32)                                 #cc_c #link_name "alListenerf" ---;
	Listener3f           :: proc(param: i32, value1, value2, value3: f32)                #cc_c #link_name "alListener3f" ---;
	Listenerfv           :: proc(param: i32, values: ^f32)                               #cc_c #link_name "alListenerfv" ---;
	Listeneri            :: proc(param: i32, value: i32)                                 #cc_c #link_name "alListeneri" ---;
	Listener3i           :: proc(param: i32, value1, value2, value3: i32)                #cc_c #link_name "alListener3i" ---;
	Listeneriv           :: proc(param: i32, values: ^i32)                               #cc_c #link_name "alListeneriv" ---;
	GetListenerf         :: proc(param: i32, value: ^f32)                                #cc_c #link_name "alGetListenerf" ---;
	GetListener3f        :: proc(param: i32, value1, value2, value3: ^f32)               #cc_c #link_name "alGetListener3f" ---;
	GetListenerfv        :: proc(param: i32, values: ^f32)                               #cc_c #link_name "alGetListenerfv" ---;
	GetListeneri         :: proc(param: i32, value: ^i32)                                #cc_c #link_name "alGetListeneri" ---;
	GetListener3i        :: proc(param: i32, value1, value2, value3: ^i32)               #cc_c #link_name "alGetListener3i" ---;
	GetListeneriv        :: proc(param: i32, values: ^i32)                               #cc_c #link_name "alGetListeneriv" ---;
	GenSources           :: proc(n: i32, sources: ^u32)                                  #cc_c #link_name "alGenSources" ---;
	DeleteSources        :: proc(n: i32, sources: ^u32)                                  #cc_c #link_name "alDeleteSources" ---;
	IsSource             :: proc(sid: u32) -> u8                                         #cc_c #link_name "alIsSource" ---;
	Sourcef              :: proc(sid: u32, param: i32, value: f32)                       #cc_c #link_name "alSourcef" ---;
	Source3f             :: proc(sid: u32, param: i32, value1, value2, value3: f32)      #cc_c #link_name "alSource3f" ---;
	Sourcefv             :: proc(sid: u32, param: i32, values: ^f32)                     #cc_c #link_name "alSourcefv" ---;
	Sourcei              :: proc(sid: u32, param: i32, value: i32)                       #cc_c #link_name "alSourcei" ---;
	Source3i             :: proc(sid: u32, param: i32, value1, value2, value3: i32)      #cc_c #link_name "alSource3i" ---;
	Sourceiv             :: proc(sid: u32, param: i32, values: ^i32)                     #cc_c #link_name "alSourceiv" ---;
	GetSourcef           :: proc(sid: u32, param: i32, value: ^f32)                      #cc_c #link_name "alGetSourcef" ---;
	GetSource3f          :: proc(sid: u32, param: i32, value1, value2, value3: ^f32)     #cc_c #link_name "alGetSource3f" ---;
	GetSourcefv          :: proc(sid: u32, param: i32, values: ^f32)                     #cc_c #link_name "alGetSourcefv" ---;
	GetSourcei           :: proc(sid: u32, param: i32, value: ^i32)                      #cc_c #link_name "alGetSourcei" ---;
	GetSource3i          :: proc(sid: u32, param: i32, value1, value2, value3: ^i32)     #cc_c #link_name "alGetSource3i" ---;
	GetSourceiv          :: proc(sid: u32, param: i32, values: ^i32)                     #cc_c #link_name "alGetSourceiv" ---;
	SourcePlayv          :: proc(ns: i32, sids: ^u32)                                    #cc_c #link_name "alSourcePlayv" ---;
	SourceStopv          :: proc(ns: i32, sids: ^u32)                                    #cc_c #link_name "alSourceStopv" ---;
	SourceRewindv        :: proc(ns: i32, sids: ^u32)                                    #cc_c #link_name "alSourceRewindv" ---;
	SourcePausev         :: proc(ns: i32, sids: ^u32)                                    #cc_c #link_name "alSourcePausev" ---;
	SourcePlay           :: proc(sid: u32)                                               #cc_c #link_name "alSourcePlay" ---;
	SourceStop           :: proc(sid: u32)                                               #cc_c #link_name "alSourceStop" ---;
	SourceRewind         :: proc(sid: u32)                                               #cc_c #link_name "alSourceRewind" ---;
	SourcePause          :: proc(sid: u32)                                               #cc_c #link_name "alSourcePause" ---;
	SourceQueueBuffers   :: proc(sid: u32,numEntries: i32, bids: ^u32)                   #cc_c #link_name "alSourceQueueBuffers" ---;
	SourceUnqueueBuffers :: proc(sid: u32,numEntries: i32, bids: ^u32)                   #cc_c #link_name "alSourceUnqueueBuffers" ---;
	GenBuffers           :: proc(n: i32, buffers: ^u32)                                  #cc_c #link_name "alGenBuffers" ---;
	DeleteBuffers        :: proc(n: i32, buffers: ^u32)                                  #cc_c #link_name "alDeleteBuffers" ---;
	IsBuffer             :: proc(bid: u32) -> u8                                         #cc_c #link_name "alIsBuffer" ---;
	BufferData           :: proc(bid: u32, format: i32, data: ^u8, size: i32, freq: i32) #cc_c #link_name "alBufferData" ---;
	Bufferf              :: proc(bid: u32,param: i32, value: f32)                        #cc_c #link_name "alBufferf" ---;
	Buffer3f             :: proc(bid: u32,param: i32, value1, value2, value3: f32)       #cc_c #link_name "alBuffer3f" ---;
	Bufferfv             :: proc(bid: u32,param: i32, values: ^f32)                      #cc_c #link_name "alBufferfv" ---;
	Bufferi              :: proc(bid: u32,param: i32, value: i32)                        #cc_c #link_name "alBufferi" ---;
	Buffer3i             :: proc(bid: u32,param: i32, value1, value2, value3: i32)       #cc_c #link_name "alBuffer3i" ---;
	Bufferiv             :: proc(bid: u32,param: i32, values: ^i32)                      #cc_c #link_name "alBufferiv" ---;
	GetBufferf           :: proc(bid: u32,param: i32, value: ^f32)                       #cc_c #link_name "alGetBufferf" ---;
	GetBuffer3f          :: proc(bid: u32,param: i32, value1, value2, value3: ^f32)      #cc_c #link_name "alGetBuffer3f" ---;
	GetBufferfv          :: proc(bid: u32,param: i32, values: ^f32)                      #cc_c #link_name "alGetBufferfv" ---;
	GetBufferi           :: proc(bid: u32,param: i32, value: ^i32)                       #cc_c #link_name "alGetBufferi" ---;
	GetBuffer3i          :: proc(bid: u32,param: i32, value1, value2, value3: ^i32)      #cc_c #link_name "alGetBuffer3i" ---;
	GetBufferiv          :: proc(bid: u32,param: i32, values: ^i32)                      #cc_c #link_name "alGetBufferiv" ---;
	DopplerFactor        :: proc(value: f32)                                             #cc_c #link_name "alDopplerFactor" ---;
	DopplerVelocity      :: proc(value: f32)                                             #cc_c #link_name "alDopplerVelocity" ---;
	SpeedOfSound         :: proc(value: f32)                                             #cc_c #link_name "alSpeedOfSound" ---;
	DistanceModel        :: proc(distanceModel: i32)                                     #cc_c #link_name "alDistanceModel" ---;
}
