import QtQuick 1.0

XmlListModel {
    id: timerModel
    property bool busy: status == XmlListModel.Loading
    // contains only a subset of the timer data, the ones needed to list and change them
    source: engine.activeProfileUrl + "/web/timerlist"
    query: "/e2timerlist/e2timer"
    XmlRole {name: "serviceId"; query: "e2servicereference/string()"}
    XmlRole {name: "serviceName"; query: "e2servicename/string()"}
    XmlRole {name: "eit"; query: "e2eit/string()"}
    XmlRole {name: "name"; query: "e2name/string()"}
    XmlRole {name: "info"; query: "e2description/string()"}
    XmlRole {name: "disabled"; query: "e2disabled/string()"}
    XmlRole {name: "begins"; query: "e2timebegin/string()"}
    XmlRole {name: "ends"; query: "e2timeend/string()"}
    XmlRole {name: "duration"; query: "e2duration/string()"}
    XmlRole {name: "startPrepare"; query: "e2startprepare/string()"}
    XmlRole {name: "justplay"; query: "e2justplay/string()"}
    XmlRole {name: "afterEvent"; query: "e2afterevent/string()"}
    XmlRole {name: "location"; query: "e2location/string()"}
    XmlRole {name: "timerState"; query: "e2state/string()"}
    XmlRole {name: "repeated"; query: "e2repeated/string()"}

    function getList()
    {
        source = engine.activeProfileUrl + "/web/timerlist"
    }
}
