TEMPLATE = subdirs

SUBDIRS += \
    backend

OTHER_FILES += $$system(find app -type f)

check.target = check
check.commands = cd backend; qmake; make; make check; cd ../app; make check
check.depends = backend
QMAKE_EXTRA_TARGETS += check
