import app from "ags/gtk3/app";
import Astal from "gi://Astal?version=3.0";
import Gtk from "gi://Gtk?version=3.0";
import Arch from "@Bar/Logo";
import Workspaces from "@Bar/Workspaces";
import Date from "@Bar/Date";
import ControlCenter from "@Bar/ControlCenter";
import PowerMenu from "@Bar/PowerMenu";
import { WindowCustomProps } from "../../types/windowCustomProps";
import Notifications from "./widget/Notifications";
import HyprPicker from "./widget/HyprPicker";
import KeyBoardLayout from "./widget/Keyboard";

export default function Bar({ gdkmonitor, menuState }: WindowCustomProps) {
    return (
        <window
            class="Bar"
            name={`Bar-${gdkmonitor.get_model()}`}
            gdkmonitor={gdkmonitor}
            exclusivity={Astal.Exclusivity.EXCLUSIVE}
            anchor={
                Astal.WindowAnchor.TOP |
                Astal.WindowAnchor.LEFT |
                Astal.WindowAnchor.RIGHT
            }
            application={app}
        >
            <centerbox class={""}>
                <box spacing={10} $type="start">
                    <box class={"bar-item"}>
                        <Arch />
                    </box>
                    <box class={"bar-item"}>
                        <Workspaces />
                    </box>
                </box>
                <box $type="center">
                    <Date monitor={`${gdkmonitor.get_model()}`} state={menuState} />
                </box>
                <box hexpand halign={Gtk.Align.END} spacing={7} $type="end">
                    <KeyBoardLayout />
                    <HyprPicker />
                    <Notifications
                        monitor={`${gdkmonitor.get_model()}`}
                        state={menuState}
                    />
                    <ControlCenter
                        monitor={`${gdkmonitor.get_model()}`}
                        state={menuState}
                    />
                    <PowerMenu monitor={`${gdkmonitor.get_model()}`} state={menuState} />
                </box>
            </centerbox>
        </window>
    );
}
