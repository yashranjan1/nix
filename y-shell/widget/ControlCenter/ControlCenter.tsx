import app from "ags/gtk3/app"
import { WindowCustomProps } from "../../types/windowCustomProps";
import ProfileCard from "./widget/ProfileCard";
import QuickMenu from "./widget/QuickMenu";
import AudioSliders from "./widget/AudioSliders";
import Options from "./widget/Options";
import MprisPlayers from "./widget/MprisPlayers";
import Astal from "gi://Astal?version=3.0";

export default function ControlCenter({ gdkmonitor, menuState }: WindowCustomProps) {
    return (
        <window class="ControlCenter"
            name={`control-center-${gdkmonitor.get_model()}`}
            gdkmonitor={gdkmonitor}
            exclusivity={Astal.Exclusivity.NORMAL}
            anchor={Astal.WindowAnchor.TOP |
                Astal.WindowAnchor.RIGHT}
            visible={menuState.as(s => s === `control-center-button-${gdkmonitor.get_model()}` ? true : false)}
            application={app}
        >

            <box
                class={"control-center-box shadow"}
                vertical
                spacing={10}
                vexpand={true}
            >
                <box>
                    <ProfileCard />
                    <QuickMenu />
                </box>
                <box class="audio-slider-container">
                    <AudioSliders menuState={menuState} gdkmonitor={gdkmonitor} />
                </box>
                <box>
                    <Options menuState={menuState} gdkmonitor={gdkmonitor} />
                </box>
                <box vexpand={true}>
                    <MprisPlayers />
                </box>
            </box>
        </window>
    )
}
