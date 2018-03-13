import os
import ycm_core
import os

multiview_include_dir = os.path.join(os.environ['PERCEIVE_CODE'], 'multiview/multiview/multiview_cpp/src')
flags = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-ferror-limit=10000',
    '-DNDEBUG',
    '-std=c++17',
    '-stdlib=libc++17',
    '-xc++',
    '-I', '/usr/include/c++/7.1.0',
    '-I', '/usr/include/eigen3',
    '-I', '/usr/include/jsoncpp',
    '-I', multiview_include_dir,
    ]

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', ]

def FlagsForFile( filename, **kwargs ):
    return {
        'flags': flags,
        'do_cache': True
        }

