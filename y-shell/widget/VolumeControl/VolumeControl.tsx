import { WindowCustomProps } from "../../types/windowCustomProps";
import Wp from "gi://AstalWp";
import AppVolSlider from "./widget/AppVolSlider";
import { Astal } from "ags/gtk3";
import { setMenuState } from "../../app";
import { createBinding, For } from "ags";

export default function VolumeControl({ gdkmonitor, menuState }: WindowCustomProps) {

    const audio = Wp.get_default()?.audio!;
    const speaker = audio.defaultSpeaker!;

    const streams = createBinding(audio, "streams")

    return (
        <window
            class="VolumeControl"
            name={`volume-control-${gdkmonitor.get_model()}`}
            gdkmonitor={gdkmonitor}
            exclusivity={Astal.Exclusivity.NORMAL}
            anchor={Astal.WindowAnchor.TOP |
                Astal.WindowAnchor.RIGHT}
            visible={menuState.as(s => s === `control-center-button-${gdkmonitor.get_model()}-volume` ? true : false)}
        >

            <box class={"volume-control-window shadow"}
                vexpand
                vertical
                spacing={20}
            >
                <box class={"volume-control-header"} spacing={10}>
                    <button onClick={() => setMenuState(`control-center-button-${gdkmonitor.get_model()}`)}>
                        <icon icon={"go-previous-symbolic"} />
                    </button>
                    <label label={"Volume Control"} hexpand xalign={0} />
                    <button onClick={() => setMenuState(`none`)}>
                        <icon icon={"window-close-symbolic"} />
                    </button>
                </box>
                <box class={"volume-control-box"}
                    vertical
                    vexpand
                    spacing={10}
                >
                    <box class="app-vol" css="min-width: 140px">
                        <button onClick={() => speaker.get_mute() ? speaker.set_mute(false) : speaker.set_mute(true)}>
                            <icon icon={createBinding(speaker, "volumeIcon")} />
                        </button>
                        <slider
                            hexpand
                            onDragged={({ value }) => speaker.volume = value}
                            value={createBinding(speaker, "volume")}
                        />
                    </box>
                    <For each={streams}>
                        {
                            (stream => (
                                <AppVolSlider source={stream} />
                            ))
                        }
                    </For>
                </box>
            </box>

        </window>
    )
}
