import Gtk from "gi://Gtk?version=3.0"
import Notifd from "gi://AstalNotifd"
import Notification from "./widget/Notification"
import { createState } from "ags"
import { timeout } from "ags/time"

type NotifType = "stack" | "popup"

export function useNotifs({ hide, notifType }: {
    hide: boolean
    notifType: NotifType
}) {
    const TIMEOUT_DELAY = 10000
    const map = new Map<number, Gtk.Widget>()
    const [widgets, setWidgets] = createState<Gtk.Widget[]>([])

    const updateList = () => {
        setWidgets([...map.values()].reverse())
    }

    const addNotification = (id: number, notif: Gtk.Widget) => {
        map.get(id)?.destroy()
        map.set(id, notif)
        updateList()
    }

    const removeNotification = (id: number) => {
        map.get(id)?.destroy()
        map.delete(id)
        updateList()
    }

    const notifd = Notifd.get_default()

    notifd.connect("notified", (_, id) => {
        const notif = Notification({
            notification: notifd.get_notification(id)!,
            onHoverLost: () => { },
            setup: () => timeout(TIMEOUT_DELAY, () => {
                if (hide)
                    removeNotification(id)
            }),
            notifType: notifType
        })

        addNotification(id, notif as Gtk.Widget)
    })

    notifd.connect("resolved", (_, id) => {
        removeNotification(id)
    })

    return widgets
}
