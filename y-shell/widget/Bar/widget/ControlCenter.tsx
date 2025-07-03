import Network from "gi://AstalNetwork"
import Wp from "gi://AstalWp"
import { MenuInput } from "../../../types/menuInput"
import { createBinding } from "ags"
import { setMenuState } from "../../../app"

function AudioStatus() {
    const speaker = Wp.get_default()?.audio.defaultSpeaker!

    return <icon
        class="mr-8px"
        icon={createBinding(speaker, "volumeIcon")}
    />
}

function Wifi() {
    const { wifi } = Network.get_default()

    return <icon
        class="mr-8px"
        icon={createBinding(wifi, "iconName")}
    />
}

function Wired() {
    const { wired } = Network.get_default()

    return <icon
        icon={createBinding(wired, "iconName")}
    />
}


export default function ControlCenter({ monitor, state }: MenuInput) {

    return (
        <button
            class={state.as((s => s.startsWith(`control-center-button-${monitor}`) ? "control-center-btn bar-item-active" : "control-center-btn"))}
            onClick={() => {
                if (state.get() === `control-center-button-${monitor}`) {
                    setMenuState("none")
                }
                else {
                    setMenuState(`control-center-button-${monitor}`)
                }
            }}
        >
            <box spacing={10}>
                <Wifi />
                <AudioStatus />
                <Wired />
            </box>
        </button >
    )
}
