import { Gtk } from "ags/gtk3"
import { exec } from "ags/process"
import { createPoll } from "ags/time"

const uptime = createPoll("", 60000, () => exec("cat /proc/uptime"))

export default function ProfileCard() {

    const userName = exec('whoami')

    return (
        <box hexpand={true}>
            <box class="profile-image" />
            <box vertical
                class=""
                valign={Gtk.Align.CENTER}
            >
                <label label={userName} halign={Gtk.Align.START} />
                <label label={uptime.as(t => {
                    const time = Number.parseInt(t.split(".")[0]) / 60

                    const h = Math.floor(time / 60)
                    const m = Math.floor(time % 60)
                    return `${h}h ${m < 10 ? "0" + m : m}m`
                })} />
            </box>
        </box>
    )
}
