import { writeFileAsync } from "ags/file"
import { theme, split, setSplit } from "../../../variables/theme-variables"
import { splitBar } from "../../../helpers/bar"
import Gtk from "gi://Gtk?version=3.0"

export function BarSplitter() {
    const onclick = () => {
        setSplit(!split.get())
        writeFileAsync(`~/.local/share/ags-editable/currentTheme.json`, JSON.stringify({ name: theme.get(), split: split.get() }))
        splitBar(split.get())
    }

    return (
        <box hexpand vexpand class={"splitter"} spacing={15}>
            <icon icon={"top_bar-symbolic"} />
            <box hexpand valign={Gtk.Align.CENTER} vertical>
                <label halign={Gtk.Align.START} label={"Split Bar"} class={"command-head"} />
                <label halign={Gtk.Align.START} label={"Change the style of the bar"} class={"command-desc"} />
            </box>
            <box halign={Gtk.Align.END} class={'switch-box'}>
                <switch onButtonPressEvent={onclick} vexpand={false} active={split.as(s => !s)} />
            </box>
        </box>
    )
}
