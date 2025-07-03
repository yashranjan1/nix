import { setMenuState } from "../../../app"
import { MenuInput } from "../../../types/menuInput"

export default function Notifications({ monitor, state }: MenuInput) {

    return <button
        class={state.as(s => s === `notification-center-${monitor}` ? "control-center-btn bar-item-active" : "control-center-btn")}
        onClick={() => {
            if (state.get() === `notification-center-${monitor}`) {
                setMenuState("none")
            }
            else {
                setMenuState(`notification-center-${monitor}`)
            }
        }}
    >
        <icon icon="notifications-applet-symbolic" />
    </button>
}
