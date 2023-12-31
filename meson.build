project('burger', ['c', 'vala'], version : '3.0', default_options : ['warning_level=3'])
add_project_arguments('--enable-experimental', language: 'vala')

subdir('src')
vapi_dir = meson.current_source_dir() / 'vapi'
add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

dep_vala = [
  dependency('sdl2'),
  dependency('glib-2.0'),
  dependency('gobject-2.0')
]

burger_lib = library('burger',
  src_vala,
  vala_header: 'burger.h',
  vala_vapi: 'burger.vapi',
  dependencies : dep_vala,
  install : true,
  install_dir: [true, true, true])

pkg = import('pkgconfig')

pkg.generate(
    name : 'burger',
    version : '3.0',
    description : 'burger is a lib graphics for vala and C',
    libraries : burger_lib,
    requires : ['sdl2', 'glib-2.0', 'gobject-2.0'],
)

libburger_dep = declare_dependency(link_with : burger_lib,  dependencies: dep_vala, include_directories : include_directories('.'))
meson.override_dependency('burger', libburger_dep)
