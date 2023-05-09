" For (neo)vim using ExRC https://github.com/ii14/exrc.vim
" commands defined in your vimrc should check for the existence
" of these hooks and call them if so

let s:projectroot = expand('<sfile>:p:h')

fu! StartsWith(longer, shorter) abort
  return a:longer[0:len(a:shorter)-1] ==# a:shorter
endfunction

fu! Project_Local_Config_Applies() abort
  let current_file = expand('%:p')
  return StartsWith(current_file, s:projectroot)
endfunction

fu! Local_CompileFile() abort
  call AbeCompile()
endfunction

" for example, my build.vim config says:
" fu! Compile(file) abort
"   if exists ('*Project_Local_Config_Applies')
"     if Project_Local_Config_Applies()
"       if exists ('*Local_CompileFile')
"         call Local_CompileFile()
"         return
"       endif
"     endif
"   endif
"   " fallback, try using compile_commands.json
"   if filereadable("compile_commands.json")
"     silent execute '!' . GetCompileCommand(a:file)
"   else
"     echom "Add Local_CompileFile function to .exrc to tell me how to compile!"
"   endif
" endfunction
