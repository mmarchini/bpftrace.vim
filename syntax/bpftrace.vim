syntax match bpftraceShebang "\v#!.*$"

" Match TODO comments
syntax keyword bpftraceTodos TODO XXX FIXME NOTE

" Comment patterns
syntax match bpftraceComment "\v\/\/.*$"
      \ contains=bpftraceTodos oneline
syntax region bpftraceComment start="/\*" end="\*/"
      \ contains=bpftraceTodos fold


" Match language specific keywords
syntax keyword bpftraceConditionals
      \ if
      \ else

syntax keyword bpftraceRepeats
      \ unroll

syntax match bpftracePositionalParameters "\$\v<\d+>"

syntax match bpftraceMaps "@\v\w*"

syntax match bpftraceScratchVariables  "\$\v<\d*\h+\w+>"

syntax keyword bpftraceKeywords
      \ pid
      \ tid
      \ cgroup
      \ uid
      \ gid
      \ nsecs
      \ cpu
      \ comm
      \ arg0
      \ arg1
      \ arg2
      \ arg3
      \ arg4
      \ arg5
      \ arg6
      \ arg7
      \ arg8
      \ arg9
      \ retval
      \ func
      \ probe
      \ curtask
      \ rand
      \ ctx
      \ username
      \ args
      \ elapsed

syntax keyword bpftraceBuiltinFunctions
      \ kstack
      \ ustack
      \ hist
      \ lhist
      \ count
      \ sum
      \ min
      \ max
      \ avg
      \ stats
      \ delete
      \ str
      \ ksym
      \ usym
      \ ntop
      \ join
      \ reg
      \ kaddr
      \ uaddr
      \ cgroupid
      \ print
      \ printf
      \ system
      \ exit
      \ clear
      \ zero
      \ time
      \ cat

syntax keyword bpftraceProbeType
      \ BEGIN
      \ END
      \ kprobe
      \ kretprobe
      \ uprobe
      \ uretprobe
      \ tracepoint
      \ hardware
      \ software
      \ interval
      \ profile

" From c.vim
syntax region bpftraceIncluded display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syntax match  bpftraceIncluded  display contained "<[^>]*>"
syntax match  bpftraceInclude   display "^\s*\zs\(%:\|#\)\s*include\>\s*["<]" contains=bpftraceIncluded

" From c.vim
syntax region bpftraceDefine start="^\s*\zs\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" keepend contains=ALLBUT,@cPreProcGroup,@Spell

syntax match bpftraceNumber "\v<\d+>"
syntax match bpftraceNumber "\v<\d+\.\d+>"
syntax match bpftraceNumber "\v<\d*\.?\d+([Ee]-?)?\d+>"
syntax match bpftraceNumber "\v<0x\x+([Pp]-?)?\x+>"

" From c.vim
syntax  match bpftraceFormat display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlLjzt]\|ll\|hh\)\=\([aAbdiuoxXDOUfFeEgGcCsSpn]\|\[\^\=.[^]]*\]\)" contained

syntax region bpftraceString start=/"/ skip=/\\"/ end=/"/ oneline contains=bpftraceFormat,@Spell

" Set highlights
" :help group-name
highlight default link bpftraceTodos Todo
highlight default link bpftraceShebang Comment
highlight default link bpftraceComment Comment

highlight default link bpftraceString String
highlight default link bpftraceNumber Number

highlight default link bpftraceConditionals Conditional
highlight default link bpftraceRepeats Repeat
highlight default link bpftraceKeywords Keyword
highlight default link bpftracePositionalParameters Keyword
highlight default link bpftraceBuiltinFunctions Function

highlight default link bpftraceMaps Identifier
highlight default link bpftraceScratchVariables Identifier

highlight default link bpftraceProbeType StorageClass
" TODO match probe definition

highlight default link bpftraceInclude Include
highlight default link bpftraceIncluded String
highlight default link bpftraceDefine Define

" Force vim to sync at least x lines. This solves the multiline comment not
" being highlighted issue
syn sync minlines=100
