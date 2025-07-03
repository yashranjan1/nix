import { WindowCustomProps } from "../../types/windowCustomProps";
import Network from "gi://AstalNetwork"
import WifiOption from "./widget/WifiOption";
import { createBinding, createState, For } from "ags";
import { Astal } from "ags/gtk3";
import { setMenuState } from "../../app";

export default function WifiMenu({ gdkmonitor, menuState }: WindowCustomProps) {

    const { wifi } = Network.get_default()

    const [spin, setSpin] = createState(false)

    const accessPoints = createBinding(wifi, "accessPoints").as(aps => aps.sort((a, b) => b.strength - a.strength))

    return (
        <window
            class="wifi-menu"
            name={`wifi-menu-${gdkmonitor.get_model()}`}
            gdkmonitor={gdkmonitor}
            exclusivity={Astal.Exclusivity.NORMAL}
            anchor={Astal.WindowAnchor.TOP |
                Astal.WindowAnchor.RIGHT}
            visible={menuState.as(s => s === `control-center-button-${gdkmonitor.get_model()}-wifi` ? true : false)}
        >
            <box class="wifi-menu-box shadow" vexpand>
                <box vertical spacing={10}>
                    <box class={"wifi-menu-header"} spacing={10}>
                        <button
                            onClick={() => {
                                setMenuState(`control-center-button-${gdkmonitor.get_model()}`)
                            }}
                        >
                            <icon icon="go-previous-symbolic" />
                        </button>
                        <label label={"Wifi Menu"} xalign={0} hexpand />
                        <button
                            onClick={async () => {
                                wifi.scan()
                                setSpin(true)
                                setTimeout(() => {
                                    setSpin(false)
                                }, 5000)
                            }}

                        >
                            <icon icon="rotation-allowed-symbolic" class={spin.as(s => s ? "spinner" : "")} />
                        </button>
                        <button
                            onClick={() => {
                                setMenuState("none")
                            }}
                        >
                            <icon icon="window-close-symbolic" />
                        </button>
                    </box>
                    <scrollable heightRequest={450} minContentWidth={300}>
                        <box vertical spacing={10} >
                            <For each={accessPoints}>
                                {ap => {
                                    if (ap.get_ssid() !== null) {
                                        return <WifiOption ap={ap} menuState={menuState} gdkmonitor={gdkmonitor} />
                                    }
                                    else {

                                        return <label visible={false} />
                                    }
                                }}
                            </For>
                        </box>
                    </scrollable>
                </box>
            </box>
        </window>
    )
}
