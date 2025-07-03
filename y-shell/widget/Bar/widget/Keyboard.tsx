import { createPoll } from "ags/time"

export default function KeyBoardLayout() {
    const name = createPoll("A", 1000, 'fcitx5-remote', (out, _) => out)

    return <box
        class={"language-indicator"}
    >
        <box class={"kb-layout"}>
            <label label={name.as(state => state === "1" ? 'A' : 'あ')} />
        </box>
    </box>
}
