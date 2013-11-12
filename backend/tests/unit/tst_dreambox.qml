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

import QtQuick 2.0
import QtTest 1.0
import Ubuntu.Components 0.1
import dremote 1.0

// See more details @ http://qt-project.org/doc/qt-5.0/qtquick/qml-testcase.html

// Execute tests with:
//   qmltestrunner

MainView {
    // The objects
    applicationName: "tst_dreambox"

    SignalSpy {
        id: spy
        target: Dreambox
        signalName: "profileChanged"
    }

    TestCase {
        name: "Dreambox"

        function initTestCase() {
            console.debug(">> initTestCase");
            console.debug("<< initTestCase");
        }

        function cleanupTestCase() {
            console.debug(">> cleanupTestCase");
            Dreambox.removeProfile("test1");
            Dreambox.removeProfile("test2");
            console.debug("<< cleanupTestCase");
        }

        function test_0_profile() {
            if (!Dreambox.firstRun)
                expectFail("profile", "No profile set on first run");
            compare(Dreambox.profile, "", "profile");
        }

        function test_0_profileUrl() {
            if (!Dreambox.firstRun)
                expectFail("profileUrl", "No profile set on first run");
            compare(Dreambox.profileUrl, "", "profileUrl");
        }

        function test_0_profileData() {
            if (!Dreambox.firstRun)
                expectFail("profileData", "No profile set on first run");
            compare(Dreambox.profile, "", "profileData");
        }

        function test_1_addProfile() {
            var test1 = {
                "profileName": "test1",
                "host": "www.google.com",
                "port": 12345,
                "user": "test",
                "password": "whatever"
            };
            var test2 = {
                "profileName": "test2",
                "host": "www.google.com",
                "port": 12345,
                "user": "anonimous",
                "password": "whatever"
            };
            compare(Dreambox.addProfile(test1), true, "add test1 profile");
            compare(Dreambox.addProfile(test2), true, "add test2 profile");
            compare(Dreambox.profiles.length, 2, "2 profiles added");
        }

        function test_2_activateProfile() {
            Dreambox.profile = "test1";
            spy.wait();
            compare(Dreambox.profileData.profileName, "test1", "profileName");
        }

        function test_3_updateProfile() {
            var profile = Dreambox.getProfileData("test1");
            profile.host = "www.ubuntu.com";
            compare(Dreambox.addProfile(profile), true, "update profile");
            profile = Dreambox.getProfileData("test1");
            compare(profile.host, "www.ubuntu.com", "profile updated");
        }

        function test_4_setActiveProfile() {
            Dreambox.profile = "test2";
            compare(Dreambox.profileData.host, "www.google.com");
            compare(Dreambox.profileUrl, "http://anonimous:whatever@www.google.com:12345", "url");
        }
    }
}
