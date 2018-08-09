package alc;

import "core:os"

when os.OS == "windows" {
	foreign import openal "OpenAL32.lib";
} else when os.OS == "linux" {
	foreign import openal "system:openal";
} else {
	#assert(false);
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

Device  :: distinct rawptr;
Context :: distinct rawptr;

@(default_calling_convention="c")
foreign openal {
	@(link_name="alcCreateContext")      create_context       :: proc(device: Device, attrlist: ^i32) -> Context                              ---;
	@(link_name="alcMakeContextCurrent") make_context_current :: proc(contex: Context ) -> u8                                                  ---;
	@(link_name="alcProcessContext")     process_context      :: proc(contex: Context)                                                         ---;
	@(link_name="alcSuspendContext")     suspend_context      :: proc(contex: Context)                                                         ---;
	@(link_name="alcDestroyContext")     destroy_context      :: proc(contex: Context)                                                         ---;
	@(link_name="alcGetCurrentContext")  get_current_context  :: proc() -> Context                                                             ---;
	@(link_name="alcGetContextsDevice")  get_contexts_device  :: proc(contex: Context) -> Device                                              ---;
	@(link_name="alcOpenDevice")         open_device          :: proc(devicename: cstring) -> Device                                               ---;
	@(link_name="alcCloseDevice")        close_device         :: proc(device: Device) -> u8                                                    ---;
	@(link_name="alcGetError")           get_error            :: proc(device: Device) -> i32                                                   ---;
	@(link_name="alcIsExtensionPresent") is_extension_present :: proc(device: Device, extname: cstring) -> u8                                      ---;
	@(link_name="alcGetProcAddress")     get_proc_address     :: proc(device: Device, funcname: cstring) -> rawptr                                 ---;
	@(link_name="alcGetEnumValue")       get_enum_value       :: proc(device: Device, enumname: cstring) -> i32                                    ---;
	@(link_name="alcGetString")          get_string           :: proc(device: Device, param: i32) -> cstring                                       ---;
	@(link_name="alcGetIntegerv")        get_integerv         :: proc(device: Device, param: i32, size: i32, data: ^i32)                       ---;
	@(link_name="alcCaptureOpenDevice")  capture_open_device  :: proc(devicename: cstring, frequency: u32, format: i32, buffersize: i32) -> Device ---;
	@(link_name="alcCaptureCloseDevice") capture_close_device :: proc(device: Device) -> u8                                                    ---;
	@(link_name="alcCaptureStart")       capture_start        :: proc(device: Device)                                                          ---;
	@(link_name="alcCaptureStop")        capture_stop         :: proc(device: Device)                                                          ---;
	@(link_name="alcCaptureSamples")     capture_samples      :: proc(device: Device, buffer: ^u8, samples: i32)                               ---;
}
