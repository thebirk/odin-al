when ODIN_OS == "windows" {
	foreign_library openal "OpenAL32.lib";
} else when ODIN_OS == "linux" {
	foreign_system_library openal "openal";
} else {
	_ := compile_assert(false);
}

FALSE                            :: 0;
TRUE                             :: 1;
FREQUENCY                        :: 0x1007;
REFRESH                          :: 0x1008;
SYNC                             :: 0x1009;
MONO_SOURCES                     :: 0x1010;
STEREO_SOURCES                   :: 0x1011;
NO_ERROR                         :: FALSE;
INVALID_DEVICE                   :: 0xA001;
INVALID_CONTEXT                  :: 0xA002;
INVALID_ENUM                     :: 0xA003;
INVALID_VALUE                    :: 0xA004;
OUT_OF_MEMORY                    :: 0xA005;
DEFAULT_DEVICE_SPECIFIER         :: 0x1004;
DEVICE_SPECIFIER                 :: 0x1005;
EXTENSIONS                       :: 0x1006;
MAJOR_VERSION                    :: 0x1000;
MINOR_VERSION                    :: 0x1001;
ATTRIBUTES_SIZE                  :: 0x1002;
ALL_ATTRIBUTES                   :: 0x1003;
DEFAULT_ALL_DEVICES_SPECIFIER    :: 0x1012;
ALL_DEVICES_SPECIFIER            :: 0x1013;
CAPTURE_DEVICE_SPECIFIER         :: 0x310;
CAPTURE_DEFAULT_DEVICE_SPECIFIER :: 0x311;
CAPTURE_SAMPLES                  :: 0x312;

Device  :: struct #ordered {};
Context :: struct #ordered {};

foreign openal {
	CreateContext      :: proc(device: ^Device, attrlist: ^i32) -> ^Context                              #cc_c #link_name "alcCreateContext" ---;
	MakeContextCurrent :: proc(contex: ^Context ) -> u8                                                  #cc_c #link_name "alcMakeContextCurrent" ---;
	ProcessContext     :: proc(contex: ^Context)                                                         #cc_c #link_name "alcProcessContext" ---;
	SuspendContext     :: proc(contex: ^Context)                                                         #cc_c #link_name "alcSuspendContext" ---;
	DestroyContext     :: proc(contex: ^Context)                                                         #cc_c #link_name "alcDestroyContext" ---;
	GetCurrentContext  :: proc() -> ^Context                                                             #cc_c #link_name "alcGetCurrentContext" ---;
	GetContextsDevice  :: proc(contex: ^Context) -> ^Device                                              #cc_c #link_name "alcGetContextsDevice" ---;
	OpenDevice         :: proc(devicename: ^u8) -> ^Device                                               #cc_c #link_name "alcOpenDevice" ---;
	CloseDevice        :: proc(device: ^Device) -> u8                                                    #cc_c #link_name "alcCloseDevice" ---;
	GetError           :: proc(device: ^Device) -> i32                                                   #cc_c #link_name "alcGetError" ---;
	IsExtensionPresent :: proc(device: ^Device, extname: ^u8) -> u8                                      #cc_c #link_name "alcIsExtensionPresent" ---;
	GetProcAddress     :: proc(device: ^Device, funcname: ^u8) -> rawptr                                 #cc_c #link_name "alcGetProcAddress" ---;
	GetEnumValue       :: proc(device: ^Device, enumname: ^u8) -> i32                                    #cc_c #link_name "alcGetEnumValue" ---;
	GetString          :: proc(device: ^Device, param: i32) -> ^u8                                       #cc_c #link_name "alcGetString" ---;
	GetIntegerv        :: proc(device: ^Device, param: i32, size: i32, data: ^i32)                       #cc_c #link_name "alcGetIntegerv" ---;
	CaptureOpenDevice  :: proc(devicename: ^u8, frequency: u32, format: i32, buffersize: i32) -> ^Device #cc_c #link_name "alcCaptureOpenDevice" ---;
	CaptureCloseDevice :: proc(device: ^Device) -> u8                                                    #cc_c #link_name "alcCaptureCloseDevice" ---;
	CaptureStart       :: proc(device: ^Device)                                                          #cc_c #link_name "alcCaptureStart" ---;
	CaptureStop        :: proc(device: ^Device)                                                          #cc_c #link_name "alcCaptureStop" ---;
	CaptureSamples     :: proc(device: ^Device, buffer: ^u8, samples: i32)                               #cc_c #link_name "alcCaptureSamples" ---;
}
