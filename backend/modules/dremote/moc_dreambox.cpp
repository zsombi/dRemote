/****************************************************************************
** Meta object code from reading C++ file 'dreambox.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.0.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "dreambox.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'dreambox.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.0.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_Profile_t {
    QByteArrayData data[1];
    char stringdata[9];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_Profile_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_Profile_t qt_meta_stringdata_Profile = {
    {
QT_MOC_LITERAL(0, 0, 7)
    },
    "Profile\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Profile[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

void Profile::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObject Profile::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Profile.data,
      qt_meta_data_Profile,  qt_static_metacall, 0, 0}
};


const QMetaObject *Profile::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Profile::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Profile.stringdata))
        return static_cast<void*>(const_cast< Profile*>(this));
    return QObject::qt_metacast(_clname);
}

int Profile::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
struct qt_meta_stringdata_Dreambox_t {
    QByteArrayData data[18];
    char stringdata[201];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    offsetof(qt_meta_stringdata_Dreambox_t, stringdata) + ofs \
        - idx * sizeof(QByteArrayData) \
    )
static const qt_meta_stringdata_Dreambox_t qt_meta_stringdata_Dreambox = {
    {
QT_MOC_LITERAL(0, 0, 8),
QT_MOC_LITERAL(1, 9, 15),
QT_MOC_LITERAL(2, 25, 0),
QT_MOC_LITERAL(3, 26, 14),
QT_MOC_LITERAL(4, 41, 15),
QT_MOC_LITERAL(5, 57, 15),
QT_MOC_LITERAL(6, 73, 10),
QT_MOC_LITERAL(7, 84, 7),
QT_MOC_LITERAL(8, 92, 13),
QT_MOC_LITERAL(9, 106, 4),
QT_MOC_LITERAL(10, 111, 14),
QT_MOC_LITERAL(11, 126, 10),
QT_MOC_LITERAL(12, 137, 8),
QT_MOC_LITERAL(13, 146, 10),
QT_MOC_LITERAL(14, 157, 11),
QT_MOC_LITERAL(15, 169, 12),
QT_MOC_LITERAL(16, 182, 8),
QT_MOC_LITERAL(17, 191, 8)
    },
    "Dreambox\0firstRunChanged\0\0profileChanged\0"
    "profilesChanged\0settingsChanged\0"
    "addProfile\0profile\0removeProfile\0name\0"
    "getProfileData\0initialize\0firstRun\0"
    "profileUrl\0profileData\0profileIndex\0"
    "profiles\0settings\0"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Dreambox[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       7,   68, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   54,    2, 0x05,
       3,    0,   55,    2, 0x05,
       4,    0,   56,    2, 0x05,
       5,    0,   57,    2, 0x05,

 // slots: name, argc, parameters, tag, flags
       6,    1,   58,    2, 0x0a,
       8,    1,   61,    2, 0x0a,
      10,    1,   64,    2, 0x0a,
      11,    0,   67,    2, 0x08,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Bool, QMetaType::QJsonObject,    7,
    QMetaType::Bool, QMetaType::QString,    9,
    QMetaType::QJsonObject, QMetaType::QString,    9,
    QMetaType::Void,

 // properties: name, type, flags
      12, QMetaType::Bool, 0x00495001,
       7, QMetaType::QString, 0x00495103,
      13, QMetaType::QUrl, 0x00495001,
      14, QMetaType::QJsonObject, 0x00495001,
      15, QMetaType::Int, 0x00495001,
      16, QMetaType::QStringList, 0x00495001,
      17, QMetaType::QJsonObject, 0x00495103,

 // properties: notify_signal_id
       0,
       1,
       1,
       1,
       1,
       2,
       3,

       0        // eod
};

void Dreambox::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Dreambox *_t = static_cast<Dreambox *>(_o);
        switch (_id) {
        case 0: _t->firstRunChanged(); break;
        case 1: _t->profileChanged(); break;
        case 2: _t->profilesChanged(); break;
        case 3: _t->settingsChanged(); break;
        case 4: { bool _r = _t->addProfile((*reinterpret_cast< const QJsonObject(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 5: { bool _r = _t->removeProfile((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 6: { QJsonObject _r = _t->getProfileData((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QJsonObject*>(_a[0]) = _r; }  break;
        case 7: _t->initialize(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (Dreambox::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Dreambox::firstRunChanged)) {
                *result = 0;
            }
        }
        {
            typedef void (Dreambox::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Dreambox::profileChanged)) {
                *result = 1;
            }
        }
        {
            typedef void (Dreambox::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Dreambox::profilesChanged)) {
                *result = 2;
            }
        }
        {
            typedef void (Dreambox::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Dreambox::settingsChanged)) {
                *result = 3;
            }
        }
    }
}

const QMetaObject Dreambox::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Dreambox.data,
      qt_meta_data_Dreambox,  qt_static_metacall, 0, 0}
};


const QMetaObject *Dreambox::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Dreambox::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Dreambox.stringdata))
        return static_cast<void*>(const_cast< Dreambox*>(this));
    return QObject::qt_metacast(_clname);
}

int Dreambox::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 8;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = firstRun(); break;
        case 1: *reinterpret_cast< QString*>(_v) = profile(); break;
        case 2: *reinterpret_cast< QUrl*>(_v) = profileUrl(); break;
        case 3: *reinterpret_cast< QJsonObject*>(_v) = profileData(); break;
        case 4: *reinterpret_cast< int*>(_v) = profileIndex(); break;
        case 5: *reinterpret_cast< QStringList*>(_v) = profiles(); break;
        case 6: *reinterpret_cast< QJsonObject*>(_v) = settings(); break;
        }
        _id -= 7;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 1: setProfile(*reinterpret_cast< QString*>(_v)); break;
        case 6: setSettings(*reinterpret_cast< QJsonObject*>(_v)); break;
        }
        _id -= 7;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 7;
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Dreambox::firstRunChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void Dreambox::profileChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void Dreambox::profilesChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void Dreambox::settingsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, 0);
}
QT_END_MOC_NAMESPACE
