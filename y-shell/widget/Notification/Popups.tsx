import { For } from "ags"
import { Astal, Gdk } from "ags/gtk3"
import { useNotifs } from "./useNotifs"


export default function Popups(gdkmonitor: Gdk.Monitor) {
    const { TOP, RIGHT } = Astal.WindowAnchor
    const notifs = useNotifs({
        hide: true,
        notifType: "popup"
    })

    return <window
        class="NotificationPopups"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | RIGHT}>
        <box vertical>
            <For each={notifs}>
                {notif => notif}
            </For>
        </box>
    </window>
}
