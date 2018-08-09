# odin-al
OpenAL binding for Odin

Linux and windows support.
On Linux it finds the shared library
On windows you need to have OpenAL32.lib inside this repo

I recommend cloning this repo into Odin's shared collection
```bash
cd Odin/shared
git clone https://github.com/thebirk/odin-al.git
```

And then include it using

```go
import "shared:odin-al/al"
import "shared:odin-al/alc"
```
