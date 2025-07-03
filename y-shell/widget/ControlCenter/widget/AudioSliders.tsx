import Wp from "gi://AstalWp"
import { WindowCustomProps } from "../../../types/windowCustomProps"
import { setMenuState } from "../../../app"
import { createBinding } from "ags"

export default function AudioSliders({ gdkmonitor, menuState }: WindowCustomProps) {
    const speaker = Wp.get_default()?.audio.defaultSpeaker!
    const mic = Wp.get_default()?.audio.defaultMicrophone!

    return (
        <box vertical>
            <box class="audio-slider" css="min-width: 140px">
                <button onClick={() => setMenuState(`control-center-button-${gdkmonitor.get_model()}-volume`)}>
                    <icon icon={createBinding(speaker, "volumeIcon")} />
                </button>
                <slider
                    hexpand
                    onDragged={({ value }) => speaker.volume = value}
                    value={createBinding(speaker, "volume")}
                />
            </box>
            <box class="audio-slider" css="min-width: 140px; margin-top: 20px">
                <button onClick={() => mic.get_mute() ? mic.set_mute(false) : mic.set_mute(true)}>
                    <icon icon={createBinding(mic, "volumeIcon")} />
                </button>
                <slider
                    hexpand
                    onDragged={({ value }) => mic.volume = value}
                    value={createBinding(mic, "volume")}
                />
            </box>
        </box>
    )
}
