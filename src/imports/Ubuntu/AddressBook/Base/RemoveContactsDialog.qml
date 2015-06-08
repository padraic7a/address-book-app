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
import Ubuntu.Components.Popups 1.0

Dialog {
    objectName: "removeContactsDialog"

    property var contacts: []

    signal canceled()
    signal accepted()

    function removeContacts(model)
    {
        var ids = []
        for(var i=0, iMax=contacts.length; i < iMax; i++) {
            ids.push(contacts[i].contactId)
        }
        model.removeContacts(ids)
    }

    title: {
        if (contacts.length == 0) {
            return i18n.dtr("address-book-app", "No contact selected.")
        } else if (contacts.length == 1)  {
            return contacts[0].displayLabel.label
        } else {
            return i18n.dtr("address-book-app", "Multiple contacts")
        }
    }
    text: {
        if (contacts.length == 1)  {
            return i18n.dtr("address-book-app", "Are you sure that you want to remove this contact?")
        } else {
            return i18n.dtr("address-book-app", "Are you sure that you want to remove all selected contacts?")
        }
    }

    Button {
        objectName: "removeContactsDialog.Yes"
        anchors {
            left: parent.left
            right: parent.right
            margins: units.gu(1)
        }
        text: i18n.dtr("address-book-app", "Yes")
        color: UbuntuColors.green
        onClicked: accepted()
    }

    Button {
        objectName: "removeContactsDialog.No"
        anchors {
            left: parent.left
            right: parent.right
            margins: units.gu(1)
        }
        text: i18n.dtr("address-book-app", "No")
        color: UbuntuColors.red
        onClicked: canceled()
    }
}