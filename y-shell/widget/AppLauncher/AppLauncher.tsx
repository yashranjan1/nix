import Gtk from "gi://Gtk?version=3.0";
import { WindowCustomProps } from "../../types/windowCustomProps";
import { createBinding, createState, With } from "ags";
import Apps from "gi://AstalApps"
import { For } from "ags";
import { BarSplitter } from "./widget/BarSplitter";
import { Astal } from "ags/gtk3";
import GObject from "gi://GObject?version=2.0";
import { setMenuState } from "../../app";

function AppButton({ app, hide }: { app: Apps.Application, hide: () => void }) {
    return <button
        class="app-button"
        onClicked={() => { hide(); app.launch() }}>
        <box>
            <icon icon={app.iconName} />
            <box valign={Gtk.Align.CENTER} vertical>
                <label
                    class="name"
                    truncate
                    xalign={0}
                    label={app.name}
                />
            </box>
        </box>
    </button>
}

function CommandView() {
    return (
        <box hexpand vexpand class={'command-view'} spacing={15}>
            <icon icon={"utilities-terminal-symbolic"} />
            <box valign={Gtk.Align.CENTER} vertical >
                <label halign={Gtk.Align.START} label={"This is the command view"} class={"command-head"} />
                <label halign={Gtk.Align.START} label={"You can use custom defined commands here"} class={"command-desc"} />
            </box>
        </box>
    )
}


export default function AppLauncher({ gdkmonitor, menuState }: WindowCustomProps) {


    const MAX_ITEMS = 5

    const apps = new Apps.Apps()
    const [text, setText] = createState("")
    const list = text(text => !text.startsWith(":") ? apps.fuzzy_query(text).slice(0, MAX_ITEMS) : [])

    const hide = (object: Gtk.Entry) => {
        setMenuState("none")
        object.text = ""
    }

    const onEnter = (object: Gtk.Entry) => {
        if (!text.get().startsWith(":")) {
            apps.fuzzy_query(text.get())?.[0].launch()
            hide(object);
        }
    }

    return (
        <window class="app-launcher"
            name={`app-launcher-${gdkmonitor.get_model()}`}
            gdkmonitor={gdkmonitor}
            exclusivity={Astal.Exclusivity.IGNORE}
            visible={menuState.as((s: string) => s === `app-launcher-${gdkmonitor.get_model()}` ? true : false)}
            anchor={
                Astal.WindowAnchor.TOP
            }
            keymode={Astal.Keymode.ON_DEMAND}
        >
            <box vertical spacing={25} class={"app-launcher-box shadow"}>
                <entry
                    onNotifyText={({ text }: { text: string }) => {
                        setText(text)
                    }}
                    onActivate={self => {
                        onEnter(self)
                    }}
                    placeholderText="Search..."
                    class={"entry"}
                />

                <box spacing={6} vertical>
                    <For each={list}>
                        {(app: Apps.Application) => <AppButton app={app} hide={hide} />}
                    </For>

                    <With value={text}>
                        {(value) => {
                            if (value.startsWith(":")) {
                                if (value == ":s") return <BarSplitter />
                                return <CommandView />
                            }
                            return <box />
                        }
                        }
                    </With>
                </box>
            </box>
        </window>
    )
}
