import { WindowCustomProps } from "../../types/windowCustomProps"
import Shutdown from "./widget/Shutdown"
import Restart from "./widget/Restart"
import Sleep from "./widget/Sleep"
import LogOut from "./widget/LogOut"
import { Astal } from "ags/gtk3"
import app from "ags/gtk3/app"

export default function PowerMenu({ gdkmonitor, menuState }: WindowCustomProps) {
    return <window
        class="PowerMenu"
        name={`power-menu-${gdkmonitor.get_model()}`}
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.NORMAL}
        anchor={Astal.WindowAnchor.TOP |
            Astal.WindowAnchor.RIGHT}
        visible={menuState.as(s => s === `power-menu-button-${gdkmonitor.get_model()}` ? true : false)}
        application={app}>
        <box class={"power-menu-box shadow"} vertical>
            <Shutdown />
            <Restart />
            <Sleep />
            <LogOut />
        </box>
    </window>
}
