import { DateProps } from "../../../types/dateProps"
import { setMenuState } from "../../../app"
import { createPoll } from "ags/time"
import GLib from "gi://GLib?version=2.0"


function Date({ format = "%-k:%M", monitor, state }: DateProps) {
    const time = createPoll("", 1000, () => GLib.DateTime.new_now_local().format(format))


    return <button class={state.as(s => s === `date-${monitor}` ? "date-btn bar-item-active" : "date-btn")}
        onClick={() => {
            if (state.get() === `date-${monitor}`) {
                setMenuState("none")
            }
            else {
                setMenuState(`date-${monitor}`)
            }
        }}
    >
        <label
            class="date"
            name={`date-${monitor}`}
            label={time(time => `${time}`)}
        />
    </button>
}

export default Date;
