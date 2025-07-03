import { Gtk } from "ags/gtk3"
import Astal from "gi://Astal?version=3.0"
import Notifd from "gi://AstalNotifd"
import GLib from "gi://GLib?version=2.0"

const isIcon = (icon: string) =>
    !!Astal.Icon.lookup_icon(icon)

const fileExists = (path: string) =>
    GLib.file_test(path, GLib.FileTest.EXISTS)

const time = (time: number, format = "%H:%M") => GLib.DateTime
    .new_from_unix_local(time)
    .format(format)!

const urgency = (n: Notifd.Notification) => {
    const { LOW, NORMAL, CRITICAL } = Notifd.Urgency
    // match operator when?
    switch (n.urgency) {
        case LOW: return "low"
        case CRITICAL: return "critical"
        case NORMAL:
        default: return "normal"
    }
}
type NotifType = "stack" | "popup"

type Props = {
    setup(self: Astal.EventBox): void
    onHoverLost(self: Astal.EventBox): void
    notification: Notifd.Notification
    notifType: NotifType
}

export default function Notification(props: Props) {
    const { notification: n, onHoverLost, setup, notifType } = props
    const { START, CENTER, END } = Gtk.Align

    return <eventbox
        class={`Notification ${urgency(n)}`}
        $={setup}
        onHoverLost={onHoverLost}>
        <box vertical class={notifType === "popup" ? "shadow popup" : "stack"}>
            <box class="header">
                {(n.appIcon || n.desktopEntry) && <icon
                    class="app-icon"
                    visible={Boolean(n.appIcon || n.desktopEntry)}
                    icon={n.appIcon || n.desktopEntry}
                />}
                <label
                    class="app-name"
                    halign={START}
                    truncate
                    label={n.appName || "Unknown"}
                />
                <label
                    class="time"
                    hexpand
                    halign={END}
                    label={time(n.time)}
                />
                <button onClicked={() => n.dismiss()} class={notifType === "popup" ? "close-notif-button-popup" : "close-notif-button-stack"}>
                    <icon icon="window-close-symbolic" />
                </button>
            </box>
            <Gtk.Separator visible />
            <box class="content">
                {n.image && fileExists(n.image) && <box
                    valign={START}
                    class="image"
                    css={`background-image: url('${n.image}')`}
                />}
                {n.image && isIcon(n.image) && <box
                    expand={false}
                    valign={START}
                    class="icon-image">
                    <icon icon={n.image} expand halign={CENTER} valign={CENTER} />
                </box>}
                <box vertical>
                    <label
                        class="summary"
                        halign={START}
                        xalign={0}
                        label={n.summary}
                        truncate
                    />
                    {n.body && <label
                        class="body"
                        wrap
                        truncate
                        useMarkup
                        halign={START}
                        xalign={0}
                        label={n.body}
                    />}
                </box>
            </box>
            {n.get_actions().length > 0 && <box class="actions">
                {n.get_actions().map(({ label, id }) => (
                    <button
                        hexpand
                        onClicked={() => n.invoke(id)}>
                        <label label={label} halign={CENTER} hexpand />
                    </button>
                ))}
            </box>}
        </box>
    </eventbox>
}
