# Vala Graphic Library

## [The Documentation is here: Click on me](https://hydrasho.gitlab.io/vgl)

# how install it ?


### meson.build

create your project directory and add the [vgl.wrap](https://gitlab.com/hydrasho/vgl/-/raw/master/vgl.wrap) download

```
project/
- meson.build
- main.vala
- subprojects
- subprojects/vgl.wrap
```

init your meson build (meson.build init main.vala -d vgl)

your meson.build should look like this:

```meson
project('project-name', ['c', 'vala'])

executable('exe_name',
           'main.vala',
           dependencies: [dependency('vgl')],
           install : true)
```

```bash
meson build
ninja -C build
./build/exe_name
```
