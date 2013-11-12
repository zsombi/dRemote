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
.import dremote 1.0 as DBox

function epgNow(service) {
    return DBox.Dreambox.profileUrl + "/web/epgservicenow?sRef=" + service;
}

function epgNext(service) {
    return DBox.Dreambox.profileUrl + "/web/epgservicenext?sRef=" + service;
}

function epgService(service)
{
    return DBox.Dreambox.profileUrl + "/web/epgservice?sRef=" + service;
}

function epgBouquet(bouquet)
{
    return DBox.Dreambox.profileUrl + "/web/epgbouquet?bRef=" + bouquet;
}

function similarEvent(service, event)
{
    return DBox.Dreambox.profileUrl + "/web/epgsimilar?sRef=" + service + "&eventid=" + event;
}

function epgSearch(item)
{
    return DBox.Dreambox.profileUrl + "/web/epgsearch?search=" + item;
}
