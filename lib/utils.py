import os
from distutils.file_util import copy_file, DistutilsFileError
from distutils.dir_util import mkpath

def copy_tree(src, dst, ignores=()):
    """Copy an entire directory tree 'src' to a new location 'dst'.

    Both 'src' and 'dst' must be directory names.  If 'src' is not a
    directory, raise DistutilsFileError.  If 'dst' does not exist, it is
    created with 'mkpath()'.  The end result of the copy is that every
    file in 'src' is copied to 'dst', and directories under 'src' are
    recursively copied to 'dst'.  Return the list of files that were
    copied or might have been copied, using their output name.
    
    Ignore any file whose name is in the "ignores" iterable.

    This is a forked version of distutils.dir_util.copy_tree, which
    did not have a way to ignore the files I wanted to ignore.
    """
    if not os.path.isdir(src):
        raise DistutilsFileError, "cannot copy tree '%s': not a directory" % src

    try:
        names = os.listdir(src)
    except os.error, (errno, errstr):
        raise DistutilsFileError, "error listing files in '%s': %s" % (src, errstr)

    mkpath(dst)

    outputs = []

    for n in names:
        if n in ignores: continue

        src_name = os.path.join(src, n)
        dst_name = os.path.join(dst, n)

#def copy_tree(src, dst, preserve_mode=1, preserve_times=1,
#              preserve_symlinks=0, update=0, verbose=1, dry_run=0):

        if os.path.islink(src_name):
            continue
        elif os.path.isdir(src_name):
            outputs.extend(copy_tree(src_name, dst_name, ignores))
        else:
            copy_file(src_name, dst_name, verbose=1)
            outputs.append(dst_name)

    return outputs
