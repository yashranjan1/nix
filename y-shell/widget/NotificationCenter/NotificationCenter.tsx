import Stack from "./widgets/Stack";
import { WindowCustomProps } from "../../types/windowCustomProps";
import notifd from "gi://AstalNotifd";
import { Astal } from "ags/gtk3";
import Gtk from "gi://Gtk?version=3.0";

export default function NotificationCenter({ gdkmonitor, menuState }: WindowCustomProps) {

    const notif = notifd.get_default()

    return <window
        class="NotificationCenter"
        name={`notification-center`}
        exclusivity={Astal.Exclusivity.NORMAL}
        anchor={
            Astal.WindowAnchor.TOP |
            Astal.WindowAnchor.RIGHT |
            Astal.WindowAnchor.BOTTOM
        }
        visible={menuState.as(s => s === `notification-center-${gdkmonitor.get_model()}` ? true : false)}
    >
        <box class={"notification-center-box shadow"}>
            <box hexpand>
                <box vertical hexpand>
                    <box css={"margin: 0 15px 15px;"}>
                        <label class={"notification-header"} label="Notifications" hexpand halign={Gtk.Align.START} />
                        <button
                            class={"clear-all-btn"}
                            onClicked={() => {
                                notif.get_notifications().forEach(n => {
                                    n.dismiss()
                                })
                            }}
                        >
                            <icon icon={"edit-delete-symbolic"} />
                        </button>
                    </box>
                    <scrollable hscroll={Gtk.PolicyType.NEVER} hexpand class={"notif-scroll"}>
                        <box vertical hexpand>
                            <Stack />
                        </box>
                    </scrollable>
                </box>
            </box>
        </box>
    </window>
}
