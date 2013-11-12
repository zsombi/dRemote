TEMPLATE = subdirs
SUBDIRS = modules/dremote

OTHER_FILES += $$system(find tests -type f)

check.target = check
check.commands = qmltestrunner -import modules# -platform ubuntu
check.depends = modules/dremote
QMAKE_EXTRA_TARGETS += check

