project('new_vgl', ['c', 'vala'],
  version : '0.1',
  default_options : ['warning_level=3'])

executable('new_vgl',
           'Texture.vala',
           'Types.vala',
           'Sprite.vala',
           'RenderTarget.vala',
           'Drawable.vala',
           'main.vala',
           'Transformable.vala',
           'RenderWindow.vala',
           c_args: '-w',
           dependencies : [
              dependency('glib-2.0'),
              dependency('gobject-2.0'),
              dependency('sdl2'),
              dependency('gio-2.0')],
           install : true)
