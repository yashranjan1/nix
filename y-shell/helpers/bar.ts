import { writeFileAsync } from "ags/file";
import { execAsync } from "ags/process";
import app from "ags/gtk3/app";
import { userPath } from "../variables/user";

export const splitBar = async (is_split: boolean) => {
    const fileName = is_split ? "split" : "connected";
    const css = `@import "${userPath.get()}/.config/ags/widget/Bar/${fileName}";`;

    try {
        await writeFileAsync(
            `${userPath.get()}/.local/share/ags-editable/bar_style.scss`,
            css,
        );
        await execAsync(["sass", "./style.scss", "/tmp/style.css"]);
        app.reset_css();
        app.apply_css(`/tmp/style.css`);
    } catch (err) {
        print(err);
    }
};
