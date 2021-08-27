syntax keyword CustomPrimitives u8 u16 u32 u64  s8 s16 s32 s64  f32 f64  b32  usz uptr  sptr
highlight link CustomPrimitives cType

syntax keyword CustomStorageClass internal global
highlight link CustomStorageClass cStorageClass

syntax match CustomStruct "\<[A-Z]\+[A-Z_]*[a-z]\+[A-Za-z0-9_]*\>"
highlight link CustomStruct cType

syn match CustomEndsWithT  "\<[a-zA-Z_]\+[a-zA-Z0-9_]*_[t]\>"
highlight link CustomEndsWithT cType

syn keyword CustomMacros assert
highlight link CustomMacros cPreProc

syn match CustomMacroAllCaps "\<[A-Z]\+[A-Z0-9_]*\>"
highlight link CustomMacroAllCaps cPreProc


syn match CustomFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cParen,cCppParen
highlight link CustomFunction Function

