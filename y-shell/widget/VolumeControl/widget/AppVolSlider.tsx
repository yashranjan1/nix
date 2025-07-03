import { createBinding } from "ags";
import Wp from "gi://AstalWp";

export default function AppVolSlider({ source }: { source: Wp.Stream }) {
    return (
        <box class={"app-vol"}>
            <button onClick={() => source.get_mute() ? source.set_mute(false) : source.set_mute(true)}>
                <icon icon={source.get_icon()} />
            </button>
            <slider
                hexpand
                onDragged={({ value }) => source.volume = value}
                value={createBinding(source, "volume")}
            />
        </box>
    )
}
