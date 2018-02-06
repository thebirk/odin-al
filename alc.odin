when ODIN_OS == "windows" {
	foreign import openal "OpenAL32.lib";
} else when ODIN_OS == "linux" {
	foreign import openal "system:openal";
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

Device  :: struct {};
Context :: struct {};

@(default_calling_convention="c")
foreign openal {
	@(link_name="alcCreateContext")      CreateContext      :: proc(device: ^Device, attrlist: ^i32) -> ^Context                              ---;
	@(link_name="alcMakeContextCurrent") MakeContextCurrent :: proc(contex: ^Context ) -> u8                                                  ---;
	@(link_name="alcProcessContext")     ProcessContext     :: proc(contex: ^Context)                                                         ---;
	@(link_name="alcSuspendContext")     SuspendContext     :: proc(contex: ^Context)                                                         ---;
	@(link_name="alcDestroyContext")     DestroyContext     :: proc(contex: ^Context)                                                         ---;
	@(link_name="alcGetCurrentContext")  GetCurrentContext  :: proc() -> ^Context                                                             ---;
	@(link_name="alcGetContextsDevice")  GetContextsDevice  :: proc(contex: ^Context) -> ^Device                                              ---;
	@(link_name="alcOpenDevice")         OpenDevice         :: proc(devicename: ^u8) -> ^Device                                               ---;
	@(link_name="alcCloseDevice")        CloseDevice        :: proc(device: ^Device) -> u8                                                    ---;
	@(link_name="alcGetError")           GetError           :: proc(device: ^Device) -> i32                                                   ---;
	@(link_name="alcIsExtensionPresent") IsExtensionPresent :: proc(device: ^Device, extname: ^u8) -> u8                                      ---;
	@(link_name="alcGetProcAddress")     GetProcAddress     :: proc(device: ^Device, funcname: ^u8) -> rawptr                                 ---;
	@(link_name="alcGetEnumValue")       GetEnumValue       :: proc(device: ^Device, enumname: ^u8) -> i32                                    ---;
	@(link_name="alcGetString")          GetString          :: proc(device: ^Device, param: i32) -> ^u8                                       ---;
	@(link_name="alcGetIntegerv")        GetIntegerv        :: proc(device: ^Device, param: i32, size: i32, data: ^i32)                       ---;
	@(link_name="alcCaptureOpenDevice")  CaptureOpenDevice  :: proc(devicename: ^u8, frequency: u32, format: i32, buffersize: i32) -> ^Device ---;
	@(link_name="alcCaptureCloseDevice") CaptureCloseDevice :: proc(device: ^Device) -> u8                                                    ---;
	@(link_name="alcCaptureStart")       CaptureStart       :: proc(device: ^Device)                                                          ---;
	@(link_name="alcCaptureStop")        CaptureStop        :: proc(device: ^Device)                                                          ---;
	@(link_name="alcCaptureSamples")     CaptureSamples     :: proc(device: ^Device, buffer: ^u8, samples: i32)                               ---;
}
