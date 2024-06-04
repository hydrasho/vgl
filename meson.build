project('new_vgl', ['c', 'vala'],
  version : '3.0',
  default_options : ['warning_level=3'])

dep_vala_lib = [
  meson.get_compiler('c').find_library('m'),
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('sdl2'),
  dependency('cairo'),
  dependency('gio-2.0')
]

lib_vgl = library('vgl-3.0',
  'Texture.vala',
  'Types.vala',
  'Sprite.vala',
  'RenderTarget.vala',
  'RenderTexture.vala',
  'Drawable.vala',
  'Transformable.vala',
  'RenderWindow.vala',
  'Window.vala',
  'IWindow.vala',
  'Shape.vala',
  'RectangleShape.vala',
  'CircleShape.vala',
  'Text.vala',
  'Event.vala',
  c_args: '-w',
  dependencies: dep_vala_lib,
  install : true,
  install_dir : [true, true, true])


dep_vgl = declare_dependency(link_with : lib_vgl,  dependencies: dep_vala_lib, include_directories : include_directories('.'))
meson.override_dependency('vgl-3.0', dep_vgl)


pkg = import('pkgconfig')

pkg.generate(
    name : 'vgl-3.0',
    version : '3.0',
    description : 'vgl is a lib graphics for vala and C',
    libraries : lib_vgl,
    requires : ['sdl2', 'glib-2.0', 'gobject-2.0', 'gee-0.8', 'gio-2.0', 'cairo'],
)


executable ('a.out',
  'main.vala',
  c_args : '-w',
  dependencies: dep_vgl)
