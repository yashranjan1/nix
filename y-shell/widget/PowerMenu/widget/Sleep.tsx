import { execAsync } from "ags/process"

export default function Sleep() {
    return (
        <button onClick={() => execAsync("systemctl suspend")} class="sleep">
            <box>
                <icon icon="weather-clear-night-symbolic" />
                <label label="Sleep" />
            </box>
        </button>
    )
}
