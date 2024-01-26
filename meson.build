project('vgl', ['c', 'vala'], version : '3.0', default_options: ['optimization=3'])
add_project_arguments('--enable-experimental', '--enable-checking', '--enable-experimental-non-null', language: 'vala')

subdir('src')
vapi_dir = meson.current_source_dir() / 'vapi'
add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

dep_vala = [
  dependency('sdl2'),
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('gee-0.8'),
  dependency('cairo-gobject'),
  meson.get_compiler('c').find_library('m')
]

vgl_lib = library('vgl',
  src_vala,
  vala_header: 'vgl.h',
  vala_vapi: 'vgl.vapi',
  dependencies : dep_vala,
  install : true,
  install_dir: [true, true, true])

pkg = import('pkgconfig')

pkg.generate(
    name : 'vgl',
    version : '3.0',
    description : 'vgl is a lib graphics for vala and C',
    libraries : vgl_lib,
    requires : ['sdl2', 'glib-2.0', 'gobject-2.0', 'gee-0.8', 'cairo-gobject'],
)

libvgl_dep = declare_dependency(link_with : vgl_lib,  dependencies: dep_vala, include_directories : include_directories('.'))
meson.override_dependency('vgl', libvgl_dep)
