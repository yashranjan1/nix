import Calendar from "@Calendar/Calendar"
import app from "ags/gtk3/app"
import Astal from "gi://Astal?version=3.0"
import { WindowCustomProps } from "../../types/windowCustomProps"

export default function CalendarCenter({ gdkmonitor, menuState }: WindowCustomProps) {


    return <window
        class="Calendar"
        name={`calendar-center-${gdkmonitor.get_model()}`}
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.NORMAL}
        anchor={Astal.WindowAnchor.TOP}
        visible={menuState.as(s => s === `date-${gdkmonitor.get_model()}` ? true : false)}
        application={app}>
        <box class={"calendar-center-box shadow"}>
            <Calendar />
        </box>
    </window>
}
