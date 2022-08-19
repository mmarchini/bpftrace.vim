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
      \ while

syntax keyword bpftraceStatements
      \ break
      \ continue

syntax match bpftracePositionalParameters "\$\v<\d+>"

syntax match bpftraceMaps "@\v\w*"

syntax match bpftraceScratchVariables  "\$\v<\d*\h+\w+>"

syntax keyword bpftraceKeywords
      \ pid
      \ tid
      \ cpid
      \ numaid
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
      \ sarg0
      \ sarg1
      \ sarg2
      \ sarg3
      \ sarg4
      \ sarg5
      \ sarg6
      \ sarg7
      \ sarg8
      \ sarg9
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
      \ bswap
      \ buf
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
      \ pton
      \ join
      \ reg
      \ kaddr
      \ uaddr
      \ kptr
      \ uptr
      \ cgroup_path
      \ cgroupid
      \ print
      \ printf
      \ system
      \ exit
      \ clear
      \ zero
      \ time
      \ cat
      \ macaddr
      \ override
      \ signal
      \ sizeof
      \ strftime
      \ strncmp
      \ path
      \ unwatch
      \ skboutput

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
      \ iter
      \ kfunc
      \ kretfunc
      \ usdt
      \ watchpoint
      \ asyncwatchpoint

" From c.vim
syntax region bpftraceIncluded display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syntax match  bpftraceIncluded  display contained "<[^>]*>"
syntax match  bpftraceInclude   display "^\s*\zs\(%:\|#\)\s*include\>\s*["<]" contains=bpftraceIncluded

" From c.vim
syntax region bpftraceDefine start="^\s*\zs\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" keepend contains=ALLBUT,@cPreProcGroup,@Spell

" Decimal or octal number possibly containing underscores
syntax match bpftraceNumber "\v<\d((\d|_)*\d)?>"
" Scientifc integer
syntax match bpftraceNumber "\v<\d[eE]\d((\d|_)*\d)?>"
" Hex number
syntax match bpftraceNumber "\v<0[xX]\x+>"

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

highlight default link bpftraceStatements Statement
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
