import { Gtk } from "ags/gtk3"
import { useNotifs } from "../../Notification/useNotifs"
import { For } from "ags"

export default function Stack() {
    const notifs = useNotifs({
        hide: false,
        notifType: "stack"
    })

    return <box vertical css={"padding: 10px 0;"} vexpand
        halign={Gtk.Align.CENTER}
        valign={Gtk.Align.START}
    >
        <For each={notifs}>
            {notif => notif}
        </For>
    </box>
}
