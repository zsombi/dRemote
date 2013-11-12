import QtQuick 1.0

XmlListModel {
    property bool busy: status == XmlListModel.Loading
    property bool loading: false
    signal loaded

    query: "/e2volume"
    XmlRole { name: "result"; query: "e2result/string()" }
    XmlRole { name: "message"; query: "e2resulttext/string()" }
    XmlRole { name: "level"; query: "e2current/string()" }
    XmlRole { name: "muted"; query: "e2ismuted/string()" }
    //onSourceChanged: loading = (source != "")
    onStatusChanged: {
        if (status == XmlListModel.Ready && (errorString() == "") && loading) {
            console.debug("volume::: "+errorString())
            loaded()
            loading = false
        }
    }

    function volumeUp()
    {
        source = engine.activeProfileUrl + "/web/vol?set=up"
    }
    function volumeDown()
    {
        source = engine.activeProfileUrl + "/web/vol?set=down"
    }
    function toggleMute()
    {
        source = engine.activeProfileUrl + "/web/vol?set=mute"
    }
    function volumeSet(value)
    {
        source = engine.activeProfileUrl + "/web/vol?set=set"+value
    }
    function getStatus()
    {
        source = engine.activeProfileUrl + "/web/vol"
        loading = true
    }
}
