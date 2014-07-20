/*
 * Copyright (C) 2014 Canonical, Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.2
import Ubuntu.Components 1.1
import Ubuntu.Components.Popups 1.0 as Popups

Popups.Dialog {
    width: units.gu(40)
    height: units.gu(71)

    signal canceled()
    signal accepted()
    title: i18n.tr("You have no contacts.")
    text: i18n.tr("Would you like to sync contacts\nfrom online accounts now?")
    Button {
        objectName: "onlineAccountsDialog.yesButton"
        anchors {
            left: parent.left
            right: parent.right
            margins: units.gu(1)
        }
        text: i18n.tr("Yes")
        onClicked: accepted()
    }

    Button {
        objectName: "onlineAccountsDialog.noButton"
        anchors {
            left: parent.left
            right: parent.right
            margins: units.gu(1)
        }
        gradient: UbuntuColors.greyGradient
        text: i18n.tr("No")
        onClicked: canceled()
    }
}
