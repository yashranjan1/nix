import { setMenuState } from "../../../app";
import { MenuInput } from "../../../types/menuInput";


export default function PowerMenu({ monitor, state }: MenuInput) {

    return (
        <button
            class={state.as(s => s === `power-menu-button-${monitor}` ? "control-center-btn bar-item-active" : "control-center-btn")}
            onClick={() => {
                if (state.get() === `power-menu-button-${monitor}`) {
                    setMenuState("none")
                }
                else {
                    setMenuState(`power-menu-button-${monitor}`)
                }
            }}
        >
            <icon icon="system-shutdown-symbolic" />
        </button>
    )
}
