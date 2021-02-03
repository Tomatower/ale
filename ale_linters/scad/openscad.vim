" Author: jotweh <jotweh@stusta.de>
" Description: TCP lsp client for OpenSCAD

call ale#Set('scad_openscad_address', '127.0.0.1:23725')
call ale#Set('scad_openscad_project_root', '.')

function! ale_linters#scad#openscad#GetProjectRoot(buffer) abort
    let l:project_root = ale#Var(a:buffer, 'scad_openscad_project_root')

    return l:project_root
endfunction

function! ale_linters#scad#openscad#GetAddress(buffer) abort
    let l:address = ale#Var(a:buffer, 'scad_openscad_address')

    return l:address
endfunction

call ale#linter#Define('scad', {
\   'name': 'openscad',
\   'lsp': 'socket',
\   'address': function('ale_linters#scad#openscad#GetAddress'),
\   'language': 'scad',
\   'project_root': function('ale_linters#scad#openscad#GetProjectRoot'),
\})
