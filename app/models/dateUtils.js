/****************************************************************************
**
**  This file is a part of Dremote.
**
**  This program is free software; you can redistribute it and/or modify
**  it under the terms of the GNU General Public License as published by
**  the Free Software Foundation; either version 2 of the License, or
**  (at your option) any later version.
**
**  This program is distributed in the hope that it will be useful,
**  but WITHOUT ANY WARRANTY; without even the implied warranty of
**  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
**  GNU General Public License for more details.
**
**  You should have received a copy of the GNU General Public License along
**  with this program.  If not, see <http://www.gnu.org/licenses/>.
**
****************************************************************************/

.pragma library
.import Ubuntu.Components 0.1 as UC

Date.prototype.formatDate = function (start, duration) {
    var st = new Date(parseInt(start)*1000);
    var et = new Date(parseInt(start)*1000 + parseInt(duration)*1000);
    var retVal;
    if (this.getDate() === st.getDate()) {
//        retVal = UC.i18n.tr("Today")+ ", " + Qt.formatDateTime(st, "h:mm AP");
        // FIXME: why I cannot access tr method???
        retVal = "Today, " + Qt.formatDateTime(st, "h:mm AP");
    } else if ((this.getDate() + 1) === st.getDate()) {
//        retVal = UC.i18n.tr("Tomorrow")+ ", " + Qt.formatDateTime(st, "h:mm AP");
        retVal = "Tomorrow, " + Qt.formatDateTime(st, "h:mm AP");
    } else {
        retVal = Qt.formatDateTime(st, "dddd, h:mm AP");
    }
    retVal += " - " + Qt.formatDateTime(et, "h:mm AP");
    return retVal;
}
